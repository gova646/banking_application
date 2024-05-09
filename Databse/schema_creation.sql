-- Create schema
CREATE SCHEMA IF NOT EXISTS bank;

-- Use the bank schema
USE bank;

-- Create Customer table
CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    date_of_birth DATE NOT NULL,
    address VARCHAR(255)
);

-- Create Account table
CREATE TABLE IF NOT EXISTS Account (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_number VARCHAR(20) UNIQUE,
    customer_id INT,
    branch_id INT,
    account_type ENUM('Savings', 'Checking', 'Loan') NOT NULL,
    balance DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Create Transaction table
CREATE TABLE IF NOT EXISTS Transaction (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

-- Create Branch table
CREATE TABLE IF NOT EXISTS Branch (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone_number VARCHAR(15)
);
