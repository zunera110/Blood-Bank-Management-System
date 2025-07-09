import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CampServlet")
public class CampServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String campName = request.getParameter("camp_name");
        String location = request.getParameter("location");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String organizer = request.getParameter("organizer");
        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO donation_camps (camp_name, location, date, time, organizer) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, campName);
            stmt.setString(2, location);
            stmt.setString(3, date);
            stmt.setString(4, time);
            stmt.setString(5, organizer);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("CampServlet");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        StringBuilder tableContent = new StringBuilder();
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT * FROM donation_camps ORDER BY date DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                tableContent.append("<tr>")
                        .append("<td>").append(rs.getString("camp_name")).append("</td>")
                        .append("<td>").append(rs.getString("location")).append("</td>")
                        .append("<td>").append(rs.getString("date")).append("</td>")
                        .append("<td>").append(rs.getString("time")).append("</td>")
                        .append("<td>").append(rs.getString("organizer")).append("</td>")
                        .append("<td><a href='DeleteCampServlet?id=").append(rs.getInt("id")).append("' class='btn btn-danger btn-sm'>Delete</a></td>")
                        .append("</tr>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("tableContent", tableContent.toString());
        request.getRequestDispatcher("admin_camps.jsp").forward(request, response);
    }
}
