package courseFeedback.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import courseFeedback.bean.UGPGAvgBean;
import courseFeedback.dao.FeedbackDAO;

@SuppressWarnings("serial")
public class UGQuestionAvgServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	/*	ArrayList<UGPGAvgBean> ugpgAvgBeans = new FeedbackDAO().getUGQuestionAVG();
		request.setAttribute("ugpgQuestionAvg", ugpgAvgBeans);
		request.getRequestDispatcher("ugpgQuestionAvg.jsp").forward(request, response);
	*/
	}

}
