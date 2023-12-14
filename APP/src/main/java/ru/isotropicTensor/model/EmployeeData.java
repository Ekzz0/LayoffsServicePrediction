package ru.isotropicTensor.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ru.isotropicTensor.utils.StringToDoubleDeserializer;
import ru.isotropicTensor.utils.StringToIntegerDeserializer;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class EmployeeData {
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int id;

    @JsonProperty("Group")
    private String group;

    @JsonProperty("SentMessages")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int sentMessages;

    @JsonProperty("ReceivedMessages")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int receivedMessages;

    @JsonProperty("MessagesOutsideWorkHours")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int messagesOutsideWorkHours;

    @JsonProperty("SentFrequency")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int SentFrequency;

    @JsonProperty("ReceivedFrequency")
    private int ReceivedFrequency;

    @JsonProperty("sent_received_ratio")
    @JsonDeserialize(using = StringToDoubleDeserializer.class)
    private double sentReceivedRatio;

    @JsonProperty("UniqueRecipients")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int uniqueRecipients;

    @JsonProperty("hidden_copy")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int hiddenCopy;

    @JsonProperty("carbon_copy")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int carbonCopy;

    @JsonProperty("text_length")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int textLength;

    @JsonProperty("BytesSentReceivedRatio")
    @JsonDeserialize(using = StringToDoubleDeserializer.class)
    private double bytesSentReceivedRatio;

    @JsonProperty("question_marks")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int questionMarks;

    @JsonProperty("response_time")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int responseTime;

    @JsonProperty("MessagesReadLater")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int messagesReadLater;

    @JsonProperty("DaysBetweenReceivedAndRead")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int daysBetweenReceivedAndRead;

    @JsonProperty("answered_messages")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int answeredMessages;

    @JsonProperty("unanswered_messages")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int unansweredMessages;

    @JsonProperty("unreplied_messages")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int unrepliedMessages;

    @JsonProperty("mention_colleagues")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int mentionColleagues;

    @JsonProperty("MoodType")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int moodType;

    @JsonProperty("StressKeywordsPresent")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int stressKeywordsPresent;

    @JsonProperty("SalaryChangeMentioned")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int salaryChangeMentioned;

    @JsonProperty("VacationMentioned")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int vacationMentioned;

    @JsonProperty("polite_message")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int politeMessage;
}
