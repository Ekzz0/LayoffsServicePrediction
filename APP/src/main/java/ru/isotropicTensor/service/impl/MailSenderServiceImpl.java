package ru.isotropicTensor.service.impl;

import ru.isotropicTensor.repository.DirectorRepository;
import ru.isotropicTensor.repository.EmployeePredictionRepository;
import ru.isotropicTensor.repository.EmployeeReportRepository;
import ru.isotropicTensor.repository.EmployeeRepository;
import ru.isotropicTensor.service.MailSenderService;

public class MailSenderServiceImpl implements MailSenderService {

    private final EmployeeRepository employeeRepository;
    private final EmployeePredictionRepository employeePredictionRepository;

    private final DirectorRepository directorRepository;

    public MailSenderServiceImpl(EmployeeRepository employeeRepository, EmployeePredictionRepository employeePredictionRepository, DirectorRepository directorRepository) {
        this.employeeRepository = employeeRepository;
        this.employeePredictionRepository = employeePredictionRepository;
        this.directorRepository = directorRepository;
    }

    @Override
    public void sendReports() {

    }
}
