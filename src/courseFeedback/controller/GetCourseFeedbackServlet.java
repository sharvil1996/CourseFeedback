package courseFeedback.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import courseFeedback.bean.FeedbackBean;
import courseFeedback.dao.FeedbackDAO;

public class GetCourseFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String yearTerm = request.getParameter("cmbYearTerm");
		String yearId="";
		String termId = "";
		String courseCode = "";
		String yearTermCnt="";
		if(yearTerm != null){
			courseCode = request.getParameter("selCourseName");
			String arr[] =yearTerm.split(" ");
			yearId = arr[0];
			termId = arr[1];
			yearTermCnt=arr[2];
		}else{
			yearId  = request.getParameter("yearId");
			termId = request.getParameter("termId");
			courseCode = request.getParameter("code");
			yearTermCnt = request.getParameter("yearTermCnt");
		}
		
		ArrayList<FeedbackBean> list = (ArrayList<FeedbackBean>) new FeedbackDAO().getCourseFeedback(courseCode,termId,yearId,yearTermCnt);
		if (list != null) {
			request.setAttribute("listOfFeedback", list);
			request.getRequestDispatcher("feedbackByCourse.jsp").forward(request, response);
		}
	}

}
