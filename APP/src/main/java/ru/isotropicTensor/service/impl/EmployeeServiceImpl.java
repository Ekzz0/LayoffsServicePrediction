package ru.isotropicTensor.service.impl;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.isotropicTensor.model.ApiResponse;
import ru.isotropicTensor.service.EmployeeService;
@Service
public class EmployeeServiceImpl implements EmployeeService {

    private final String mlApiURL = "http://localhost:8889";

    @Override
    public ApiResponse getEmployeePredict(String personData) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<String> request = new HttpEntity<>(personData, headers);

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
