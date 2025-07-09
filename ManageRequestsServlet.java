import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/ManageRequestsServlet")
public class ManageRequestsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> requests = new ArrayList<>();
        try {
            Connection con = Database.getConnection();
            String sql = "SELECT * FROM blood_requests";
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Map<String, String> req = new HashMap<>();
                req.put("id", String.valueOf(rs.getInt("id")));
                req.put("fullName", rs.getString("fullName"));
                req.put("email", rs.getString("email"));
                req.put("bloodGroup", rs.getString("bloodGroup"));
                req.put("contactNumber", rs.getString("contactNumber"));
                req.put("message", rs.getString("message"));
                req.put("status", rs.getString("status")); // ✅ Fetch Status
                requests.add(req);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("requests", requests);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ManageRequests.jsp");
        dispatcher.forward(request, response);
    }
}
