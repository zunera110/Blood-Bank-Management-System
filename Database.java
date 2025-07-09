import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static final String URL = "jdbc:mysql://localhost:3306/bloodbanksystem?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASSWORD = "root";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver"; 
    
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println(" Database Connected Successfully!");
        } catch (Exception e) {
            System.out.println(" Database Connection Failed: " + e.getMessage());
        }
        return con;
    }
    public static void main(String[] args) {
        Connection con = Database.getConnection();
        if (con != null) {
            System.out.println(" Connection successful!");
        } else {
            System.out.println(" Connection failed!");
        }
    }
}
