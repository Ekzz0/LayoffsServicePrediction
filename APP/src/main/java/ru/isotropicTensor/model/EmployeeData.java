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
public class EmployeeData {
    private int id;
    @JsonProperty("Group")
    private String group;
    @JsonProperty("SentMessages")
    private int sentMessages;
    @JsonProperty("ReceivedMessages")
    private int receivedMessages;
    @JsonProperty("MessagesOutsideWorkHours")
    private int messagesOutsideWorkHours;
    @JsonProperty("SentFrequency")
    private int SentFrequency;
    @JsonProperty("ReceivedFrequency")
    private int ReceivedFrequency;
    @JsonProperty("sent_received_ratio")
    private double sentReceivedRatio;
    @JsonProperty("UniqueRecipients")
    private int uniqueRecipients;
    @JsonProperty("hidden_copy")
    private int hiddenCopy;
    @JsonProperty("carbon_copy")
    private int carbonCopy;
    @JsonProperty("text_length")
    private int textLength;
    @JsonProperty("BytesSentReceivedRatio")
    private double bytesSentReceivedRatio;
    @JsonProperty("question_marks")
    private int questionMarks;
    @JsonProperty("response_time")
    private int responseTime;
    @JsonProperty("MessagesReadLater")
    private int messagesReadLater;
    @JsonProperty("DaysBetweenReceivedAndRead")
    private int daysBetweenReceivedAndRead;
    @JsonProperty("answered_messages")
    private int answeredMessages;
    @JsonProperty("unanswered_messages")
    private int unansweredMessages;
    @JsonProperty("unreplied_messages")
    private int unrepliedMessages;
    @JsonProperty("mention_colleagues")
    private int mentionColleagues;
    @JsonProperty("MoodType")
    private int moodType;
    @JsonProperty("StressKeywordsPresent")
    private int stressKeywordsPresent;
    @JsonProperty("SalaryChangeMentioned")
    private int salaryChangeMentioned;
    @JsonProperty("VacationMentioned")
    private int vacationMentioned;
    @JsonProperty("polite_message")
    private int politeMessage;
}
