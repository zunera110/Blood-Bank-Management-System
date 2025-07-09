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

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            Connection con = Database.getConnection();
            String bloodGroup = request.getParameter("bloodGroup");
            if (bloodGroup != null) {
                bloodGroup = bloodGroup.replace(" ", "+");
            }
            int requestedQuantity = Integer.parseInt(request.getParameter("requestedQuantity"));
            String checkStockQuery = "SELECT quantity FROM blood_stock WHERE bloodGroup = ?";
            PreparedStatement checkStockPst = con.prepareStatement(checkStockQuery);
            checkStockPst.setString(1, bloodGroup);
            ResultSet rs = checkStockPst.executeQuery();

            if (rs.next()) {
                int availableQuantity = rs.getInt("quantity");

                if (availableQuantity >= requestedQuantity) {
                    // Update stock
                    String updateStockQuery = "UPDATE blood_stock SET quantity = quantity - ? WHERE bloodGroup = ?";
                    PreparedStatement updateStockPst = con.prepareStatement(updateStockQuery);
                    updateStockPst.setInt(1, requestedQuantity);
                    updateStockPst.setString(2, bloodGroup);
                    updateStockPst.executeUpdate();
                    String updateStatusQuery = "UPDATE blood_requests SET status = 'Paid' WHERE bloodGroup = ? AND status = 'Pending Payment'";
                    PreparedStatement updateStatusPst = con.prepareStatement(updateStatusQuery);
                    updateStatusPst.setString(1, bloodGroup);
                    updateStatusPst.executeUpdate();
                    out.println("<script>alert('Payment Successful! Blood Request Processed.'); window.location='home.jsp';</script>");
                } else {
                    out.println("<script>alert('Error: Not enough blood stock available.'); window.history.back();</script>");
                }
            } else {
                out.println("<script>alert('Error: Blood group not available.'); window.history.back();</script>");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Payment failed. Please try again!'); window.history.back();</script>");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    try {
        Connection con = Database.getConnection();
        String bloodGroup = request.getParameter("bloodGroup");
        if (bloodGroup != null) {
            bloodGroup = bloodGroup.replace(" ", "+");
        }
        int availableQuantity = 0;
        String checkStockQuery = "SELECT quantity FROM blood_stock WHERE bloodGroup = ?";
        PreparedStatement checkStockPst = con.prepareStatement(checkStockQuery);
        checkStockPst.setString(1, bloodGroup);
        ResultSet rs = checkStockPst.executeQuery();
        if (rs.next()) {
            availableQuantity = rs.getInt("quantity");
        }
        request.setAttribute("bloodGroup", bloodGroup);
        request.setAttribute("availableQuantity", availableQuantity);
        request.getRequestDispatcher("payment.jsp").forward(request, response);
        con.close();
        } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().println("<script>alert('Error fetching blood stock.'); window.history.back();</script>");
        }
    }
}
