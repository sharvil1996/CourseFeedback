package courseFeedback.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import courseFeedback.bean.ProgramAvgBean;
import courseFeedback.dao.FeedbackDAO;

public class ProgramAvgDetailServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String yearId = request.getParameter("yearId");
		String termId = request.getParameter("termId");
		String type = request.getParameter("type");
		String yearTermCnt = request.getParameter("yearTermCnt");
		ArrayList<ProgramAvgBean> arrayList = new FeedbackDAO().programAvg(yearId, termId, yearTermCnt);

		if (arrayList.size()!=0) {
			request.setAttribute("type", type);
			request.setAttribute("yearId", yearId);
			request.setAttribute("termId", termId);
			request.setAttribute("yearTermCnt", yearTermCnt);
			request.setAttribute("arraylist", arrayList);
			request.getRequestDispatcher("DisplayProgramDetails.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("DisplayProgramDetails.jsp").forward(request, response);

		}

	}

}
