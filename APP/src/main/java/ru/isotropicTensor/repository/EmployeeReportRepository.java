package ru.isotropicTensor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.isotropicTensor.model.EmployeeReport;

import java.time.LocalDateTime;
import java.util.List;

public interface EmployeeReportRepository extends JpaRepository<EmployeeReport, Integer> {
    @Query("SELECT er FROM EmployeeReport er WHERE er.date = :date")
    List<EmployeeReport> findByDate(@Param("date") LocalDateTime date);

    @Query("SELECT er FROM EmployeeReport er WHERE er.date = :date AND er.employee.id = :employeeId")
    EmployeeReport findByIdAndDate(
            @Param("employeeId") Integer employeeId,
            @Param("date") LocalDateTime date
    );
}
