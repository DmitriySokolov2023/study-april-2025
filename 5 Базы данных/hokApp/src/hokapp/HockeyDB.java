/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hokapp;
import java.sql.*;
/**
 *
 * @author sokol
 */
public class HockeyDB {
     private static final String URL = "jdbc:postgresql://localhost:5432/hok";
    private static final String USER = "postgres";
    private static final String PASSWORD = "admin1";

    private static Connection connect() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void getTeams() {
        String sql = "SELECT team_id, name, city, coach FROM hockey_schema.teams";
        try (Connection conn = connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            System.out.println("List command:");
            while (rs.next()) {
                System.out.printf("ID: %d | Name: %s | City: %s | Trener: %s%n",
                        rs.getInt("team_id"),
                        rs.getString("name"),
                        rs.getString("city"),
                        rs.getString("coach"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void getPlayersByTeam(int teamId) {
        String sql = "SELECT name, number, position FROM hockey_schema.players WHERE team_id = ?";
        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, teamId);
            ResultSet rs = pstmt.executeQuery();
            System.out.println("Players ID " + teamId + ":");
            while (rs.next()) {
                System.out.printf("Name: %s | №%d | Position: %s%n",
                        rs.getString("name"),
                        rs.getInt("number"),
                        rs.getString("position"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void getMatches() {
        String sql = "SELECT m.match_id, m.date, m.location, " +
                     "ht.name AS home_team, at.name AS away_team, " +
                     "m.home_score, m.away_score " +
                     "FROM hockey_schema.matches m " +
                     "JOIN hockey_schema.teams ht ON m.home_team_id = ht.team_id " +
                     "JOIN hockey_schema.teams at ON m.away_team_id = at.team_id";
        try (Connection conn = connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            System.out.println("List matches:");
            while (rs.next()) {
                System.out.printf("Match #%d | %s: %s (%d) vs %s (%d)%n",
                        rs.getInt("match_id"),
                        rs.getDate("date"),
                        rs.getString("home_team"),
                        rs.getInt("home_score"),
                        rs.getString("away_team"),
                        rs.getInt("away_score"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
