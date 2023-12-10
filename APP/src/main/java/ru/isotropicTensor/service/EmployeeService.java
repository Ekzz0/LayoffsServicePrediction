package ru.isotropicTensor.service;

import org.springframework.http.ResponseEntity;
import ru.isotropicTensor.entity.Person;

public interface EmployeeService {
    ResponseEntity<String> getEmployeePredict(String personData);
}
