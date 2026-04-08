INSERT INTO Supplier (supplier_id, supplier_name, contact_person, phone, email, address) VALUES
(1, 'Sun Pharma', 'Amit Verma', '9876543210', 'amit@sunpharma.com', 'Delhi'),
(2, 'Cipla Ltd', 'Rohit Sharma', '9123456780', 'rohit@cipla.com', 'Mumbai'),
(3, 'Dr. Reddy''s', 'Neha Gupta', '9988776655', 'neha@reddys.com', 'Hyderabad');

INSERT INTO Patient (patient_id, name, date_of_birth, phone, email, address) VALUES
(1, 'Rahul Singh', '2000-05-10', '9000000001', 'rahul@email.com', 'Berlin'),
(2, 'Amanpreet Kaur', '1998-08-15', '9000000002', 'aman@email.com', 'Berlin'),
(3, 'Vikram Patel', '1995-02-20', '9000000003', 'vikram@email.com', 'Berlin'),
(4, 'Sneha Sharma', '2001-11-25', '9000000004', 'sneha@email.com', 'Berlin'),
(5, 'Arjun Mehta', '1999-07-30', '9000000005', 'arjun@email.com', 'Berlin');

INSERT INTO Doctor (doctor_id, name, specialization, phone, email) VALUES
(1, 'Dr. Rajesh Kumar', 'Cardiology', '9111111111', 'rajesh@hospital.com'),
(2, 'Dr. Priya Singh', 'General Physician', '9222222222', 'priya@hospital.com'),
(3, 'Dr. Ankit Verma', 'Dermatology', '9333333333', 'ankit@hospital.com');

INSERT INTO Staff (staff_id, name, role, phone, email, hire_date) VALUES
(1, 'Prabhnoor Singh', 'Pharmacist', '9444444444', 'prabhnoor@email.com', '2024-01-01'),
(2, 'Karan Malhotra', 'Assistant', '9555555555', 'karan@email.com', '2023-06-15'),
(3, 'Simran Kaur', 'Cashier', '9666666666', 'simran@email.com', '2022-09-10');

INSERT INTO Medicine (medicine_id, medicine_name, category, price, stock_quantity, expiry_date, supplier_id) VALUES
(1, 'Paracetamol', 'Painkiller', 2.50, 100, '2026-12-31', 1),
(2, 'Amoxicillin', 'Antibiotic', 5.00, 80, '2026-10-15', 2),
(3, 'Cetirizine', 'Allergy', 3.20, 60, '2026-08-20', 3),
(4, 'Ibuprofen', 'Painkiller', 4.00, 120, '2027-01-10', 1),
(5, 'Vitamin C', 'Supplement', 6.50, 90, '2026-11-05', 2);

INSERT INTO Prescription (prescription_id, issue_date, status, patient_id, doctor_id) VALUES
(1, '2026-01-10', 'Pending', 1, 1),
(2, '2026-01-15', 'Completed', 2, 2),
(3, '2026-01-20', 'Completed', 3, 1),
(4, '2026-02-01', 'Pending', 4, 3),
(5, '2026-02-05', 'Cancelled', 5, 2);

INSERT INTO Prescription_Item (prescription_item_id, dosage, quantity, prescription_id, medicine_id) VALUES
(1, '2 times a day', 10, 1, 1),
(2, '1 time a day', 5, 1, 2),
(3, '3 times a day', 7, 2, 3),
(4, '2 times a day', 8, 3, 1),
(5, '1 time a day', 6, 4, 4),
(6, '2 times a day', 9, 5, 5);

INSERT INTO Sale (sale_id, sale_date, total_amount, patient_id, staff_id) VALUES
(1, '2026-02-10 10:30:00', 25.00, 1, 1),
(2, '2026-02-11 12:00:00', 15.50, 2, 2),
(3, '2026-02-12 14:20:00', 40.00, NULL, 3),
(4, '2026-02-13 16:45:00', 18.00, 3, 1),
(5, '2026-02-14 18:10:00', 22.75, 4, 2);

INSERT INTO Sale_Item (sale_item_id, quantity, unit_price, sale_id, medicine_id) VALUES
(1, 2, 2.50, 1, 1),
(2, 1, 5.00, 1, 2),
(3, 3, 3.20, 2, 3),
(4, 2, 4.00, 3, 4),
(5, 1, 6.50, 4, 5),
(6, 2, 2.50, 5, 1);
