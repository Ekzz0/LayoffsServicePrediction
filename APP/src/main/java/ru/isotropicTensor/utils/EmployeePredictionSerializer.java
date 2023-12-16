package ru.isotropicTensor.utils;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EmployeePredictionSerializer {
    private int id;
    private float probability;
    @JsonProperty("Group")
    private String department;
    @JsonProperty("TopFeatures")
    private List<String> topFeatures;
    private String details;
}
