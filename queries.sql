-- 1. BASIC SELECT QUERIES
-- View all patients
SELECT * FROM Patient;
-- View all doctors
SELECT * FROM Doctor;
-- View all staff members
SELECT * FROM Staff;
-- View all medicines
SELECT * FROM Medicine;
-- View all prescriptions
SELECT * FROM Prescription;
-- View all sales
SELECT * FROM Sale;

-- 2. CRUD OPERATIONS
-- CREATE (INSERT) -- Add a new patient
INSERT INTO Patient (patient_id, name, date_of_birth, phone, email, address) VALUES (6, 'Riya Kapoor', '2002-03-18', '9000000006', 'riya@email.com', 'Berlin');
-- View inserted patient
SELECT * FROM Patient WHERE patient_id = 6;

-- UPDATE -- Update stock quantity of a medicine
UPDATE Medicine SET stock_quantity = 75 WHERE medicine_id = 2;
-- Check updated medicine
SELECT * FROM Medicine WHERE medicine_id = 2;

-- DELETE -- Delete the inserted patient
DELETE FROM Patient WHERE patient_id = 6;
-- Confirm deletion
SELECT * FROM Patient WHERE patient_id = 6;

-- 3. JOIN QUERIES
-- Query 1: Show prescriptions with patient and doctor names
SELECT p.prescription_id, p.issue_date, p.status, pa.name AS patient_name, d.name AS doctor_name FROM Prescription p JOIN Patient pa ON p.patient_id = pa.patient_id JOIN Doctor d ON p.doctor_id = d.doctor_id;

-- Query 2: Show medicines included in each prescription
SELECT p.prescription_id, pa.name AS patient_name, m.medicine_name, pi.dosage, pi.quantity FROM Prescription_Item pi JOIN Prescription p ON pi.prescription_id = p.prescription_id JOIN Patient pa ON p.patient_id = pa.patient_id JOIN Medicine m ON pi.medicine_id = m.medicine_id ORDER BY p.prescription_id;

-- Query 3: Show sales handled by staff
SELECT s.sale_id, s.sale_date, s.total_amount, st.name AS staff_name FROM Sale s JOIN Staff st ON s.staff_id = st.staff_id ORDER BY s.sale_id;

-- Query 4: Show sale details with medicine names
SELECT s.sale_id, m.medicine_name, si.quantity, si.unit_price FROM Sale_Item si JOIN Sale s ON si.sale_id = s.sale_id JOIN Medicine m ON si.medicine_id = m.medicine_id ORDER BY s.sale_id;

-- Query 5: Show sales with patient names
SELECT s.sale_id, s.sale_date, s.total_amount, pa.name AS patient_name, st.name AS staff_name FROM Sale s LEFT JOIN Patient pa ON s.patient_id = pa.patient_id JOIN Staff st ON s.staff_id = st.staff_id ORDER BY s.sale_id;

-- 4. AGGREGATION QUERIES
-- Query 6: Count total number of patients
SELECT COUNT(*) AS total_patients FROM Patient;
-- Query 7: Calculate total sales amount
SELECT SUM(total_amount) AS total_sales_amount FROM Sale;
-- Query 8: Average price of medicines
SELECT AVG(price) AS average_medicine_price FROM Medicine;
-- Query 9: Show number of medicines by category
SELECT category, COUNT(*) AS number_of_medicines FROM Medicine GROUP BY category;
-- Query 10: Show total quantity sold for each medicine
SELECT m.medicine_name, SUM(si.quantity) AS total_quantity_sold FROM Sale_Item si JOIN Medicine m ON si.medicine_id = m.medicine_id GROUP BY m.medicine_name ORDER BY total_quantity_sold DESC;

-- 5. BUSINESS LOGIC QUERIES
-- Query 11: Find medicines with low stock
SELECT medicine_id, medicine_name, stock_quantity FROM Medicine WHERE stock_quantity < 80;

-- Query 12: Find completed prescriptions only
SELECT prescription_id, issue_date, status FROM Prescription WHERE status = 'Completed';

-- Query 13: Find medicines supplied by a specific supplier
SELECT m.medicine_name, s.supplier_name FROM Medicine m JOIN Supplier s ON m.supplier_id = s.supplier_id WHERE s.supplier_name = 'Sun Pharma';

-- Query 14: Show all prescriptions for a specific patient
SELECT p.prescription_id, p.issue_date, p.status, pa.name AS patient_name FROM Prescription p JOIN Patient pa ON p.patient_id = pa.patient_id WHERE pa.name = 'Rahul Singh';

-- Query 15: Show all medicines that expire before a certain date
SELECT medicine_name, expiry_date FROM Medicine WHERE expiry_date < '2026-11-01';

-- Query 16: Show total sales handled by each staff member
SELECT st.name AS staff_name, SUM(s.total_amount) AS total_sales_handled FROM Sale s JOIN Staff st ON s.staff_id = st.staff_id GROUP BY st.name ORDER BY total_sales_handled DESC;

-- Query 17: Show how many prescriptions each doctor has issued
SELECT d.name AS doctor_name, COUNT(p.prescription_id) AS total_prescriptions FROM Doctor d LEFT JOIN Prescription p ON d.doctor_id = p.doctor_id GROUP BY d.name ORDER BY total_prescriptions DESC;

-- Query 18: Show walk-in customer sales only
SELECT sale_id, sale_date, total_amount FROM Sale WHERE patient_id IS NULL;
