import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail {
    public static void sendEmail(String recipient, String subject, String messageText) {
    final String senderEmail = "shanubloodbank@gmail.com";
    final String senderPassword = "ShanuBBMS101";

Properties properties = new Properties();
properties.put("mail.smtp.host", "smtp.gmail.com");
properties.put("mail.smtp.port", "587");
properties.put("mail.smtp.auth", "true");
properties.put("mail.smtp.starttls.enable", "true");



    Session session = Session.getInstance(properties, new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(senderEmail, senderPassword);
        }
    });

    try {
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
        message.setSubject(subject);
        message.setText(messageText);

        Transport.send(message);
        System.out.println("Email sent successfully to " + recipient);
    } catch (MessagingException e) {
        e.printStackTrace();
        System.out.println("Failed to send email to " + recipient + ": " + e.getMessage());
    }
}
    public static void main(String[] args) {
    sendEmail("zunerasayyed110@gmail.com", "Test Email", "This is a test email.");
}


}
