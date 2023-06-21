DROP DATABASE Employee_master;
create database Employee_master;
use Employee_master;

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
CREATE TABLE SalaryDetails (
  EmpID VARCHAR(10) PRIMARY KEY,
  Basic DECIMAL(10, 2),
  SpecialAllowances DECIMAL(10, 2),
  Medical DECIMAL(10, 2),
  HRA INT,
  PF INT,
  Food INT,
  Travel INT,
  FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

DELIMITER //
CREATE FUNCTION generateInitials(fullName VARCHAR(255))
  RETURNS VARCHAR(10)
  DETERMINISTIC
  BEGIN
    DECLARE firstName VARCHAR(255);
    DECLARE lastName VARCHAR(255);
    DECLARE initials VARCHAR(10);
    
    SET firstName = SUBSTRING_INDEX(fullName, ' ', 1);
    SET lastName = SUBSTRING_INDEX(fullName, ' ', -1);
    
    SET initials = CONCAT(UPPER(SUBSTRING(firstName, 1, 1)), UPPER(SUBSTRING(lastName, 1, 1)));
    
    RETURN initials;
  END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER addNameWithNumber
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
  DECLARE nameCount INT;
  DECLARE newName VARCHAR(50);
  SET newName = NEW.Name;
  SET nameCount = (SELECT COUNT(*) FROM Employees WHERE generateInitials(Name) = generateInitials(newName));
  SET NEW.EmpID = CONCAT(generateInitials(NEW.Name),CAST(nameCount+1 AS CHAR) );
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER calculateSalaryDetails
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
  DECLARE basic DECIMAL(10, 2);
  DECLARE medical DECIMAL(10, 2);
  DECLARE special DECIMAL(10, 2);
  DECLARE nameCount INT;
  DECLARE empid varchar(10);
  DECLARE newName VARCHAR(50);
  
  SET newName = NEW.Name;
  SET nameCount = (SELECT COUNT(*) FROM Employees WHERE generateInitials(Name) = generateInitials(newName));
  SET empid = CONCAT(generateInitials(NEW.Name),CAST(nameCount AS CHAR) );

  SET basic = NEW.CTC * 0.6* (100/162);
  SET medical = NEW.CTC * 0.1;
  SET special = NEW.CTC * 0.3;

  INSERT INTO SalaryDetails (EmpID, Basic,SpecialAllowances, Medical,HRA,PF, Food,Travel)
  VALUES (empid, basic, special, medical,50,12,40,20);
END //

DELIMITER ;

-- DELIMITER //
-- CREATE TRIGGER updateCTC
-- AFTER UPDATE ON SalaryDetails
-- FOR EACH ROW
-- BEGIN
--     DECLARE hra DECIMAL(10, 2);
-- 	DECLARE pf DECIMAL(10, 2);
--     declare total DECIMAL(10, 2);
--     
--     set hra = new.basic*new.hra/100;
-- 	set pf = new.basic*new.pf/100;
--     
--     set total=new.basic+new.medical+new.SpecialAllowances+hra+pf;
--     UPDATE Employees SET CTC=total WHERE EmpID = NEW.EmpID;
-- END //
-- DELIMITER ;


-- DELIMITER //
-- CREATE TRIGGER updateSalaryStructure
-- before UPDATE ON Employees
-- FOR EACH ROW
-- BEGIN
--     declare increment Decimal(6,2);
--     set increment=new.ctc/old.ctc;
--     UPDATE salaryDetails
--     SET 
-- 		basic=basic*increment, 
-- 		SpecialAllowances=SpecialAllowances*increment,
-- 		medical=medical*increment
--     WHERE EmpID = NEW.EmpID;
-- END //
-- DELIMITER ;


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



SELECT * from Employees;
SELECT * from salaryDetails;

