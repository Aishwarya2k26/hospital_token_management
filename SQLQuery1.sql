USE HospitalAppointmentDB;
GO

CREATE TABLE Users
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    Role NVARCHAR(20) NOT NULL
);
GO

CREATE TABLE Appointments
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    PatientName NVARCHAR(100) NOT NULL,
    DoctorName NVARCHAR(100) NOT NULL,
    Department NVARCHAR(100) NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Token NVARCHAR(20) NOT NULL,
    Status NVARCHAR(30) NOT NULL
);
GO

INSERT INTO Users (Name, Email, Password, Role)
VALUES
('Hospital Admin', 'admin@hospital.com', 'admin123', 'Admin'),
('Dr. Kumar', 'doctor@hospital.com', 'doctor123', 'Doctor');
GO