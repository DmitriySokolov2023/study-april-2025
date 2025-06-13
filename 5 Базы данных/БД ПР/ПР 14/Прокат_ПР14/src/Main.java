import java.sql.*;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:sqlite:Прокат_ПР14.db";

        try (Connection conn = DriverManager.getConnection(url)) {
            if (conn != null) {
                System.out.println("Соединение с базой данных установлено!");

                String sql = "SELECT * FROM Автомобили";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                System.out.println("Список автомобилей:");
                while (rs.next()) {
                    System.out.println(
                            "ID: " + rs.getInt("id") +
                            ", Марка: " + rs.getString("марка") +
                            ", Модель: " + rs.getString("модель") +
                            ", Год выпуска: " + rs.getInt("год_выпуска") +
                            ", Пробег: " + rs.getInt("пробег") +
                            ", Цена в день: " + rs.getDouble("цена_в_день")
                    );
                }
            }
        } catch (SQLException e) {
            System.out.println("Ошибка подключения: " + e.getMessage());
        }
    }
}
