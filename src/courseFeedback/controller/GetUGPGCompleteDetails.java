package courseFeedback.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import courseFeedback.bean.CourseQuestionAvgTabularBean;
import courseFeedback.bean.UGPGAvgBean;
import courseFeedback.dao.FeedbackDAO;

public class GetUGPGCompleteDetails extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		String yearId = request.getParameter("yearId");
		String termId = request.getParameter("termId");
		String yearTermCnt = request.getParameter("yearTermCnt");
		
		new FeedbackDAO().allCourseAvg(yearId,termId,type,yearTermCnt);
		new FeedbackDAO().getUGPGQuestionAVG(yearId,termId,type,yearTermCnt);
		
		ArrayList<UGPGAvgBean> list2= new FeedbackDAO().getUGPGQuestionAVG(yearId,termId,type,yearTermCnt);
		ArrayList<CourseQuestionAvgTabularBean> list = new FeedbackDAO().getUGPGCompleteInfoOfCourseQuestion(yearId,termId,type,yearTermCnt);
		
		if(list!=null)
		{
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			request.setAttribute("totalAvg", new FeedbackDAO().getTotal(yearId, termId, type,yearTermCnt));
			request.setAttribute("ugpgAvg", new FeedbackDAO().UGPGAvg(yearId,termId,type,yearTermCnt));
			request.setAttribute("counter", new FeedbackDAO().totalUGPGStudent(yearId,termId,type,yearTermCnt));
			request.setAttribute("type", type);
			request.getRequestDispatcher("ugpgCourseQuestionAvgTabularList.jsp").forward(request, response);
		}
	}

}