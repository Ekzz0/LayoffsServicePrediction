package ru.isotropicTensor.service;

import ru.isotropicTensor.dto.ApiResponse;
import ru.isotropicTensor.dto.EmployeePredictsDto;
import ru.isotropicTensor.utils.EmployeeReportSerializer;

import java.util.List;

public interface EmployeeService {
    ApiResponse getEmployeePredict(List<EmployeeReportSerializer> dataList);
    EmployeePredictsDto getEmployeePredictsById(int id);
}
