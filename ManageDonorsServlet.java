import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/ManageDonorsServlet")
public class ManageDonorsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("ManageDonorsServlet: Servlet called");

        try {
            Connection con = Database.getConnection();
            if (con == null) {
                System.out.println("ManageDonorsServlet: Database connection failed");
                response.getWriter().println("Database connection failed");
                return;
            }

            String query = "SELECT * FROM donors";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            ArrayList<String[]> donorsList = new ArrayList<>();
            while (rs.next()) {
                System.out.println("Donor Found: " + rs.getString("fullName")); // Debugging

                String[] donor = {
                    rs.getString("id"),
                    rs.getString("fullName"),
                    rs.getString("username"),
                    rs.getString("age"),
                    rs.getString("gender"),
                    rs.getString("bloodGroup"),
                    rs.getString("address"),
                    rs.getString("email"),
                    rs.getString("contactNumber"),
                    rs.getString("status")
                };
                donorsList.add(donor);
            }

            // Debugging: Print total donors found
            System.out.println("Total Donors Found: " + donorsList.size());

            request.setAttribute("donorsList", donorsList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ManageDonors.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("ManageDonorsServlet: Error - " + e.getMessage());
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}