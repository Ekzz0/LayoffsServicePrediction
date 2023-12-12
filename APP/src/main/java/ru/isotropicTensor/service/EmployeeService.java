package ru.isotropicTensor.service;

import org.springframework.http.ResponseEntity;
import ru.isotropicTensor.model.ApiResponse;

public interface EmployeeService {
    ApiResponse getEmployeePredict(String personData);
}
