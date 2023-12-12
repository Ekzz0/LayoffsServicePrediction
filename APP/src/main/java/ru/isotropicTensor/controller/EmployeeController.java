package ru.isotropicTensor.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.isotropicTensor.model.ApiResponse;
import ru.isotropicTensor.model.EmployeeData;
import ru.isotropicTensor.model.EmployeePredictionData;
import ru.isotropicTensor.service.EmployeeService;

import java.util.List;

@RestController
@RequestMapping("/api")
public class EmployeeController {
    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @PostMapping("/send-data")
    public ResponseEntity<List<EmployeePredictionData>> getPredict(@RequestBody List<EmployeeData> dataList) {
        ApiResponse apiResponse = employeeService.getEmployeePredict(dataList);

        // Проверить статус
        if (apiResponse.getStatus() == HttpStatus.OK.value()) {
            // Если статус OK, вернуть данные
            return ResponseEntity.ok(apiResponse.getData());
        } else {
            // В противном случае вернуть ошибку с соответствующим статусом
            return ResponseEntity.status(apiResponse.getStatus()).body(null);
        }
    }
}
