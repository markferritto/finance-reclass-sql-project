CREATE OR REPLACE FUNCTION reclassify_invoices()
RETURNS TABLE (
    source TEXT,
    invoice_id INT,
    account_id INT,
    customer_id VARCHAR,
    amount DECIMAL,
    category TEXT,
    invoice_date DATE
) AS $$
BEGIN
  RETURN QUERY

  -- Union all from active and archive, filtered
  SELECT 
      'active' AS source,
      ia.invoice_id,
      ia.account_id,
      ia.customer_id,
      ia.amount,
      CASE 
          WHEN ia.category = 'Consulting' THEN 'Professional Services'
          ELSE ia.category
      END AS category,
      ia.invoice_date
  FROM invoices_active ia
  WHERE ia.account_id = 123 AND ia.customer_id = 'ABC001'

  UNION ALL

  SELECT 
      'archive' AS source,
      ia.invoice_id,
      ia.account_id,
      ia.customer_id,
      ia.amount,
      CASE 
          WHEN ia.category = 'Consulting' THEN 'Professional Services'
          ELSE ia.category
      END AS category,
      ia.invoice_date
  FROM invoices_archive ia
  WHERE ia.account_id = 123 AND ia.customer_id = 'ABC001';

  -- Insert new row if any matching row > $10,000
  IF EXISTS (
      SELECT 1 FROM invoices_active
      WHERE account_id = 123 AND customer_id = 'ABC001' AND amount > 10000
  ) THEN
      INSERT INTO invoices_active (account_id, customer_id, amount, category)
      VALUES (123, 'ABC001', 100.00, 'High Value Notice');  -- fake row
  END IF;

END;
$$ LANGUAGE plpgsql;
