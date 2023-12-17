package ru.isotropicTensor.service;

import ru.isotropicTensor.dto.ApiResponse;
import ru.isotropicTensor.dto.EmployeePredictsDto;
import ru.isotropicTensor.dto.PredictsDto;
import ru.isotropicTensor.utils.EmployeeReportSerializer;

import java.time.LocalDateTime;
import java.util.List;

public interface EmployeeService {
    ApiResponse getEmployeePredict(List<EmployeeReportSerializer> dataList);
    ApiResponse getPredictByDate(LocalDateTime dateTime);
    EmployeePredictsDto getEmployeePredictsById(int id);
    PredictsDto getRecentPredicts();
}
