import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DonorLogoutServlet")
public class DonorLogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Your logout logic
        request.getSession().invalidate();
        response.sendRedirect("DonorLogin.jsp");
    }
}
