import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteDonorServlet")
public class DeleteDonorServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            Connection con = Database.getConnection();
            String query = "DELETE FROM donors WHERE id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, id);
            pst.executeUpdate();
            response.sendRedirect("ManageDonorsServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting donor: " + e.getMessage());
        }
    }
}
