CREATE DATABASE pharmacy_management;
USE pharmacy_management;

CREATE TABLE Supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(200)
);

CREATE TABLE Patient (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(200)
);

CREATE TABLE Doctor (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    hire_date DATE NOT NULL
);

CREATE TABLE Medicine (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    expiry_date DATE NOT NULL,
    supplier_id INT NOT NULL,
    CONSTRAINT chk_medicine_price CHECK (price > 0),
    CONSTRAINT chk_stock_quantity CHECK (stock_quantity >= 0),
    CONSTRAINT fk_medicine_supplier
        FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

CREATE TABLE Prescription (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    issue_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    CONSTRAINT chk_prescription_status
        CHECK (status IN ('Pending', 'Completed', 'Cancelled')),
    CONSTRAINT fk_prescription_patient
        FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    CONSTRAINT fk_prescription_doctor
        FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE Prescription_Item (
    prescription_item_id INT AUTO_INCREMENT PRIMARY KEY,
    dosage VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    prescription_id INT NOT NULL,
    medicine_id INT NOT NULL,
    CONSTRAINT chk_prescription_item_quantity CHECK (quantity > 0),
    CONSTRAINT fk_prescription_item_prescription
        FOREIGN KEY (prescription_id) REFERENCES Prescription(prescription_id),
    CONSTRAINT fk_prescription_item_medicine
        FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);

CREATE TABLE Sale (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATETIME NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    patient_id INT NULL,
    staff_id INT NOT NULL,
    CONSTRAINT chk_sale_total_amount CHECK (total_amount >= 0),
    CONSTRAINT fk_sale_patient
        FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    CONSTRAINT fk_sale_staff
        FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

CREATE TABLE Sale_Item (
    sale_item_id INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    sale_id INT NOT NULL,
    medicine_id INT NOT NULL,
    CONSTRAINT chk_sale_item_quantity CHECK (quantity > 0),
    CONSTRAINT chk_sale_item_unit_price CHECK (unit_price > 0),
    CONSTRAINT fk_sale_item_sale
        FOREIGN KEY (sale_id) REFERENCES Sale(sale_id),
    CONSTRAINT fk_sale_item_medicine
        FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);
