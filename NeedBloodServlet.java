import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NeedBloodServlet")
public class NeedBloodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            Connection con = Database.getConnection();

            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String bloodGroup = request.getParameter("bloodGroup");
            String contactNumber = request.getParameter("contactNumber");
            String message = request.getParameter("message");
            String checkStockQuery = "SELECT quantity FROM blood_stock WHERE bloodGroup = ?";
            PreparedStatement checkStockPst = con.prepareStatement(checkStockQuery);
            checkStockPst.setString(1, bloodGroup);
            ResultSet rs = checkStockPst.executeQuery();
            if (rs.next()) {
                int availableQuantity = rs.getInt("quantity");
                if (availableQuantity > 0) {
                    String insertRequestQuery =  "INSERT INTO blood_requests (fullName, email, bloodGroup, contactNumber, message, status) VALUES (?, ?, ?, ?, ?, ?)";
                    PreparedStatement pst = con.prepareStatement(insertRequestQuery);
                    pst.setString(1, fullName);
                    pst.setString(2, email);
                    pst.setString(3, bloodGroup);
                    pst.setString(4, contactNumber);
                    pst.setString(5, message);
                    pst.setString(6, "Pending Payment"); 
                    pst.executeUpdate();
                    con.close();
                    response.sendRedirect("PaymentServlet?bloodGroup=" + bloodGroup);
                } else {
                request.getSession().setAttribute("errorMessage", "Requested blood group is out of stock.");
                response.sendRedirect("needBlood.jsp");
                }
            } else {
            request.getSession().setAttribute("errorMessage", "Requested blood group is not available.");
            response.sendRedirect("needBlood.jsp");
            }
        }catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.history.back();</script>");
        }
    }
}
