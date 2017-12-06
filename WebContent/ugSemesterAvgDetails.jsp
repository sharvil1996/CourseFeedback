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
	HashMap<String, String> map = (HashMap<String, String>) request.getAttribute("avg");
%>
</head>
<center>
	<form action="DisplayUgPgServlet" method="post">
		<input type="submit" value="Home">
	</form>

	<h1>UG Program Year Wise Average Report</h1>
</center>
<center>
	<body>
		<%
			DecimalFormat df = new DecimalFormat("#.##");
		%>
		<table border="1">
			<tr>
				<th>Year Name</th>
				<th>Average</th>
			</tr>

			<tr>
				<td>1st Year</td>
				<td><%=df.format(Double.parseDouble(map.get("1")))%></td>
			</tr>

			<tr>
				<td>2nd Year</td>
				<td><%=df.format(Double.parseDouble(map.get("2")))%></td>
			</tr>

		</table>

	</body>
</center>
</html>