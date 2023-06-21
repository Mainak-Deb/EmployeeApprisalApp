create database Employee_master;
use Employee_master;

drop table Employees;
CREATE TABLE Employees (
  EmpID VARCHAR(10) primary key,
  Name VARCHAR(50) NOT NULL,
  PostedDate DATE,
  Level VARCHAR(10),
  CTC DECIMAL(10, 2),
  Username VARCHAR(50),
  Password VARCHAR(255) NOT NULL,
  Role VARCHAR(20) NOT NULL,
  Designation VARCHAR(50) NOT NULL
);

-- Inserting values for employee 1
INSERT INTO Employees (Name, PostedDate, Level, CTC, Username, Password, Role, Designation)
VALUES ('John Doe', '2023-06-01', 'L3', 50000.00, 'johndoe@example.com', 'password123', 'User', 'Software Developer');

-- Inserting values for employee 2
INSERT INTO Employees (Name, PostedDate, Level, CTC, Username, Password, Role, Designation)
VALUES ('Jane Smith', '2023-06-02', 'L4', 60000.00, 'janesmith@example.com', 'pass456', 'User', 'Quality Assurance Engineer');

-- Inserting values for employee 3
INSERT INTO Employees (Name, PostedDate, Level, CTC, Username, Password, Role, Designation)
VALUES ('Robert Johnson', '2023-06-03', 'L5', 70000.00, 'robertjohnson@example.com', 'secure789', 'User', 'Data Scientist');

-- Inserting values for employee 4
INSERT INTO Employees (Name, PostedDate, Level, CTC, Username, Password, Role, Designation)
VALUES ('Emily Brown', '2023-06-04', 'L6', 80000.00, 'emilybrown@example.com', 'password@123', 'User', 'UI/UX Designer');

-- Inserting values for employee 5
INSERT INTO Employees (Name, PostedDate, Level, CTC, Username, Password, Role, Designation)
VALUES ('Michael Wilson', '2023-06-05', 'L7', 90000.00, 'michaelwilson@example.com', 'pass789', 'User', 'Systems Engineer');

-- Inserting values for employee 6
INSERT INTO Employees (Name, PostedDate, Level, CTC, Username, Password, Role, Designation)
VALUES ('Sarah Davis', '2023-06-06', 'L8', 100000.00, 'sarahdavis@example.com', 'securepass', 'User', 'Network Engineer');

-- Inserting values for employee 7
INSERT INTO Employees (Name, PostedDate, Level, CTC, Username, Password, Role, Designation)
VALUES ('Christopher Lee', '2023-06-07', 'L9', 110000.00, 'christopherlee@example.com', '123456', 'User', 'Software Engineer');

-- Inserting values for employee 8
INSERT INTO Employees (Name, PostedDate, Level, CTC, Username, Password, Role, Designation)
VALUES ('Olivia Taylor', '2023-06-08', 'L9', 120000.00, 'oliviataylor@example.com', 'qwerty', 'User', 'Hardware Engineer');

-- Inserting values for employee 9
INSERT INTO Employees (Name, PostedDate, Level, CTC, Username, Password, Role, Designation)
VALUES ('David Anderson', '2023-06-09', 'L3', 50000.00, 'davidanderson@example.com', 'pass123', 'Admin', 'Database Administrator');
