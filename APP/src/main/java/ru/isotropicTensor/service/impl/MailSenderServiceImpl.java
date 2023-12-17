package ru.isotropicTensor.service.impl;

import com.opencsv.CSVWriter;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import ru.isotropicTensor.model.Director;
import ru.isotropicTensor.model.EmployeePrediction;
import ru.isotropicTensor.repository.DirectorRepository;
import ru.isotropicTensor.repository.EmployeePredictionRepository;
import ru.isotropicTensor.repository.EmployeeRepository;
import ru.isotropicTensor.service.MailSenderService;

import java.io.IOException;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class MailSenderServiceImpl implements MailSenderService {
    @Autowired
    private final JavaMailSender mailSender;
    private final EmployeeRepository employeeRepository;
    private final EmployeePredictionRepository employeePredictionRepository;
    private final DirectorRepository directorRepository;

    public MailSenderServiceImpl(JavaMailSender javaMailSender, EmployeeRepository employeeRepository, EmployeePredictionRepository employeePredictionRepository, DirectorRepository directorRepository) {
        this.mailSender = javaMailSender;
        this.employeeRepository = employeeRepository;
        this.employeePredictionRepository = employeePredictionRepository;
        this.directorRepository = directorRepository;
    }

    @Override
    public void sendReports() throws MessagingException {
        List<EmployeePrediction> predictions = employeePredictionRepository.findLatestPredictions();
        if (!predictions.isEmpty()) {
            Set<String> departments = predictions.stream()
                    .map(prediction -> prediction.getEmployee().getDepartment())
                    .collect(Collectors.toSet());
            List<Director> directors = directorRepository.findByDepartmentIn(departments);
            Map<String, List<EmployeePrediction>> predictionsByDepartment = predictions.stream()
                    .collect(Collectors.groupingBy(prediction -> prediction.getEmployee().getDepartment()));

            for(Director director : directors) {
                sendReport(director, predictionsByDepartment.get(director.getDepartment()));
            }
        }

    }

    private void sendReport(Director director, List<EmployeePrediction> employeePredictions) throws MessagingException {
        String csvContent = generatePredictionInCSV(employeePredictions);
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, StandardCharsets.UTF_8.name());
        helper.setFrom("rassylsikp@gmail.com");
        helper.setTo(director.getEmail());
        helper.setSubject("LayoffsServicePrediction for department: " + director.getDepartment());
        helper.setText("Добрый день! Прогноз с вероятностями увольнения ваших сотрудников во вложении.");

        InputStreamSource attachment = new ByteArrayResource(csvContent.getBytes(StandardCharsets.UTF_8));

        helper.addAttachment("predict.csv", attachment, "text/csv");

        mailSender.send(message);
    }

    private String generatePredictionInCSV(List<EmployeePrediction> employeePredictions) {
        try (StringWriter stringWriter = new StringWriter();
             CSVWriter writer = new CSVWriter(stringWriter, ';', '"', '"', "\n")) {
            String[] headers = {"id", "department", "probability"};
            writer.writeNext(headers);

            for (EmployeePrediction prediction : employeePredictions) {
                String[] data = {String.valueOf(prediction.getEmployee().getId()), prediction.getEmployee().getDepartment(), String.valueOf(prediction.getProbability())};
                writer.writeNext(data);
            }

            return stringWriter.toString();

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }




}
