package ru.isotropicTensor.service;

import jakarta.mail.MessagingException;

public interface MailSenderService {
    void sendReports() throws MessagingException;
}
