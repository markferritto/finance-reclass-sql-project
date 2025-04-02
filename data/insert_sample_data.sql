-- Sample data for invoices_active
INSERT INTO invoices_active (account_id, customer_id, amount, category, invoice_date)
VALUES
(123, 'ABC001', 950.00, 'Consulting', '2024-03-01'),
(123, 'ABC001', 11000.00, 'Consulting', '2024-03-15'),
(456, 'XYZ999', 500.00, 'Legal', '2024-03-10'),
(123, 'ABC001', 2500.00, 'Admin', '2024-03-20');

-- Sample data for invoices_archive
INSERT INTO invoices_archive (account_id, customer_id, amount, category, invoice_date)
VALUES
(123, 'ABC001', 3000.00, 'Consulting', '2023-12-12'),
(456, 'XYZ999', 8000.00, 'Legal', '2023-10-05'),
(123, 'ABC001', 650.00, 'Admin', '2023-11-01');
