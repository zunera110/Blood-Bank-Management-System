import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DonorRegisterServlet")
public class DonorRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        
        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String ageStr = request.getParameter("age");
        String gender = request.getParameter("gender");
        String bloodGroup = request.getParameter("bloodGroup");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String password = request.getParameter("password");

        if (fullName == null || username == null || ageStr == null || gender == null || bloodGroup == null ||
            address == null || email == null || contactNumber == null || password == null ||
            fullName.isEmpty() || username.isEmpty() || ageStr.isEmpty() || gender.isEmpty() || bloodGroup.isEmpty() ||
            address.isEmpty() || email.isEmpty() || contactNumber.isEmpty() || password.isEmpty()) {
            
            session.setAttribute("errorMessage", "All fields are required!");
            response.sendRedirect("donorRegister.jsp");
            return;
        }

        int age;
        try {
            age = Integer.parseInt(ageStr);
        } catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "Invalid age input!");
            response.sendRedirect("donorRegister.jsp");
            return;
        }

        try {
            Connection con = Database.getConnection();

            // Store password as plain text
            String query = "INSERT INTO donors (fullName, username, age, gender, bloodGroup, address, email, contactNumber, password, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'Donation Pending')";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, fullName);
            pstmt.setString(2, username);
            pstmt.setInt(3, age);
            pstmt.setString(4, gender);
            pstmt.setString(5, bloodGroup);
            pstmt.setString(6, address);
            pstmt.setString(7, email);
            pstmt.setString(8, contactNumber);
            pstmt.setString(9, password);

            int row = pstmt.executeUpdate();

            if (row > 0) {
                session.setAttribute("successMessage", "Registration Successful!");
                response.sendRedirect("donorRegister.jsp");
            } else {
                session.setAttribute("errorMessage", "Registration failed. Try again.");
                response.sendRedirect("donorRegister.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error: " + e.getMessage());
            response.sendRedirect("donorRegister.jsp");
        }
    }
}
