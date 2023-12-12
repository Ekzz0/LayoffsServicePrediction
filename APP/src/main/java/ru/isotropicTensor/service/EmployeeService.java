package ru.isotropicTensor.service;

import ru.isotropicTensor.model.ApiResponse;

public interface EmployeeService {
    ApiResponse getEmployeePredict(String personData);
}
