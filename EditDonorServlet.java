import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/EditDonorServlet")
public class EditDonorServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String donorId = request.getParameter("id");

        if (donorId == null || donorId.isEmpty()) {
            response.getWriter().println("Invalid Donor ID");
            return;
        }
        try {
            Connection con = Database.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM donors WHERE id = ?");
            pst.setString(1, donorId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                request.setAttribute("id", rs.getString("id"));
                request.setAttribute("fullName", rs.getString("fullName"));
                request.setAttribute("age", rs.getString("age"));
                request.setAttribute("bloodGroup", rs.getString("bloodGroup"));
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("EditDonor.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
