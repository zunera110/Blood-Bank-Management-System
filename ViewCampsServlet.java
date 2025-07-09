import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewCampsServlet")
public class ViewCampsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        StringBuilder tableContent = new StringBuilder();
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT * FROM donation_camps WHERE date >= CURDATE() ORDER BY date ASC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                tableContent.append("<tr>")
                        .append("<td>").append(rs.getString("camp_name")).append("</td>")
                        .append("<td>").append(rs.getString("location")).append("</td>")
                        .append("<td>").append(rs.getString("date")).append("</td>")
                        .append("<td>").append(rs.getString("time")).append("</td>")
                        .append("<td>").append(rs.getString("organizer")).append("</td>")
                        .append("</tr>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("tableContent", tableContent.toString());
        request.getRequestDispatcher("camps.jsp").forward(request, response);
    }
}
