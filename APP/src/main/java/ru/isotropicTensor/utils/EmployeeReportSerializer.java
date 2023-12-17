package ru.isotropicTensor.utils;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ru.isotropicTensor.utils.serializers.StringToDoubleDeserializer;
import ru.isotropicTensor.utils.serializers.StringToIntegerDeserializer;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeReportSerializer {
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int id;

    @JsonProperty("Group")
    private String department;

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
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int ReceivedFrequency;

    @JsonProperty("SentReceivedRatio")
    @JsonDeserialize(using = StringToDoubleDeserializer.class)
    private double sentReceivedRatio;

    @JsonProperty("UniqueRecipients")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int uniqueRecipients;

    @JsonProperty("HiddenCopy")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int hiddenCopy;

    @JsonProperty("CarbonCopy")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int carbonCopy;

    @JsonProperty("TextLength")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int textLength;

    @JsonProperty("BytesSentReceivedRatio")
    @JsonDeserialize(using = StringToDoubleDeserializer.class)
    private double bytesSentReceivedRatio;

    @JsonProperty("QuestionMarks")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int questionMarks;

    @JsonProperty("ResponseTime")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int responseTime;

    @JsonProperty("MessagesReadLater")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int messagesReadLater;

    @JsonProperty("DaysBetweenReceivedAndRead")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int daysBetweenReceivedAndRead;

    @JsonProperty("AnsweredMessages")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int answeredMessages;

    @JsonProperty("UnansweredMessages")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int unansweredMessages;

    @JsonProperty("UnrepliedMessages")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int unrepliedMessages;

    @JsonProperty("MentionColleagues")
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

    @JsonProperty("PoliteMessage")
    @JsonDeserialize(using = StringToIntegerDeserializer.class)
    private int politeMessage;

    @Override
    public String toString() {
        return  "sentMessages=" + sentMessages +
                ", receivedMessages=" + receivedMessages +
                ", messagesOutsideWorkHours=" + messagesOutsideWorkHours +
                ", SentFrequency=" + SentFrequency +
                ", ReceivedFrequency=" + ReceivedFrequency +
                ", sentReceivedRatio=" + sentReceivedRatio +
                ", uniqueRecipients=" + uniqueRecipients +
                ", hiddenCopy=" + hiddenCopy +
                ", carbonCopy=" + carbonCopy +
                ", textLength=" + textLength +
                ", bytesSentReceivedRatio=" + bytesSentReceivedRatio +
                ", questionMarks=" + questionMarks +
                ", responseTime=" + responseTime +
                ", messagesReadLater=" + messagesReadLater +
                ", daysBetweenReceivedAndRead=" + daysBetweenReceivedAndRead +
                ", answeredMessages=" + answeredMessages +
                ", unansweredMessages=" + unansweredMessages +
                ", unrepliedMessages=" + unrepliedMessages +
                ", mentionColleagues=" + mentionColleagues +
                ", moodType=" + moodType +
                ", stressKeywordsPresent=" + stressKeywordsPresent +
                ", salaryChangeMentioned=" + salaryChangeMentioned +
                ", vacationMentioned=" + vacationMentioned +
                ", politeMessage=" + politeMessage +
                ';';
    }
}
