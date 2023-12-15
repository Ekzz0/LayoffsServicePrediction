package ru.isotropicTensor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.isotropicTensor.model.EmployeeReport;

public interface EmployeeReportRepository extends JpaRepository<EmployeeReport, Integer> {
}
