/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package fp;
import java.sql.*;
/**
 *
 * @author sokol
 */
public class Fp {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
          try (Connection conn = appConnect.connect()) {
            System.out.println("Connected to the database!");

            // Пример: Получение списка всех пицц
            String sql = "SELECT * FROM pizza_schema.pizzas";
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {
System.out.println("Enter Login: admin");
System.out.println("Enter password: admin1");
System.out.println("successful login. Role: admin");
                
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void addOrder(Connection conn, int customerId, int employee_id, double totalPrice) throws SQLException {
    String sql = "INSERT INTO pizza_schema.orders (customer_id,employee_id, total_price, order_date) VALUES (?, ?, ?, NOW())";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setInt(1, customerId);
        pstmt.setInt(2, employee_id);
        pstmt.setDouble(3, totalPrice);
        pstmt.executeUpdate();
        System.out.println("Order added successfully!");
    }
    }

  
    
}
