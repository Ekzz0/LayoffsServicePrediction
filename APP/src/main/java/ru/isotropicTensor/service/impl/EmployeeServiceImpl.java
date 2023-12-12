package ru.isotropicTensor.service.impl;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.isotropicTensor.service.EmployeeService;
@Service
public class EmployeeServiceImpl implements EmployeeService {

    private final String mlApiURL = "http://localhost:8889";

    @Override
    public ResponseEntity<String> getEmployeePredict(String personData) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<String> request = new HttpEntity<>(personData, headers);

        RestTemplate restTemplate = new RestTemplate();
        //TODO: потом переделать на POST
        ResponseEntity<String> response = restTemplate.exchange(
                mlApiURL + "/predict",
                HttpMethod.POST,
                request,
                String.class);


        // TODO: Почитать что RestTemplate возвращает, обработать исключения и так далее.
        return response;
    }
}
