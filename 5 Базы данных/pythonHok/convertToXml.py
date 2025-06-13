import psycopg2
import xml.etree.ElementTree as ET

# Подключение к базе
conn = psycopg2.connect(
    dbname="fp", user="postgres", password="admin1",
    host="localhost", port="5432"
)
cur = conn.cursor()

# Создание корневого элемента
root = ET.Element("pizza_database")

# === Таблица customers ===
cur.execute("SELECT id, name, phone, address, email FROM pizza_schema.customers")
customers_elem = ET.SubElement(root, "customers")

for row in cur.fetchall():
    cust = ET.SubElement(customers_elem, "customer")
    ET.SubElement(cust, "id").text = str(row[0])
    ET.SubElement(cust, "name").text = row[1]
    ET.SubElement(cust, "phone").text = row[2]
    ET.SubElement(cust, "address").text = row[3] or ''
    ET.SubElement(cust, "email").text = row[4] or ''

# === Таблица orders ===
cur.execute("SELECT id, customer_id, employee_id, total_price, order_date FROM pizza_schema.orders")
orders_elem = ET.SubElement(root, "orders")

for row in cur.fetchall():
    order = ET.SubElement(orders_elem, "order")
    ET.SubElement(order, "id").text = str(row[0])
    ET.SubElement(order, "customer_id").text = str(row[1])
    ET.SubElement(order, "employee_id").text = str(row[2]) if row[2] is not None else ''
    ET.SubElement(order, "total_price").text = str(row[3]) if row[3] is not None else ''
    ET.SubElement(order, "order_date").text = str(row[4]) if row[4] is not None else ''

# === Таблица pizzas ===
cur.execute("SELECT id, name, description, price FROM pizza_schema.pizzas")
pizzas_elem = ET.SubElement(root, "pizzas")

for row in cur.fetchall():
    pizza = ET.SubElement(pizzas_elem, "pizza")
    ET.SubElement(pizza, "id").text = str(row[0])
    ET.SubElement(pizza, "name").text = row[1]
    ET.SubElement(pizza, "description").text = row[2]
    ET.SubElement(pizza, "price").text = str(row[3])

# Сохранение XML в файл
tree = ET.ElementTree(root)
tree.write("pizza_data.xml", encoding="utf-8", xml_declaration=True)

# Закрытие соединения
cur.close()
conn.close()

print("XML-файл успешно создан: pizza_data.xml")
