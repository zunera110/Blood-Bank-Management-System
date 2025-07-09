import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MarkPaidServlet")
public class MarkPaidServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Connection con = Database.getConnection();
            String sql = "UPDATE blood_requests SET status = 'Paid' WHERE id = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("ManageRequestsServlet");
    }
}
