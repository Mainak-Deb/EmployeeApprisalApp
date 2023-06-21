use Employee_master;
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