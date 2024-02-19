package ru.isotropicTensor.controller;

import jakarta.mail.MessagingException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.isotropicTensor.dto.ApiResponse;
import ru.isotropicTensor.dto.EmployeePredictsDto;
import ru.isotropicTensor.dto.PredictsDto;
import ru.isotropicTensor.service.MailSenderService;
import ru.isotropicTensor.utils.EmployeeReportSerializer;
import ru.isotropicTensor.utils.EmployeePredictionSerializer;
import ru.isotropicTensor.service.EmployeeService;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000")
public class EmployeeController {
    private final EmployeeService employeeService;
    private final MailSenderService mailSenderService;

    public EmployeeController(EmployeeService employeeService, MailSenderService mailSenderService) {
        this.employeeService = employeeService;
        this.mailSenderService = mailSenderService;
    }

    @PostMapping("/send-data")
    public ResponseEntity<List<EmployeePredictionSerializer>> getPredict(@RequestBody List<EmployeeReportSerializer> dataList) {
        //TODO Убирать пустую строку из передаваемого Json
        ApiResponse apiResponse = employeeService.getEmployeePredict(dataList);

        // Проверить статус
        if (apiResponse.getStatus() == HttpStatus.OK.value()) {
            // Если статус OK, вернуть данные
            return ResponseEntity.ok(apiResponse.getData());
        } else {
            // В противном случае вернуть ошибку с соответствующим статусом
            return ResponseEntity.status(apiResponse.getStatus()).body(null);
        }
    }
    @GetMapping("/persons")
    public ResponseEntity<EmployeePredictsDto> getPredictsById(@RequestParam(name = "id") int id) {
        EmployeePredictsDto employeePredictsDto = employeeService.getEmployeePredictsById(id);
        if (employeePredictsDto == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        } else {
            return ResponseEntity.ok(employeePredictsDto);
        }
    }
    @GetMapping("/get-history")
    public ResponseEntity<PredictsDto> getRecentPredicts() {
        PredictsDto recentPredicts = employeeService.getRecentPredicts();
        if (recentPredicts == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        } else {
            return ResponseEntity.ok(recentPredicts);
        }
    }
    @GetMapping("/get-predict-by-date")
    public ResponseEntity<ApiResponse> getPredictByDate(@RequestParam(name = "selected_table") LocalDateTime dateTime) {
        ApiResponse apiResponse = employeeService.getPredictByDate(dateTime);
        return ResponseEntity.status(HttpStatus.resolve(apiResponse.getStatus())).body(apiResponse);
    }

    @GetMapping("/predict-with-page")
    public ResponseEntity<ApiResponse> getPredictByDateWithPage(@RequestParam(name = "selected_table") LocalDateTime dateTime,
                                                                @RequestParam(name = "page") int pageNumber) {
        ApiResponse apiResponse = employeeService.getPredictByDateWithPage(dateTime, pageNumber);
        return ResponseEntity.status(HttpStatus.resolve(apiResponse.getStatus())).body(apiResponse);
    }

    @GetMapping("/send-report")
    private ResponseEntity<?> sendReportsToDirectors() {
        try {
            mailSenderService.sendReports();
            return ResponseEntity.ok().build();
        } catch (MessagingException e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().build();
        }
    }

}
