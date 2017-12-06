<%@page import="courseFeedback.dao.TermDetailsDAO"%>
<%@page import="courseFeedback.bean.TermDetailsBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UG Avg Details</title>
</head>
<body>

	<form action="UGSemesterAvgSelectionServlet" method="post">
		<select name="cmbYearTerm" class="form-control" id="cmbYearTerm">
			<option value="0">--Select Batch--</option>
			<%
				List<TermDetailsBean> listOfTermDetails = new TermDetailsDAO().list();

				if (listOfTermDetails != null) {
					for (TermDetailsBean t : listOfTermDetails) {
						String s = t.getYearName() + " " + t.getTermName();
						String temp = t.getYearId() + " " + t.getTermId();
						if (temp.equals(request.getAttribute("yearTerm"))) {
			%>
			<option value="<%=t.getYearId() + " " + t.getTermId()%>"
				selected="selected"><%=s%></option>
			<%
				} else {
			%>
			<option value="<%=t.getYearId() + " " + t.getTermId()%>"><%=s%></option>
			<%
				}
					}
				}
			%>
		</select> <input type="submit" value="Submit">
	</form>

</body>
</html>