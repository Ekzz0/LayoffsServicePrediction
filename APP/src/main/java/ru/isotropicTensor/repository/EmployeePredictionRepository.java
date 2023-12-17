package ru.isotropicTensor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.isotropicTensor.model.EmployeePrediction;

import java.time.LocalDateTime;
import java.util.List;

public interface EmployeePredictionRepository extends JpaRepository<EmployeePrediction, Integer> {
    @Query("SELECT ep.date FROM EmployeePrediction ep GROUP BY ep.date")
    List<LocalDateTime> findAllByDate();

    @Query("SELECT ep FROM EmployeePrediction ep WHERE ep.date = :date")
    List<EmployeePrediction> findByDate(@Param("date") LocalDateTime date);

    @Query("SELECT ep FROM EmployeePrediction ep WHERE ep.date = (SELECT MAX(e.date) FROM EmployeePrediction e)")
    List<EmployeePrediction> findLatestPredictions();

}
