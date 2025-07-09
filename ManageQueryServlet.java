import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/ManageQueryServlet")
public class ManageQueryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> queryList = new ArrayList<>();

        try {
            Connection con = Database.getConnection();
            String sql = "SELECT * FROM queries ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

           while (rs.next()) {
    Map<String, String> query = new HashMap<>();
    query.put("id", String.valueOf(rs.getInt("id")));
    query.put("name", rs.getString("name"));
    query.put("email", rs.getString("email"));
    query.put("message", rs.getString("message"));
    String status = rs.getString("status");
    if (status == null || status.trim().isEmpty()) {
        status = "Unsolved";
    }
    query.put("status", status);
    queryList.add(query);
}


            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("queryList", queryList);
        RequestDispatcher rd = request.getRequestDispatcher("admin_queries.jsp");
        rd.forward(request, response);
    }
}
