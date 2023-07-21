package com.employee.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.employee.DAO.EmployeeDAO;
import com.employee.form.EmployeeForm;

public class EmployeeDetailsAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String eid = request.getParameter("eid");
		System.out.println("eid= " + eid);
		EmployeeDAO edao = new EmployeeDAO();

		EmployeeForm emp = edao.getData(eid);

		request.setAttribute("employeeDetails", emp);

		return mapping.findForward("success");
	}
}
