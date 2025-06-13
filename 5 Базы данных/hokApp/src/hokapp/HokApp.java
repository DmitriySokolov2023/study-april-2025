/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package hokapp;
import javax.swing.*;
import java.awt.event.*;
/**
 *
 * @author sokol
 */
public class HokApp {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        JFrame frame = new JFrame("Учет хоккейных матчей");
        frame.setSize(400, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        JPanel panel = new JPanel();

        JButton btnTeams = new JButton("Показать команды");
        JButton btnPlayers = new JButton("Показать игроков команды");
        JButton btnMatches = new JButton("Показать матчи");

        panel.add(btnTeams);
        panel.add(btnPlayers);
        panel.add(btnMatches);

        // Кнопка: Показать команды
        btnTeams.addActionListener(e -> HockeyDB.getTeams());

        // Кнопка: Показать игроков команды
        btnPlayers.addActionListener(e -> {
            String teamIdStr = JOptionPane.showInputDialog("Введите ID команды:");
            if (teamIdStr != null && !teamIdStr.isEmpty()) {
                int teamId = Integer.parseInt(teamIdStr);
                HockeyDB.getPlayersByTeam(teamId);
            }
        });

        // Кнопка: Показать матчи
        btnMatches.addActionListener(e -> HockeyDB.getMatches());

        frame.add(panel);
        frame.setVisible(true);
    }
    
}
