import psycopg2

conn = psycopg2.connect(
    dbname="fp", user="postgres", password="admin1",
    host="localhost", port="5432"
)
cur = conn.cursor()


cur.execute("""
    SELECT l.city, COUNT(e.id) AS employee_count
    FROM pizza_schema.employees e
    JOIN pizza_schema.locations l ON e.location_id = l.id
    GROUP BY l.city;
""")
print("\nСотрудники по городам:")
for row in cur.fetchall():
    print(f"{row[0]}: {row[1]}")

cur.execute("""
    SELECT * 
    FROM pizza_schema.employees
    WHERE name ~ '\\s.+\\s';
""")
print("Сотрудники с ФИО из более чем одного слова:")
for row in cur.fetchall():
    print(row)
cur.execute("SELECT * FROM pizza_schema.pizzas")
for row in cur.fetchall():
    print(row)

cur.execute("""
    SELECT COUNT(*) 
    FROM pizza_schema.employees
    WHERE role ILIKE '%менеджер%';
""")
count = cur.fetchone()[0]
print(f"\nКоличество сотрудников с ролью 'Менеджер': {count}")