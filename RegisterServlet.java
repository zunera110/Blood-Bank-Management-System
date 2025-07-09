import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String usernameRegex = "^[A-Za-z]+$";
        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8}$";
        if (!username.matches(usernameRegex)) {
            response.sendRedirect("userregister.jsp?error=Invalid username. Only letters allowed.");
            return;
        }
        if (!password.matches(passwordRegex)) {
            response.sendRedirect("userregister.jsp?error=Invalid password. Must be 8 characters with 1 uppercase, 1 lowercase, 1 number, and 1 special character.");
            return;
        }
        try {
            Connection con = Database.getConnection();
            if (con == null) {
                response.sendRedirect("userregister.jsp?error=Database Connection Failed");
                return;
            }
            String sql = "INSERT INTO users (full_name, username, email, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setString(4, password);
            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("userregister.jsp?success=true");
            } else {
                response.sendRedirect("userregister.jsp?error=Registration Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("userregister.jsp?error=" + e.getMessage());
        }
    }
}
