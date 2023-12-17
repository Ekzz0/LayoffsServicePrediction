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
    SentReceivedRatio: float = Field(..., title="SentReceivedRatio")
    UniqueRecipients: int = Field(..., title="UniqueRecipients")
    HiddenCopy: int = Field(..., title="HiddenCopy")
    CarbonCopy: int = Field(..., title="CarbonCopy")
    TextLength: int = Field(..., title="TextLength")
    BytesSentReceivedRatio: float = Field(..., title="BytesSentReceivedRatio")
    QuestionMarks: int = Field(..., title="QuestionMarks")
    ResponseTime: int = Field(..., title="ResponseTime")
    MessagesReadLater: int = Field(..., title="MessagesReadLater")
    DaysBetweenReceivedAndRead: int = Field(..., title="DaysBetweenReceivedAndRead")
    AnsweredMessages: int = Field(..., title="AnsweredMessages")
    UnansweredMessages: int = Field(..., title="UnansweredMessages")
    UnrepliedMessages: int = Field(..., title="UnrepliedMessages")
    MentionColleagues: int = Field(..., title="MentionColleagues")
    MoodType: int = Field(..., title="MoodType")
    StressKeywordsPresent: int = Field(..., title="StressKeywordsPresent")
    SalaryChangeMentioned: int = Field(..., title="SalaryChangeMentioned")
    VacationMentioned: int = Field(..., title="VacationMentioned")
    PoliteMessage: int = Field(..., title="PoliteMessage")
    Group: str = Field(..., title="Group")



class PersonDataTrain(PersonData):
    Resigned: int = Field(..., title="Resigned")


class UsersProbability(BaseModel):
    id: int = Field(..., title="ID")
    probability: float = Field(..., title="Probability")
    Group: str = Field(..., title="Group")
    TopFeatures: List[str] = Field(..., title="TopFeatures")


# Класс для response после fit
class Score(BaseModel):
    precision: float
    recall: float
    f1: float
    support: float


class ClassificationReport(BaseModel):
    not_resign: Score
    resign: Score
    macro_avg: Score
    weighted_avg: Score
    accuracy: float


class ResponseFit(BaseModel):
    status: int
    data: ClassificationReport


class ResponsePredict(BaseModel):
    status: int
    data: List[UsersProbability]


class BaseResponse(BaseModel):
    status: int
    data: str
