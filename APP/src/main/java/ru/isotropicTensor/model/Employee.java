package ru.isotropicTensor.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "employee")
public class Employee {
    @Id
    private int id;
    private String department;

    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private List<EmployeeReport> employeeReports;

    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private List<EmployeePrediction> predictions;
}
