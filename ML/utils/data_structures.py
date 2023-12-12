from dataclasses import dataclass
from typing import List

from pydantic import BaseModel, Field


class PersonData(BaseModel):
    id: int = Field(..., title="ID")
    SentMessages: int = Field(..., title="SentMessages")
    ReceivedMessages: int = Field(..., title="ReceivedMessages")
    MessagesOutsideWorkHours: int = Field(..., title="MessagesOutsideWorkHours")
    SentFrequency: int = Field(..., title="SentFrequency")
    ReceivedFrequency: int = Field(..., title="ReceivedFrequency")
    sent_received_ratio: float = Field(..., title="sent_received_ratio")
    UniqueRecipients: int = Field(..., title="UniqueRecipients")
    hidden_copy: int = Field(..., title="hidden_copy")
    carbon_copy: int = Field(..., title="carbon_copy")
    text_length: int = Field(..., title="text_length")
    BytesSentReceivedRatio: float = Field(..., title="BytesSentReceivedRatio")
    question_marks: int = Field(..., title="question_marks")
    response_time: int = Field(..., title="response_time")
    MessagesReadLater: int = Field(..., title="MessagesReadLater")
    DaysBetweenReceivedAndRead: int = Field(..., title="DaysBetweenReceivedAndRead")
    answered_messages: int = Field(..., title="answered_messages")
    unanswered_messages: int = Field(..., title="unanswered_messages")
    unreplied_messages: int = Field(..., title="unreplied_messages")
    mention_colleagues: int = Field(..., title="mention_colleagues")
    MoodType: int = Field(..., title="MoodType")
    StressKeywordsPresent: int = Field(..., title="StressKeywordsPresent")
    SalaryChangeMentioned: int = Field(..., title="SalaryChangeMentioned")
    VacationMentioned: int = Field(..., title="VacationMentioned")
    polite_message: int = Field(..., title="polite_message")
    Group: str = Field(..., title="Group")


class UsersProbability(BaseModel):
    id: int = Field(..., title="ID")
    probability: float = Field(..., title="Probability")
    Group: str = Field(..., title="Group")
    TopFeatures: str = Field(..., title="TopFeatures")


class ResponsePredict(BaseModel):
    status: int
    data: List[UsersProbability]


# Класс для response после fit
class Score(BaseModel):
    precision: float
    recall: float
    f1: float


@dataclass
class FeatureImportance:
    features: list[str]
    importance: list[float]
