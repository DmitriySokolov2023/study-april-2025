import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AirportApp {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Учет рейсов аэропорта");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(500, 400);

        // Создание панели с кнопками
        JPanel panel = new JPanel();
        panel.setLayout(new FlowLayout());

        JButton btnAirports = new JButton("Показать аэропорты");
        JButton btnFlights = new JButton("Показать рейсы");
        JButton btnPassengers = new JButton("Пассажиры рейса");

        panel.add(btnAirports);
        panel.add(btnFlights);
        panel.add(btnPassengers);

        // Добавление панели в окно
        frame.add(panel);

        // Действия при нажатии кнопок
        btnAirports.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                AirportDB.getAirports();
            }
        });

        btnFlights.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                AirportDB.getFlights();
            }
        });

        btnPassengers.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String flightId = JOptionPane.showInputDialog(frame, "Введите ID рейса:");
                if (flightId != null && !flightId.isEmpty()) {
                    AirportDB.getPassengers(Integer.parseInt(flightId));
                }
            }
        });

        frame.setVisible(true);
    }
}
