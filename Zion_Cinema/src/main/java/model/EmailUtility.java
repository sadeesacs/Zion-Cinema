package model;

import java.util.Properties;
import java.util.Random;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailUtility {

    // Method to send OTP
    public static String sendOtp(String host, String port, final String user, final String pass, String toEmail) throws Exception {
        // Generate a random OTP
        Random random = new Random();
        String otp = String.format("%06d", random.nextInt(1000000));

        // Set properties for SMTP server
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Create session
        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            // Compose email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Your OTP for Transaction Cancellation");
            message.setText("Dear User,\n\nYour OTP for transaction cancellation is: " + otp + "\n\nThank you.");

            // Send email
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new MessagingException("Failed to send email: " + e.getMessage());
        }

        return otp;
    }

    // Method to send a transaction cancellation confirmation email
    public static void sendCancellationEmail(String host, String port, final String user, final String pass, String toEmail, String transactionId) throws Exception {
        // Set properties for SMTP server
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Create session
        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            // Compose email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Transaction Cancellation Confirmation");
            message.setText("Dear User,\n\nYour transaction with Receipt Number " + transactionId + " has been successfully cancelled.\n\nThank you.");

            // Send email
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new MessagingException("Failed to send email: " + e.getMessage());
        }
    }
}
