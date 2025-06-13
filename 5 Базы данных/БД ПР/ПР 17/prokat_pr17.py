import sqlite3
import os

current_dir = os.path.dirname(os.path.abspath(__file__))
db_path = os.path.join(current_dir, 'Прокат_ПР17.db')

conn = sqlite3.connect(db_path)
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS Клиенты (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    имя TEXT NOT NULL,
    телефон TEXT NOT NULL
);
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS Автомобили (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    марка TEXT NOT NULL,
    модель TEXT NOT NULL,
    стоимость_в_день REAL NOT NULL
);
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS Заказы (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    клиент_id INTEGER NOT NULL,
    автомобиль_id INTEGER NOT NULL,
    дата_начала TEXT NOT NULL,
    дата_окончания TEXT NOT NULL,
    FOREIGN KEY (клиент_id) REFERENCES Клиенты(id),
    FOREIGN KEY (автомобиль_id) REFERENCES Автомобили(id)
);
""")

cursor.executemany("""
INSERT INTO Клиенты (имя, телефон) VALUES (?, ?);
""", [
    ("Иван Иванов", "+79001112233"),
    ("Петр Петров", "+79004445566"),
    ("Светлана Сидорова", "+79007778899"),
    ("Мария Смирнова", "+79001234567"),
    ("Дмитрий Кузнецов", "+79009876543")
])

cursor.executemany("""
INSERT INTO Автомобили (марка, модель, стоимость_в_день) VALUES (?, ?, ?);
""", [
    ("Toyota", "Camry", 3000),
    ("BMW", "X5", 7000),
    ("Audi", "A6", 5000),
    ("Hyundai", "Solaris", 2000),
    ("Lada", "Granta", 1500)
])

cursor.executemany("""
INSERT INTO Заказы (клиент_id, автомобиль_id, дата_начала, дата_окончания) VALUES (?, ?, ?, ?);
""", [
    (1, 2, "2024-11-01", "2024-11-10"),
    (2, 3, "2024-11-05", "2024-11-12"),
    (3, 1, "2024-11-15", "2024-11-20"),
    (4, 4, "2024-11-18", "2024-11-25"),
    (5, 5, "2024-11-20", "2024-11-30")
])

conn.commit()

print("Список заказов:")
cursor.execute("""
SELECT 
    Клиенты.имя AS клиент,
    Автомобили.марка || ' ' || Автомобили.модель AS автомобиль,
    Заказы.дата_начала,
    Заказы.дата_окончания
FROM Заказы
JOIN Клиенты ON Заказы.клиент_id = Клиенты.id
JOIN Автомобили ON Заказы.автомобиль_id = Автомобили.id;
""")
for row in cursor.fetchall():
    print(row)

cursor.execute("""
CREATE TABLE IF NOT EXISTS Возвраты (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    заказ_id INTEGER NOT NULL,
    дата_возврата TEXT NOT NULL,
    FOREIGN KEY (заказ_id) REFERENCES Заказы(id)
);
""")

cursor.executemany("""
INSERT INTO Возвраты (заказ_id, дата_возврата) VALUES (?, ?);
""", [
    (1, "2024-11-10"),
    (2, "2024-11-12"),
    (3, "2024-11-20"),
    (4, "2024-11-25"),
    (5, "2024-11-30")
])

conn.commit()

def calculate_rental_cost(стоимость_в_день, дни):
    """Рассчитать стоимость аренды."""
    return стоимость_в_день * дни

print("\nРассчитанные стоимости аренды:")
cursor.execute("""
SELECT 
    Автомобили.марка || ' ' || Автомобили.модель AS автомобиль,
    (JULIANDAY(Заказы.дата_окончания) - JULIANDAY(Заказы.дата_начала)) AS дни,
    Автомобили.стоимость_в_день
FROM Заказы
JOIN Автомобили ON Заказы.автомобиль_id = Автомобили.id;
""")
for row in cursor.fetchall():
    автомобиль, дни, стоимость_в_день = row
    итоговая_стоимость = calculate_rental_cost(стоимость_в_день, дни)
    print(f"{автомобиль}: {итоговая_стоимость} рублей")

conn.close()
