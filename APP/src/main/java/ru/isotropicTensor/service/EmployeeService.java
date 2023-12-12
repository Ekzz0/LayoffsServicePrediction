package ru.isotropicTensor.service;

import ru.isotropicTensor.model.ApiResponse;
import ru.isotropicTensor.model.EmployeeData;

import java.util.List;

public interface EmployeeService {
    ApiResponse getEmployeePredict(List<EmployeeData> dataList);
}
