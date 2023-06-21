use Employee_master;
SET GLOBAL trigger_enabled = 1;

SHOW TRIGGERS;
SHOW TABLES;

-- Create the function
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

drop trigger addNameWithNumber;

-- Create the trigger
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

SELECT * from Employees;
SELECT generateInitials(Name) from Employees;