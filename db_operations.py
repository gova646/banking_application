import sqlite3

class database_operations():
    def __init__(self):
        # Connect to SQLite database (creates a new database if it doesn't exist)
        self.conn = sqlite3.connect('banking_app.db')

        # Create a cursor object to execute SQL queries
        self.cursor = self.conn.cursor()

    def create_tables_if_not_exsists(self):
        # Create Customer table
        self.cursor.execute('''
            CREATE TABLE IF NOT EXISTS Customer (
                customer_id INTEGER PRIMARY KEY,
                first_name TEXT,
                last_name TEXT,
                email TEXT,
                phone_number TEXT,
                address TEXT,
                password_hash TEXT
            )
        ''')

        # Create Account table
        self.cursor.execute('''
            CREATE TABLE IF NOT EXISTS Account (
                account_id INTEGER PRIMARY KEY,
                customer_id INTEGER,
                account_number TEXT UNIQUE,
                account_type TEXT,
                balance REAL,
                is_active INTEGER,
                FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
            )
        ''')

        # Create Transaction table
        self.cursor.execute('''
            CREATE TABLE IF NOT EXISTS Transaction (
                transaction_id INTEGER PRIMARY KEY,
                account_id INTEGER,
                transaction_type TEXT,
                amount REAL,
                transaction_date TEXT,
                FOREIGN KEY (account_id) REFERENCES Account(account_id)
            )
        ''')

        # Commit changes and close connection
        self.conn.commit()

        print("Tables created successfully.")
