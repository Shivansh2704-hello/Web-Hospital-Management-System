# Web-Hospital-Management-System
# Hospital Management System

A Java web application for managing hospital operations including patient records, doctor information, and appointment scheduling.

## Technologies Used

- Backend: Java Servlets, JDBC
- Frontend: JSP, HTML5, CSS3
- Database: MySQL
- Server: Apache Tomcat 9.0
- IDE: Eclipse

## Features

- Patient Management (Add, View)
- Doctor Management (Add, View)
- Appointment Booking System
- Responsive Dashboard UI
- Database integration with MySQL

## Database Setup

CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE patients (
patient_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
age INT,
gender VARCHAR(10),
phone VARCHAR(15),
email VARCHAR(100)
);

CREATE TABLE doctors (
doctor_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
specialization VARCHAR(100),
phone VARCHAR(15),
available VARCHAR(3) DEFAULT 'Yes'
);

CREATE TABLE appointments (
appointment_id INT PRIMARY KEY AUTO_INCREMENT,
patient_id INT,
doctor_id INT,
appointment_date DATE,
status VARCHAR(20) DEFAULT 'Scheduled',
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE admin (
username VARCHAR(50) PRIMARY KEY,
password VARCHAR(100)
);

INSERT INTO admin VALUES ('admin', 'Singh@2704');

## Access

http://localhost:8080/HospitalSystem/dashboard.jsp

## Author

Shivansh Singh

<img width="1916" height="873" alt="Screenshot 2025-11-09 205558" src="https://github.com/user-attachments/assets/8c5051b1-9e86-4a49-870a-28e716f08f63" />
<img width="1910" height="873" alt="Screenshot 2025-11-09 205619" src="https://github.com/user-attachments/assets/7cf3e850-1ed8-4bc3-86d2-792eb4610534" />
<img width="1871" height="839" alt="Screenshot 2025-11-09 205656" src="https://github.com/user-attachments/assets/7c1a758c-e7ed-4a37-90a0-e6260a332558" />
<img width="1917" height="795" alt="Screenshot 2025-11-09 205916" src="https://github.com/user-attachments/assets/31194cae-61e5-4e12-885b-85782b45b436" />
<img width="1910" height="710" alt="Screenshot 2025-11-09 205930" src="https://github.com/user-attachments/assets/541c4075-1250-4d5b-a4fd-4357d0d40d48" />
<img width="1913" height="740" alt="Screenshot 2025-11-09 205953" src="https://github.com/user-attachments/assets/75d194da-db06-4f5a-ab5e-474bc1903abc" />
<img width="1912" height="709" alt="Screenshot 2025-11-09 210006" src="https://github.com/user-attachments/assets/140e6315-e00e-4043-87cb-efb402fab27d" />
