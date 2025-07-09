import java.sql.Connection;
import java.sql.DriverManager;

public class TestDB {
    public static void main(String[] args) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbanksystem", "root", "root");
            if (con != null) {
                System.out.println("Database Connected Successfully!");
            } else {
                System.out.println("Database Connection Failed!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
