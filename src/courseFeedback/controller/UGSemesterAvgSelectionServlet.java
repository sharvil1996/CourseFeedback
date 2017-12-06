package courseFeedback.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import courseFeedback.dao.FeedbackDAO;

public class UGSemesterAvgSelectionServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String yearId = request.getParameter("yearId");
		String termId = request.getParameter("termId");

		HashMap<String, String> hashMap = new FeedbackDAO().temp(yearId + " " + termId);

		request.setAttribute("avg", hashMap);

		request.getRequestDispatcher("ugSemesterAvgDetails.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
