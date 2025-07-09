import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/QueryServlet")
public class QueryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        try {
            Connection con = Database.getConnection();
            String sql = "INSERT INTO queries (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, message);
            stmt.executeUpdate();
            stmt.close();
            con.close();
            response.sendRedirect("home.jsp?msg=Query Sent Successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp?msg=Error Sending Query");
        }
    }
}
