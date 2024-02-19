package ru.isotropicTensor.dto;

import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmployeePredictsDto {
    private int employeeId;
    private List<LocalDateTime> dates;
    private List<Float> probability;
    private float currentProbability;
    private String department;
    private String details;
    private List<String> topFeatures;
}
