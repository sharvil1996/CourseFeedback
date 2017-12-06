<%@page import="courseFeedback.dao.FeedbackDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="courseFeedback.bean.ProgramAvgBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
	ArrayList<ProgramAvgBean> programAvgBeans = (ArrayList<ProgramAvgBean>) request.getAttribute("arraylist");
	String type = (String) request.getAttribute("type");
%>
</head>
<center>
	<form action="DisplayUgPgServlet" method="post">
		<input type="submit" value="Home">
	</form>

	<h1>
		<%=type.toUpperCase()%>
		Program Average Report
	</h1>
</center>
<center>
	<body>

		<table border="1">
			<tr>
				<th>Program Id</th>
				<th>Program name</th>
				<th>Program Avg</th>
			</tr>

			<%
				for (ProgramAvgBean avgBean : programAvgBeans) {
					DecimalFormat df = new DecimalFormat("#.##");

					if (type.equalsIgnoreCase("ug")) {
						if (avgBean.getProgramId() == 1 || avgBean.getProgramId() == 16) {
			%>
			<tr>
				<td><%=avgBean.getProgramId()%></td>
				<td><%=avgBean.getProgramName()%></td>
				<%if(avgBean.getAvg()== null){ %>
				<td><%=0%></td><%}else{ %>
				<td><%=df.format(Double.parseDouble(avgBean.getAvg()))%></td>
				<%} %>
			</tr>
			<%
				} else {
							continue;
						}
					} else if (type.equalsIgnoreCase("pg")) {
						if (avgBean.getProgramId() == 1 || avgBean.getProgramId() == 16) {
							continue;
						} else
			%>
			<tr>
				<td><%=avgBean.getProgramId()%></td>
				<td><%=avgBean.getProgramName()%></td>
				<td><%=df.format(Double.parseDouble(avgBean.getAvg()))%></td>
			</tr>
			<%
				}
				}
			%>

		</table>
		<%
			if (type.equalsIgnoreCase("ug")) {

				String yearId = request.getParameter("yearId");
				String termId = request.getParameter("termId");

				HashMap<String, String> map = new FeedbackDAO().yearAvg(yearId + " " + termId);
		%>
		<%
			DecimalFormat df = new DecimalFormat("#.##");
		%>
		<h1>
			<%=type.toUpperCase()%>
			Program Year Wise Average Report
		</h1>
		<table border="1">
			<tr>
				<th>Year Name</th>
				<th>Average</th>
			</tr>

			<tr>
				<td>1st Year</td>
				<%if(map.get("1")== null){ %>
				<td><%=0%></td><%}else{ %>
				<td><%=df.format(Double.parseDouble(map.get("1")))%></td><%} %>
			</tr>

			<tr>
				<td>2nd Year</td>
				<%if(map.get("2")== null){ %>
				<td><%=0%></td><%}else{ %>
				<td><%=df.format(Double.parseDouble(map.get("2")))%></td><%} %>
			</tr>

		</table>

		<%
			}
		%>
	</body>
</center>
</html>