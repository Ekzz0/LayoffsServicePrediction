package ru.isotropicTensor.model;

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
public class EmployeePredictionData {
    private int id;
    private float probability;
    @JsonProperty("Group")
    private String group;
    @JsonProperty("TopFeatures")
    private List<String> topFeatures;
}
