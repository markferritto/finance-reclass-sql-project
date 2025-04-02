CREATE TABLE invoices_archive (
    invoice_id SERIAL PRIMARY KEY,
    account_id INT NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50),
    invoice_date DATE DEFAULT CURRENT_DATE
);
