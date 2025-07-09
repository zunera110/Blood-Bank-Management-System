import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateDonorServlet")
public class UpdateDonorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        String fullName = request.getParameter("fullName");
        String age = request.getParameter("age");
        String bloodGroup = request.getParameter("bloodGroup");

        try {
            Connection con = Database.getConnection();
            PreparedStatement pst = con.prepareStatement("UPDATE donors SET fullName=?, age=?, bloodGroup=? WHERE id=?");
            pst.setString(1, fullName);
            pst.setString(2, age);
            pst.setString(3, bloodGroup);
            pst.setString(4, id);

            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                response.sendRedirect("ManageDonorsServlet");
            } else {
                response.getWriter().println("Update failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
