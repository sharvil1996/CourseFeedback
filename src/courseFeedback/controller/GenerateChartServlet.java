package courseFeedback.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

import courseFeedback.dao.CourseDetailsDAO;
import courseFeedback.dao.FeedbackDAO;
import courseFeedback.dao.TermDetailsDAO;

@SuppressWarnings("serial")
public class GenerateChartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String yeartermcnt = request.getParameter("cmbYearTerm");
		String courseCode = request.getParameter("selCourseName");
		String year[] = yeartermcnt.split(" ");
		String courseName = new CourseDetailsDAO().getNameCourseCode(courseCode);
		int[] list = new FeedbackDAO().getCourseCount(year[0], year[1], year[2], courseCode);

		DefaultPieDataset dataset = new DefaultPieDataset();
		int cnt = list[0] + list[1] + list[2] + list[3] + list[4];
		double a, b, c, d, e;
		a = ((double) list[0] * 100 / cnt);
		b = ((double) list[1] * 100 / cnt);
		c = ((double) list[2] * 100 / cnt);
		d = ((double) list[3] * 100 / cnt);
		e = ((double) list[4] * 100 / cnt);

		a = Double.parseDouble(String.format("%.2f", (a * 100) / 100));
		b = Double.parseDouble(String.format("%.2f", (b * 100) / 100));
		c = Double.parseDouble(String.format("%.2f", (c * 100) / 100));
		d = Double.parseDouble(String.format("%.2f", (d * 100) / 100));
		e = Double.parseDouble(String.format("%.2f", (e * 100) / 100));

		dataset.setValue("Option 1(%)", a);
		dataset.setValue("Option 2(%)", b);
		dataset.setValue("Option 3(%)", c);
		dataset.setValue("Option 4(%)", d);
		dataset.setValue("Option 5(%)", e);
		request.setAttribute("year", year[0]);
		request.setAttribute("term", year[1]);
		request.setAttribute("cnt", year[2]);
		JFreeChart chart = ChartFactory.createPieChart(
				new TermDetailsDAO().getYearName(year[0]) + "  " + new TermDetailsDAO().getTermName(year[1]) + " "
						+ year[2]+" : " + courseName + "  -  " + courseCode, // chart
				// title
				dataset, // data
				true, // include legend
				true, false);

		ServletContext servletContext = request.getSession().getServletContext();
		String absoluteDiskPath = servletContext.getRealPath("photos/charts");

		int width = 640; // Width of the image
		int height = 480;// Height of the image
		File pieChart = new File(absoluteDiskPath + File.separator + courseCode + ".png");
		request.setAttribute("chart", courseCode + ".png");
		ChartUtilities.saveChartAsJPEG(pieChart, chart, width, height);
		request.getRequestDispatcher("displayChart.jsp").forward(request, response);
	}

}
