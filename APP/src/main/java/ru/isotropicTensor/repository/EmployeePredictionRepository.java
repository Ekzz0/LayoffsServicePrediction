package ru.isotropicTensor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.isotropicTensor.model.EmployeePrediction;

public interface EmployeePredictionRepository extends JpaRepository<EmployeePrediction, Integer> {
}
