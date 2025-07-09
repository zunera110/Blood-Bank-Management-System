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

@WebServlet("/ViewDonorServlet")
public class ViewDonorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String donorId = request.getParameter("id");
        if (donorId == null) {
            response.getWriter().println("Invalid Donor ID");
            return;
        }
        try {
            Connection con = Database.getConnection();
            if (con == null) {
                response.getWriter().println("Database connection failed");
                return;
            }
            String query = "SELECT * FROM donors WHERE id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, donorId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                request.setAttribute("id", rs.getString("id"));
                request.setAttribute("fullName", rs.getString("fullName"));
                request.setAttribute("username", rs.getString("username"));
                request.setAttribute("age", rs.getString("age"));
                request.setAttribute("gender", rs.getString("gender"));
                request.setAttribute("bloodGroup", rs.getString("bloodGroup"));
                request.setAttribute("address", rs.getString("address"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("contactNumber", rs.getString("contactNumber"));
                RequestDispatcher dispatcher = request.getRequestDispatcher("ViewDonor.jsp");
                dispatcher.forward(request, response);
            } else {
                response.getWriter().println("Donor not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
