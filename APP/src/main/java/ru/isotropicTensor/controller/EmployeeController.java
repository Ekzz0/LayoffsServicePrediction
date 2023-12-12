package ru.isotropicTensor.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.isotropicTensor.model.ApiResponse;
import ru.isotropicTensor.service.EmployeeService;

@RestController
@RequestMapping("/api")
public class EmployeeController {
    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @PostMapping("/send-data")
    public ResponseEntity<String> getPredict(@RequestBody String jsonData) {
        ApiResponse apiResponse = employeeService.getEmployeePredict(jsonData);

        // Проверить статус
        if (apiResponse.getStatus() == HttpStatus.OK) {
            // Если статус OK, вернуть данные
            return ResponseEntity.ok(apiResponse.getData());
        } else {
            // В противном случае вернуть ошибку с соответствующим статусом
            return ResponseEntity.status(apiResponse.getStatus()).body("Error occurred");
        }
    }
}
