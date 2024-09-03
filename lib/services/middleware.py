import mysql.connector

# Connect to MySQL
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="David_2002",
    database="Nectar"
)

cursor = db.cursor()

# def fetch_data():
#     cursor.execute("SELECT * FROM your_table")
#     result = cursor.fetchall()
#     return result

# def insert_data(value1, value2):
#     cursor.execute("INSERT INTO your_table (column1, column2) VALUES (%s, %s)", 
#                    (value1, value2))
#     db.commit()

# # Example usage
# data = fetch_data()
# print(data)

# insert_data('example1', 'example2')
