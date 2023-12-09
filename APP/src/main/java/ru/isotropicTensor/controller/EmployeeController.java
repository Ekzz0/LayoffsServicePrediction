package ru.isotropicTensor.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import ru.isotropicTensor.entity.Person;
import ru.isotropicTensor.service.EmployeeService;

@RestController
public class EmployeeController {
    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @PostMapping("/")
    public ResponseEntity<Person> getPredict(@RequestBody String jsonData) {
        System.out.println("Данные пришли: " + "\n" + jsonData);
        return employeeService.getEmployeePredict(jsonData);
    }
}
