
package fast.pizza.app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class appConnect {
     private static final String URL = "jdbc:postgresql://localhost:5432/fp";
    private static final String USER = "postgres";
    private static final String PASSWORD = "admin1";

    public static Connection connect() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
