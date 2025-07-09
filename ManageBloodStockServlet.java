import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ManageBloodStockServlet")
public class ManageBloodStockServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Connection con = new Database().getConnection()) {
            if ("add".equals(action)) {
                String bloodGroup = request.getParameter("bloodGroup");
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                PreparedStatement pst = con.prepareStatement("INSERT INTO blood_stock (bloodGroup, quantity) VALUES (?, ?)");
                pst.setString(1, bloodGroup);
                pst.setInt(2, quantity);
                pst.executeUpdate();
            } 
            else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String bloodGroup = request.getParameter("bloodGroup");
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                PreparedStatement pst = con.prepareStatement("UPDATE blood_stock SET bloodGroup=?, quantity=? WHERE id=?");
                pst.setString(1, bloodGroup);
                pst.setInt(2, quantity);
                pst.setInt(3, id);
                pst.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("ManageBloodStockServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

//        if ("delete".equals(action)) {
//            int id = Integer.parseInt(request.getParameter("id"));
//
//            try (Connection con = new Database().getConnection()) {
//                PreparedStatement pst = con.prepareStatement("DELETE FROM blood_stock WHERE id=?");
//                pst.setInt(1, id);
//                pst.executeUpdate();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//            response.sendRedirect("ManageBloodStockServlet");
//            return;
//        }
if ("reduce".equals(action)) {
    int id = Integer.parseInt(request.getParameter("id"));

    try (Connection con = new Database().getConnection()) {
        // First, get current quantity
        PreparedStatement selectPst = con.prepareStatement("SELECT quantity FROM blood_stock WHERE id=?");
        selectPst.setInt(1, id);
        ResultSet rs = selectPst.executeQuery();

        if (rs.next()) {
            int quantity = rs.getInt("quantity");
            if (quantity > 1) {
                // Decrease by 1
                PreparedStatement updatePst = con.prepareStatement("UPDATE blood_stock SET quantity=? WHERE id=?");
                updatePst.setInt(1, quantity - 1);
                updatePst.setInt(2, id);
                updatePst.executeUpdate();
            } else {
                // Delete record if quantity reaches 0
                PreparedStatement deletePst = con.prepareStatement("DELETE FROM blood_stock WHERE id=?");
                deletePst.setInt(1, id);
                deletePst.executeUpdate();
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    response.sendRedirect("ManageBloodStockServlet");
    return;
}



        // Fetch blood stock data
        List<Map<String, String>> stockList = new ArrayList<>();
        try (Connection con = new Database().getConnection();
             PreparedStatement pst = con.prepareStatement("SELECT * FROM blood_stock");
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                Map<String, String> stock = new HashMap<>();
                stock.put("id", String.valueOf(rs.getInt("id")));
                stock.put("bloodGroup", rs.getString("bloodGroup"));
                stock.put("quantity", String.valueOf(rs.getInt("quantity")));
                stockList.add(stock);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("stockList", stockList);
        request.getRequestDispatcher("ManageBloodStock.jsp").forward(request, response);
    }
}
