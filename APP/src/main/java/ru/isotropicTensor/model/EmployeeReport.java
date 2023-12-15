package ru.isotropicTensor.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.*;

import java.time.LocalDateTime;


@Getter
@Setter
@EqualsAndHashCode(exclude = "id")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "employee_report")
public class EmployeeReport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    private Employee employee;
    private String department;
    private LocalDateTime date;
    private int sentMessages;
    private int receivedMessages;
    private int messagesOutsideWorkHours;
    private int sentFrequency;
    private int receivedFrequency;
    private double sentReceivedRatio;
    private int uniqueRecipients;
    private int hiddenCopy;
    private int carbonCopy;
    private int textLength;
    private double bytesSentReceivedRatio;
    private int questionMarks;
    private int responseTime;
    private int messagesReadLater;
    private int daysBetweenReceivedAndRead;
    private int answeredMessages;
    private int unansweredMessages;
    private int unrepliedMessages;
    private int mentionColleagues;
    private int moodType;
    private int stressKeywordsPresent;
    private int salaryChangeMentioned;
    private int vacationMentioned;
    private int politeMessage;
}
