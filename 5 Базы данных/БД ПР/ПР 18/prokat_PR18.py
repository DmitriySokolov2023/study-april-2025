import os
import sqlite3
import xml.etree.ElementTree as ET

script_dir = os.path.dirname(os.path.abspath(__file__))

def load_xml_to_db(db_name, xml_files):
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()

    cursor.execute('''CREATE TABLE IF NOT EXISTS cars (
                        id INTEGER PRIMARY KEY,
                        brand TEXT,
                        model TEXT,
                        year INTEGER,
                        price REAL)''')

    cursor.execute('''CREATE TABLE IF NOT EXISTS clients (
                        id INTEGER PRIMARY KEY,
                        name TEXT,
                        phone TEXT,
                        email TEXT)''')

    cursor.execute('''CREATE TABLE IF NOT EXISTS orders (
                        id INTEGER PRIMARY KEY,
                        client_id INTEGER,
                        car_id INTEGER,
                        date TEXT,
                        duration INTEGER,
                        FOREIGN KEY(client_id) REFERENCES clients(id),
                        FOREIGN KEY(car_id) REFERENCES cars(id))''')

    for file in xml_files:
        file_path = os.path.join(script_dir, file)
        tree = ET.parse(file_path)
        root = tree.getroot()

        if file == 'cars.xml':
            for car in root.findall('car'):
                id_ = int(car.find('id').text)
                brand = car.find('brand').text
                model = car.find('model').text
                year = int(car.find('year').text)
                price = float(car.find('price').text)
                cursor.execute('INSERT OR REPLACE INTO cars (id, brand, model, year, price) VALUES (?, ?, ?, ?, ?)',
                               (id_, brand, model, year, price))

        elif file == 'clients.xml':
            for client in root.findall('client'):
                id_ = int(client.find('id').text)
                name = client.find('name').text
                phone = client.find('phone').text
                email = client.find('email').text
                cursor.execute('INSERT OR REPLACE INTO clients (id, name, phone, email) VALUES (?, ?, ?, ?)',
                               (id_, name, phone, email))

        elif file == 'orders.xml':
            for order in root.findall('order'):
                id_ = int(order.find('id').text)
                client_id = int(order.find('client_id').text)
                car_id = int(order.find('car_id').text)
                date = order.find('date').text
                duration = int(order.find('duration').text)
                cursor.execute('INSERT OR REPLACE INTO orders (id, client_id, car_id, date, duration) VALUES (?, ?, ?, ?, ?)',
                               (id_, client_id, car_id, date, duration))

    conn.commit()
    conn.close()

xml_files = ['cars.xml', 'clients.xml', 'orders.xml']
db_name = os.path.join(script_dir, 'Прокат_ПР18.db')

load_xml_to_db(db_name, xml_files)
print(f"Данные успешно загружены в базу данных {db_name}.")
