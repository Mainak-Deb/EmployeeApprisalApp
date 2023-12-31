package com.employee.form;

import org.apache.struts.action.ActionForm;
import java.time.LocalDate;

public class EmployeeForm extends ActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String empID;
	private String name;
	private String postedDate;
	private String processedDate;
	private String level;
	private double ctc;
	private String username;
	private String password;
	private String role;
	private String designation;
	private double basic;
	private double specialAllowances;
	private double medical;
	private int hra;
	private int pf;
	private int food;
	private int travel;

	public EmployeeForm() {

	}

	public EmployeeForm(String empID, String name, String postedDate, String level, double ctc, String username,
			String password, String role, String designation, double basic, double specialAllowances,
			double medical, int hra, int pf, int food, int travel) {
		this.empID = empID;
		this.name = name;
		this.postedDate = postedDate;
		this.level = level;
		this.ctc = ctc;
		this.username = username;
		this.password = password;
		this.role = role;
		this.designation = designation;
		this.basic = basic;
		this.specialAllowances = specialAllowances;
		this.medical = medical;
		this.hra = hra;
		this.pf = pf;
		this.food = food;
		this.travel = travel;
		LocalDate date = LocalDate.parse(postedDate);
		LocalDate incrementedDate = date.plusMonths(3);
		this.setProcessedDate(incrementedDate.toString());
	}

	public void addEmployees(String empID, String name, String postedDate, String level, double ctc, String username,
			String role, String designation) {
		this.empID = empID;
		this.name = name;
		this.postedDate = postedDate;
		this.level = level;
		this.ctc = ctc;
		this.role = role;
		this.designation = designation;
		this.username = username;
		LocalDate date = LocalDate.parse(postedDate);
		LocalDate incrementedDate = date.plusMonths(3);
		this.setProcessedDate(incrementedDate.toString());
	}

	public void addSalaryDetails(double basic, double specialAllowances, double medical, int hra, int pf, int food,
			int travel) {

		this.basic = basic;
		this.specialAllowances = specialAllowances;
		this.medical = medical;
		this.hra = hra;
		this.pf = pf;
		this.food = food;
		this.travel = travel;
	}

	public String getEmpID() {
		return empID;
	}

	public void setEmpID(String empID) {
		this.empID = empID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(String postedDate) {
		this.postedDate = postedDate;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public double getCtc() {
		return ctc;
	}

	public void setCtc(double ctc) {
		this.ctc = ctc;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public double getBasic() {
		return basic;
	}

	public void setBasic(double basic) {
		this.basic = basic;
	}

	public double getSpecialAllowances() {
		return specialAllowances;
	}

	public void setSpecialAllowances(double specialAllowances) {
		this.specialAllowances = specialAllowances;
	}

	public double getMedical() {
		return medical;
	}

	public void setMedical(double medical) {
		this.medical = medical;
	}

	public int getHra() {
		return hra;
	}

	public void setHra(int hra) {
		this.hra = hra;
	}

	public int getPf() {
		return pf;
	}

	public void setPf(int pf) {
		this.pf = pf;
	}

	public int getFood() {
		return food;
	}

	public void setFood(int food) {
		this.food = food;
	}

	public int getTravel() {
		return travel;
	}

	public void setTravel(int travel) {
		this.travel = travel;
	}

	public String getProcessedDate() {
		return processedDate;
	}

	public void setProcessedDate(String processedDate) {
		this.processedDate = processedDate;
	}

}
