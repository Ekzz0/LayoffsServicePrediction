package ru.isotropicTensor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.isotropicTensor.model.Employee;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

}
