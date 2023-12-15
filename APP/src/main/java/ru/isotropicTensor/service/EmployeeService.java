package ru.isotropicTensor.service;

import ru.isotropicTensor.dto.ApiResponse;
import ru.isotropicTensor.utils.EmployeeReportSerializer;

import java.util.List;

public interface EmployeeService {
    ApiResponse getEmployeePredict(List<EmployeeReportSerializer> dataList);
}
