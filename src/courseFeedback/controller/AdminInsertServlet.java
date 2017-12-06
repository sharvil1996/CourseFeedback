package courseFeedback.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import courseFeedback.bean.AdminBean;
import courseFeedback.dao.AdminDAO;
import courseFeedback.util.GenrateMathodsUtils;
import courseFeedback.util.ValidationUtils;

public class AdminInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String adminEmail = request.getParameter("txtAdminEmail");
		String adminPassword = request.getParameter("txtAdminPassword");
		String adminIpAdrr = request.getParameter("txtAdminIpAdrr");
		AdminBean adminBean = new AdminBean();

		boolean isError = false;

		if (ValidationUtils.isEmpty(adminEmail)) {
			isError = true;
			request.setAttribute("adminEmail", "<font color=red>* E-MAIL is Required</font>");
		} else if (!ValidationUtils.isValidEmailAddress(adminEmail)) {
			isError = true;
			request.setAttribute("txtAdminEmail", adminEmail);
			request.setAttribute("adminEmail", "<font color=red>* E-MAIL is Not Proper</font>");
		} else if (new AdminDAO().isEmailExists(adminEmail).length() != 0) {
			isError = true;
			request.setAttribute("txtAdminEmail", adminEmail);
			request.setAttribute("adminEmail", "<font color=red>* E-MAIL is Already Exists</font>");
		} else {
			request.setAttribute("txtAdminEmail", adminEmail);
			adminBean.setAdminEmail(adminEmail);
		}

		if (ValidationUtils.isEmpty(adminIpAdrr)) {
			isError = true;
			request.setAttribute("adminIpAdrr", "<font color=red>* IpAdrr is Required</font>");
		} else if (!ValidationUtils.isValidIpAddress(adminIpAdrr)) {
			isError = true;
			request.setAttribute("txtAdminIpAdrr", adminIpAdrr);
			request.setAttribute("adminIpAdrr", "<font color=red>* IpAdrr is Not Proper</font>");
		} else {
			request.setAttribute("txtAdminIpAdrr", adminIpAdrr);
			adminBean.setIpaddr(adminIpAdrr);
		}

		if (ValidationUtils.isEmpty(adminPassword)) {
			isError = true;
			request.setAttribute("adminPassword", "<font color=red>* PASSWORD is Required</font>");
		}

		else {
			request.setAttribute("txtAdminPassword", adminPassword);
			adminBean.setAdminPassword(GenrateMathodsUtils.makeSHA512(adminPassword));
		}

		if (isError) {
			request.getRequestDispatcher("adminInsert.jsp").forward(request, response);
		} else {
			adminBean.setIsSuper("0");
			adminBean.setAdminId(GenrateMathodsUtils.getRandomString(15));
			if (new AdminDAO().insert(adminBean)) {
				response.sendRedirect("AdminListServlet");
			} else {
				request.getRequestDispatcher("adminInsert.jsp").forward(request, response);
			}

		}

	}

}
