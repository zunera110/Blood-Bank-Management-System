import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCampServlet")
public class DeleteCampServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null) {
            try {
                Connection con = Database.getConnection();
                String sql = "DELETE FROM donation_camps WHERE id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(id));
                int rowsAffected = ps.executeUpdate();
                ps.close();
                con.close();
                response.sendRedirect("CampServlet");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("CampServlet");
        }
    }
}
