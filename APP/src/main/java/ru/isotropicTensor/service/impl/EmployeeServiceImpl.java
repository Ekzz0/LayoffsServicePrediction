package ru.isotropicTensor.service.impl;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.isotropicTensor.dto.ApiResponse;
import ru.isotropicTensor.model.Employee;
import ru.isotropicTensor.model.EmployeeReport;
import ru.isotropicTensor.repository.EmployeePredictionRepository;
import ru.isotropicTensor.repository.EmployeeReportRepository;
import ru.isotropicTensor.repository.EmployeeRepository;
import ru.isotropicTensor.utils.EmployeeReportSerializer;
import ru.isotropicTensor.service.EmployeeService;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public ApiResponse getEmployeePredict(List<EmployeeReportSerializer> dataList) {
        //Получение списка сотрудников в репорте
        Map<Integer, Employee> employees = findOrSaveEmployeesById(dataList);
        //Получение списка репортов
        List<EmployeeReport> transientReports = getTransientReportsFromSerializer(dataList, employees);
        //Сохранение в базу данных
        List<EmployeeReport> persistantReports = employeeReportRepository.saveAll(transientReports);

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


        // TODO: Почитать что RestTemplate возвращает, обработать исключения и так далее.
        return apiResponse; // Отправка результатов предикта в контроллер
    }

    private List<EmployeeReport> getTransientReportsFromSerializer(List<EmployeeReportSerializer> dataList,
                                                                   Map<Integer, Employee> employeeMap) {
        List<EmployeeReport> employeeReports = new ArrayList<>();

        for (EmployeeReportSerializer employeeReportSerializer : dataList) {
            int employeeId = employeeReportSerializer.getId();
            employeeReports.add(buildTransientEmployeeReport(employeeReportSerializer, employeeMap.get(employeeId)));
        }
        return employeeReports;
    }


    private EmployeeReport buildTransientEmployeeReport(EmployeeReportSerializer employeeReportSerializer,
                                                        Employee employee) {
        return EmployeeReport.builder()
                .employee(employee)
                .department(employeeReportSerializer.getDepartment())
                .date(LocalDateTime.now())
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

        /*
        for (EmployeeReportSerializer reportSerializer : reportSerializers) {

            Employee persitentEmployee = employeeRepository.getById(reportSerializer.getId());
            if (persitentEmployee == null) {
                Employee transientEmployee = Employee.builder()
                        .id(reportSerializer.getId())
                        .department(reportSerializer.getDepartment())
                        .build();
                employeeRepository.save(transientEmployee);
                employees.add(transientEmployee);

            } else {
                employees.add(persitentEmployee);
            }

        }
        */

        return employees;
    }
}
