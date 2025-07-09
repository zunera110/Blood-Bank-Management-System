import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddBloodStockServlet")
public class AddBloodStockServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bloodGroup = request.getParameter("bloodGroup");
        String quantityStr = request.getParameter("quantity");

        int quantity = 0;
        try {
            quantity = Integer.parseInt(quantityStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid quantity format.");
            request.getRequestDispatcher("AddBloodStock.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Database.getConnection();

            // First, check if the blood group already exists
            String checkQuery = "SELECT quantity FROM blood_stock WHERE bloodGroup = ?";
            pstmt = conn.prepareStatement(checkQuery);
            pstmt.setString(1, bloodGroup);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // If blood group exists, update the quantity
                String updateQuery = "UPDATE blood_stock SET quantity = quantity + ? WHERE bloodGroup = ?";
                pstmt = conn.prepareStatement(updateQuery);
                pstmt.setInt(1, quantity);
                pstmt.setString(2, bloodGroup);
                pstmt.executeUpdate();
            } else {
                // If blood group doesn't exist, insert a new row
                String insertQuery = "INSERT INTO blood_stock (bloodGroup, quantity) VALUES (?, ?)";
                pstmt = conn.prepareStatement(insertQuery);
                pstmt.setString(1, bloodGroup);
                pstmt.setInt(2, quantity);
                pstmt.executeUpdate();
            }

            request.setAttribute("message", "Blood stock updated successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        request.getRequestDispatcher("ManageBloodStockServlet").forward(request, response);
    }
}
