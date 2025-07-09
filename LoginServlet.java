import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("Login Attempt: Username = " + username + ", Password = " + password);
        try {
            Connection con = Database.getConnection();
            if (con == null) {
                System.out.println("Database connection failed!");
                response.sendRedirect("index.jsp?error=Database Connection Failed");
                return;
            }
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("Login Successful for: " + username);
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("home.jsp");
            } else {
                System.out.println("Invalid Login for: " + username);
                response.sendRedirect("index.jsp?error=Invalid Username or Password");
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=Database Error: " + e.getMessage());
        }
    }
}
