package ru.isotropicTensor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ru.isotropicTensor.model.EmployeePrediction;

import java.time.LocalDateTime;
import java.util.List;

public interface EmployeePredictionRepository extends JpaRepository<EmployeePrediction, Integer> {
    @Query("SELECT ep.date FROM EmployeePrediction ep GROUP BY ep.date")
    List<LocalDateTime> findAllByDate();
}
