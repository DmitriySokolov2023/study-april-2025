import java.sql.*;

public class AirportDB {
    private static final String URL = "jdbc:sqlite:Аэропорт_ПР16.db";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL);
    }

    // Получить список всех аэропортов
    public static void getAirports() {
        String sql = "SELECT * FROM Аэропорты";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id") + ", Название: " + rs.getString("название") + 
                                   ", Город: " + rs.getString("город") + ", Страна: " + rs.getString("страна"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Получить список всех рейсов
    public static void getFlights() {
        String sql = "SELECT * FROM Рейсы";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                System.out.println("Номер рейса: " + rs.getString("номер_рейса") + 
                                   ", Дата вылета: " + rs.getString("дата_вылета") + 
                                   ", Пункт назначения: " + rs.getString("пункт_назначения"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Получить всех пассажиров на определённом рейсе
    public static void getPassengers(int flightId) {
        String sql = "SELECT * FROM Пассажиры WHERE рейс_id = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, flightId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                System.out.println("Имя: " + rs.getString("имя") + ", Фамилия: " + rs.getString("фамилия"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
