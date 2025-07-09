import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/DonorLoginServlet")
public class DonorLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            Connection con = Database.getConnection();
            String sql = "SELECT * FROM donors WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
//            HttpSession session = request.getSession();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
//            response.sendRedirect(request.getContextPath() + "/DDashboardServlet");
              response.sendRedirect("DDashboardServlet");
            } else {
//                session.setAttribute("errorMessage", "Incorrect Username or Password");
                response.sendRedirect("DonorLogin.jsp?error=Invalid Username or Password");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}