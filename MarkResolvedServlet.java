import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MarkResolvedServlet")
public class MarkResolvedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int queryId = Integer.parseInt(request.getParameter("id"));

        try {
            Connection con = Database.getConnection();
            String sql = "UPDATE queries SET status='Resolved' WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, queryId);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("ManageQueryServlet?message=Query Marked as Resolved");
            } else {
                response.sendRedirect("ManageQueryServlet?error=Failed to Mark as Resolved");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ManageQueryServlet?error=Something went wrong");
        }
    }
}
