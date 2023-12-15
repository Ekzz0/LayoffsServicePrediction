package ru.isotropicTensor.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ru.isotropicTensor.utils.EmployeePredictionSerializer;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ApiResponse {
    private int status;
    private List<EmployeePredictionSerializer> data;
}
