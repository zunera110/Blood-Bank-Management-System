import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteRequestServlet")
public class DeleteRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int requestId = Integer.parseInt(request.getParameter("id"));

        try {
            Connection con = Database.getConnection();
            String sql = "DELETE FROM blood_requests WHERE id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, requestId);
            pst.executeUpdate();

            response.sendRedirect("ManageRequestsServlet");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
