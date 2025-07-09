import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("fullName");
        String username = request.getParameter("username");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String bloodGroup = request.getParameter("bloodGroup");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String contact = request.getParameter("contactNumber");

        // Connection object to handle the database connection
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Using the custom Database class to get the connection
            conn = Database.getConnection();  // Assuming Database.getConnection() works fine
            
            // SQL query to update donor profile
            String sql = "UPDATE donors SET fullName = ?, age = ?, gender = ?, bloodGroup = ?, address = ?, email = ?, contactNumber = ? WHERE username = ?";
            
            // Prepare statement for execution
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, age);
            stmt.setString(3, gender);
            stmt.setString(4, bloodGroup);
            stmt.setString(5, address);
            stmt.setString(6, email);
            stmt.setString(7, contact);
            stmt.setString(8, username);

            // Execute the update
            int rowsUpdated = stmt.executeUpdate();

            // Check if any rows were updated
            if (rowsUpdated > 0) {
                // Update the session with the new profile data
                HttpSession session = request.getSession();
                session.setAttribute("fullName", name);
                session.setAttribute("age", age);
                session.setAttribute("gender", gender);
                session.setAttribute("bloodGroup", bloodGroup);
                session.setAttribute("address", address);
                session.setAttribute("email", email);
                session.setAttribute("contactNumber", contact);

                // Redirect back to the donor dashboard
                response.sendRedirect("DonorDashboard.jsp");
            } else {
                // If no rows were updated, show an error message
                request.setAttribute("errorMessage", "Profile update failed. Please try again.");
                request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL exceptions, e.g., connection errors or query issues
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
        } finally {
            // Close resources in the finally block
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
