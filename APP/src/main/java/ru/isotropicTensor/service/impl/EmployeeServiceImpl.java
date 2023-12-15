package ru.isotropicTensor.service.impl;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.isotropicTensor.dto.ApiResponse;
import ru.isotropicTensor.repository.EmployeePredictionRepository;
import ru.isotropicTensor.repository.EmployeeReportRepository;
import ru.isotropicTensor.repository.EmployeeRepository;
import ru.isotropicTensor.utils.EmployeeReportSerializer;
import ru.isotropicTensor.service.EmployeeService;

import java.util.List;

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
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<List<EmployeeReportSerializer>> request = new HttpEntity<>(dataList, headers);

        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<ApiResponse> response = restTemplate.exchange(
                mlApiURL + "/predict",
                HttpMethod.POST,
                request,
                ApiResponse.class);
        ApiResponse apiResponse = response.getBody();


        // TODO: Почитать что RestTemplate возвращает, обработать исключения и так далее.
        return apiResponse;
    }
}
