use task_2;

CREATE TABLE Hospital (
    hospital_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    hospital_id INT,
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id)
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(20) DEFAULT 'Not Provided'
);

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    notes VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Insert Hospitals
INSERT INTO Hospital (hospital_id, name, location, phone) VALUES
(1, 'City Care', 'Mumbai', '022-123456'),
(2, 'Healing Touch', 'Delhi', NULL);

-- Insert Doctors
INSERT INTO Doctor (doctor_id, name, specialization, hospital_id) VALUES
(1, 'Dr. Arjun Mehta', 'Cardiologist', 1),
(2, 'Dr. Neha Sharma', 'Neurologist', 2),
(3, 'Dr. Sameer Khan', 'Pediatrician', NULL);

-- Insert Patients
INSERT INTO Patient (patient_id, name, age, gender, phone) VALUES
(1, 'Ravi Kumar', 45, 'Male', '9876543210'),
(2, 'Anita Roy', 30, 'Female', NULL),
(3, 'Deepak Singh', 27, 'Male', DEFAULT);

-- Insert Appointments
INSERT INTO Appointment (appointment_id, patient_id, doctor_id, appointment_date, notes) VALUES
(1, 1, 1, '2025-06-25 10:00:00', 'Follow-up in 2 weeks'),
(2, 2, 2, '2025-06-26 11:30:00', NULL);

-- Update hospital phone
UPDATE Hospital SET phone = '011-999888' WHERE hospital_id = 2;

-- Assign doctor to hospital
UPDATE Doctor SET hospital_id = 1 WHERE doctor_id = 3;

-- Add missing notes for appointment
UPDATE Appointment SET notes = 'Patient reported headache.' WHERE appointment_id = 2;

-- Delete a patient record
DELETE FROM Patient WHERE patient_id = 3;

-- Delete an appointment
DELETE FROM Appointment WHERE appointment_id = 1;

-- Delete unassigned doctors
DELETE FROM Doctor WHERE hospital_id IS NULL;

select * from Doctor;
select * from Patient;
select * from Appointment;
select * from Hospital;