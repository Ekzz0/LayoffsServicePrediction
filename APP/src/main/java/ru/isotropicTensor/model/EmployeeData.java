package ru.isotropicTensor.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
//TODO на данный момент с фронта приходит Json в котором значения всех полей - строки
// Однако, при согласовании Api были утверждены иные типы, пока перепишу на String, потом переделать как надо

public class EmployeeData {
    private String id;
    @JsonProperty("Group")
    private String group;
    @JsonProperty("SentMessages")
    private String sentMessages;
    @JsonProperty("ReceivedMessages")
    private String receivedMessages;
    @JsonProperty("MessagesOutsideWorkHours")
    private String messagesOutsideWorkHours;
    @JsonProperty("SentFrequency")
    private String SentFrequency;
    @JsonProperty("ReceivedFrequency")
    private String ReceivedFrequency;
    @JsonProperty("sent_received_ratio")
    private String sentReceivedRatio;
    @JsonProperty("UniqueRecipients")
    private String uniqueRecipients;
    @JsonProperty("hidden_copy")
    private String hiddenCopy;
    @JsonProperty("carbon_copy")
    private String carbonCopy;
    @JsonProperty("text_length")
    private String textLength;
    @JsonProperty("BytesSentReceivedRatio")
    private String bytesSentReceivedRatio;
    @JsonProperty("question_marks")
    private String questionMarks;
    @JsonProperty("response_time")
    private String responseTime;
    @JsonProperty("MessagesReadLater")
    private String messagesReadLater;
    @JsonProperty("DaysBetweenReceivedAndRead")
    private String daysBetweenReceivedAndRead;
    @JsonProperty("answered_messages")
    private String answeredMessages;
    @JsonProperty("unanswered_messages")
    private String unansweredMessages;
    @JsonProperty("unreplied_messages")
    private String unrepliedMessages;
    @JsonProperty("mention_colleagues")
    private String mentionColleagues;
    @JsonProperty("MoodType")
    private String moodType;
    @JsonProperty("StressKeywordsPresent")
    private String stressKeywordsPresent;
    @JsonProperty("SalaryChangeMentioned")
    private String salaryChangeMentioned;
    @JsonProperty("VacationMentioned")
    private String vacationMentioned;
    @JsonProperty("polite_message")
    private String politeMessage;
}
