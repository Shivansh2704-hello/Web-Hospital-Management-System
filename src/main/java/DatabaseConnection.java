import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hospital_db", 
                "root", 
                "Singh@2704"  // Change this to your MySQL password
            );
        } catch(Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
