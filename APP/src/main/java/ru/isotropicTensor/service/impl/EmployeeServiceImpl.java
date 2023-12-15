package ru.isotropicTensor.service.impl;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.isotropicTensor.dto.ApiResponse;
import ru.isotropicTensor.utils.EmployeeReportSerializer;
import ru.isotropicTensor.service.EmployeeService;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    private final String mlApiURL = "http://localhost:8889/api";

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
