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

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int totalDonors = 0;
        int totalRequests = 0;
        int bloodStock = 0;
        try {
            Connection con = Database.getConnection();
            System.out.println("Database connected successfully");
            String donorQuery = "SELECT COUNT(*) FROM donors";
            PreparedStatement pst1 = con.prepareStatement(donorQuery);
            ResultSet rs1 = pst1.executeQuery();
            if (rs1.next()) {
                totalDonors = rs1.getInt(1);
            }
            System.out.println("Total Donors: " + totalDonors);
            String requestQuery = "SELECT COUNT(*) FROM blood_requests";
            PreparedStatement pst2 = con.prepareStatement(requestQuery);
            ResultSet rs2 = pst2.executeQuery();
            if (rs2.next()) {
                totalRequests = rs2.getInt(1);
            }
            System.out.println("Total Requests: " + totalRequests);
            String stockQuery = "SELECT SUM(quantity) FROM blood_stock";
            PreparedStatement pst3 = con.prepareStatement(stockQuery);
            ResultSet rs3 = pst3.executeQuery();
            if (rs3.next()) {
                bloodStock = rs3.getInt(1);
            }
            System.out.println("Total Blood Stock: " + bloodStock);
            rs1.close(); rs2.close(); rs3.close();
            pst1.close(); pst2.close(); pst3.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("totalDonors", totalDonors);
        request.setAttribute("totalRequests", totalRequests);
        request.setAttribute("bloodStock", bloodStock);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
