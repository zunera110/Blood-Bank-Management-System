import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ReplyQueryServlet")
public class ReplyQueryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String adminReply = request.getParameter("adminReply");

        final String fromEmail = "shanubloodbank@gmail.com"; // ✅ Replace with sender email
        final String password = "shanuBB@211";     // ✅ Use App Password for Gmail

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Reply to Your Query - Blood Bank");
            message.setText(adminReply);

            Transport.send(message);
            response.sendRedirect("ManageQueryServlet?msg=replySuccess");
        } catch (Exception e) {
            e.printStackTrace();  // Check server logs to debug if it still fails
            response.sendRedirect("ManageQueryServlet?msg=replyFailed");
        }
    }
}
