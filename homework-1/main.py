"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv

# employees_data = os.path.join('north_data', 'employees_data.csv')
# customers_data = os.path.join('north_data', 'customers_data.csv')
# orders_data = os.path.join('north_data', 'orders_data.csv')

conn = psycopg2.connect(
    host='localhost',
    database='north',
    user='postgres',
)
def add_info_to_db(file, query):
    with open(file) as f:
        reader = csv.reader(f)
        next(reader)
        with conn.cursor() as curs:
            curs.executemany(query, reader)
    conn.commit()


query_customers = """INSERT INTO customers (customer_id, company_name, contact_name)
                      VALUES (%s,%s,%s)"""
query_employees = """INSERT INTO employees (employee_id,first_name,last_name,title,birth_date,notes)
                      VALUES (%s,%s,%s,%s,%s,%s)"""
query_orders = """INSERT INTO orders (order_id,customer_id,employee_id,order_date,ship_city)
                      VALUES (%s,%s,%s,%s,%s)"""

add_info_to_db('north_data/customers_data.csv', query_customers)
add_info_to_db('north_data/employees_data.csv', query_employees)
add_info_to_db('north_data/orders_data.csv', query_orders)
conn.close()