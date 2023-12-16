package ru.isotropicTensor.service.impl;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.isotropicTensor.dto.ApiResponse;
import ru.isotropicTensor.dto.EmployeePredictsDto;
import ru.isotropicTensor.dto.PredictsDto;
import ru.isotropicTensor.model.Employee;
import ru.isotropicTensor.model.EmployeePrediction;
import ru.isotropicTensor.model.EmployeeReport;
import ru.isotropicTensor.repository.EmployeePredictionRepository;
import ru.isotropicTensor.repository.EmployeeReportRepository;
import ru.isotropicTensor.repository.EmployeeRepository;
import ru.isotropicTensor.utils.EmployeePredictionSerializer;
import ru.isotropicTensor.utils.EmployeeReportSerializer;
import ru.isotropicTensor.service.EmployeeService;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    private final EmployeeRepository employeeRepository;
    private final EmployeeReportRepository employeeReportRepository;
    private final EmployeePredictionRepository employeePredictionRepository;
    private final String mlApiURL = "http://localhost:8889/api";

    public EmployeeServiceImpl(EmployeeRepository employeeRepository, EmployeeReportRepository employeeReportRepository, EmployeePredictionRepository employeePredictionRepository) {
        this.employeeRepository = employeeRepository;
        this.employeeReportRepository = employeeReportRepository;
        this.employeePredictionRepository = employeePredictionRepository;
    }

    @Override
    public EmployeePredictsDto getEmployeePredictsById(int id) {

        List<EmployeePrediction> predictions = employeeRepository.getById(id).getPredictions();
        if (predictions.isEmpty()) {
            return null;
        } else {
            List<LocalDateTime> dates = new ArrayList<>();
            List<Float> probability = new ArrayList<>();
            for (EmployeePrediction prediction : predictions) {
                dates.add(prediction.getDate());
                probability.add(prediction.getProbability());
            }

            return new EmployeePredictsDto(dates, probability);
        }
    }

    @Override
    public PredictsDto getRecentPredicts() {
        List<LocalDateTime> predictions = employeePredictionRepository.findAllByDate();
        if (!predictions.isEmpty()) {
            PredictsDto predictsDto = new PredictsDto();
            predictsDto.setData(predictions
                    .stream()
                    .map(LocalDateTime::toString)
                    .collect(Collectors.toList()));
            return predictsDto;
        } else {
            return null;
        }

    }

    @Override
    public ApiResponse getEmployeePredict(List<EmployeeReportSerializer> dataList) {
        Map<Integer, EmployeeReportSerializer> detailsMap = dataList.stream()
                .collect(Collectors.toMap(EmployeeReportSerializer::getId, obj -> obj));

        //Получение списка сотрудников в репорте
        Map<Integer, Employee> employees = findOrSaveEmployeesById(dataList);

        // Построение запроса к Ml сервису
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<List<EmployeeReportSerializer>> request = new HttpEntity<>(dataList, headers);
        RestTemplate restTemplate = new RestTemplate();
        // Отправка запроса к Ml сервису
        ResponseEntity<ApiResponse> response = restTemplate.exchange(
                mlApiURL + "/predict",
                HttpMethod.POST,
                request,
                ApiResponse.class);
        ApiResponse apiResponse = response.getBody(); // Получение ответа

        if (apiResponse.getStatus() == HttpStatus.OK.value()) {

            LocalDateTime timeStamp = LocalDateTime.now();
            //Получение списка репортов
            List<EmployeeReport> transientReports = getTransientReportsFromSerializer(dataList, employees, timeStamp);
            //Сохранение в базу данных
            List<EmployeeReport> persistantReports = employeeReportRepository.saveAll(transientReports);
            // Сохранение предиктов в Бд, если всё хорошо
            List<EmployeePrediction> transientPredictions = getTransientPredictionsFromSerializer(apiResponse.getData(),
                    employees, timeStamp);
            List<EmployeePrediction> persistantPredictions = employeePredictionRepository.saveAll(transientPredictions);
        }

        List<EmployeePredictionSerializer> serializers = apiResponse.getData();
        for (EmployeePredictionSerializer serializer : serializers) {
            serializer.setDetails(detailsMap.get(serializer.getId()).toString());
        }


        // TODO: Почитать что RestTemplate возвращает, обработать исключения и так далее.
        return apiResponse; // Отправка результатов предикта в контроллер
    }

    private List<EmployeePrediction> getTransientPredictionsFromSerializer(List<EmployeePredictionSerializer> data,
                                                                             Map<Integer, Employee> employees,
                                                                           LocalDateTime timeStamp) {
        List<EmployeePrediction> predictions = new ArrayList<>();
        for (EmployeePredictionSerializer serializer : data) {
            int employeeId = serializer.getId();
            predictions.add(buildTransientPrediction(serializer, employees.get(employeeId), timeStamp));
        }
        return predictions;
    }



    private List<EmployeeReport> getTransientReportsFromSerializer(List<EmployeeReportSerializer> dataList,
                                                                   Map<Integer, Employee> employeeMap,
                                                                   LocalDateTime timeStamp) {
        List<EmployeeReport> employeeReports = new ArrayList<>();
        for (EmployeeReportSerializer employeeReportSerializer : dataList) {
            int employeeId = employeeReportSerializer.getId();
            employeeReports.add(buildTransientEmployeeReport(
                                    employeeReportSerializer,
                                    employeeMap.get(employeeId),
                                    timeStamp
                            ));
        }
        return employeeReports;
    }

    private Map<Integer, Employee> findOrSaveEmployeesById(List<EmployeeReportSerializer> reportSerializers) {
        //TODO переделать на оптимальный запрос, где делается одно обращение к бд, а затем сохраняются все сотрудники,
        // кто не был представлен в бд.
        Map<Integer, Employee> employees = new HashMap();
        for (EmployeeReportSerializer reportSerializer : reportSerializers) {
            if (!employeeRepository.existsById(reportSerializer.getId())) {
                Employee transientEmployee = Employee.builder()
                        .id(reportSerializer.getId())
                        .department(reportSerializer.getDepartment())
                        .build();
                Employee persistentEmployee = employeeRepository.save(transientEmployee);
                employees.put(persistentEmployee.getId(),persistentEmployee);
            } else {
                Employee persistentEmployee = employeeRepository.getById(reportSerializer.getId());
                employees.put(persistentEmployee.getId(),persistentEmployee);
            }
        }
        return employees;
    }


    private EmployeePrediction buildTransientPrediction(EmployeePredictionSerializer serializer,
                                                        Employee employee, LocalDateTime timeStamp) {
        return EmployeePrediction.builder()
                .employee(employee)
                .date(timeStamp)
                .probability(serializer.getProbability())
                .topFeatures(serializer.getTopFeatures())
                .build();
    }

    private EmployeeReport buildTransientEmployeeReport(EmployeeReportSerializer employeeReportSerializer,
                                                        Employee employee, LocalDateTime timeStamp) {
        return EmployeeReport.builder()
                .employee(employee)
                .department(employeeReportSerializer.getDepartment())
                .date(timeStamp)
                .sentMessages(employeeReportSerializer.getSentMessages())
                .receivedMessages(employeeReportSerializer.getReceivedMessages())
                .messagesOutsideWorkHours(employeeReportSerializer.getMessagesOutsideWorkHours())
                .sentFrequency(employeeReportSerializer.getSentFrequency())
                .receivedFrequency(employeeReportSerializer.getReceivedFrequency())
                .sentReceivedRatio(employeeReportSerializer.getSentReceivedRatio())
                .uniqueRecipients(employeeReportSerializer.getUniqueRecipients())
                .hiddenCopy(employeeReportSerializer.getHiddenCopy())
                .carbonCopy(employeeReportSerializer.getCarbonCopy())
                .textLength(employeeReportSerializer.getTextLength())
                .bytesSentReceivedRatio(employeeReportSerializer.getBytesSentReceivedRatio())
                .questionMarks(employeeReportSerializer.getQuestionMarks())
                .responseTime(employeeReportSerializer.getResponseTime())
                .messagesReadLater(employeeReportSerializer.getMessagesReadLater())
                .daysBetweenReceivedAndRead(employeeReportSerializer.getDaysBetweenReceivedAndRead())
                .answeredMessages(employeeReportSerializer.getAnsweredMessages())
                .unansweredMessages(employeeReportSerializer.getUnansweredMessages())
                .unrepliedMessages(employeeReportSerializer.getUnrepliedMessages())
                .mentionColleagues(employeeReportSerializer.getMentionColleagues())
                .moodType(employeeReportSerializer.getMoodType())
                .stressKeywordsPresent(employeeReportSerializer.getStressKeywordsPresent())
                .salaryChangeMentioned(employeeReportSerializer.getSalaryChangeMentioned())
                .vacationMentioned(employeeReportSerializer.getVacationMentioned())
                .politeMessage(employeeReportSerializer.getPoliteMessage())
                .build();
    }
}
