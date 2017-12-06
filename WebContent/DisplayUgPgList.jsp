<%@page import="courseFeedback.bean.UGPGAvgBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | UG/PG List</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="icon" href="photos/daiict.png" />
<style>
td, tr, th {
	text-transform: uppercase;
}
</style>
</head>
<body>
	<%@include file="adminHeader.jsp"%>
	<div style="margin-top: -850px; margin-left: 250px;">
		<section class="content content-header">
		<% if( adminBeanHeader.getIsSuper().equals("0")){ %>
		<h1>
			UG/PG <small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Average</li>
		</ol>
		<br>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1"
							class="table table-bordered table-hover table-striped">
							<%
								ArrayList<UGPGAvgBean> bean = (ArrayList<UGPGAvgBean>) request.getAttribute("courseQuestionAvg");
								if (bean != null) {
							%>
							<thead class="gujju-theme text-uppercase">
								<tr>
									<th><center>Year - Term</center></th>
									<th><center>Type</center></th>
									<th><center>Average</center></th>
									<th><center>Action</center></th>
								</tr>
							</thead>
							<tbody>
								<%
									for (UGPGAvgBean u : bean) {
								%>

								<tr>
									<td align="center"><%=u.getYearName()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=u.getTermName()%>&nbsp;&nbsp;&nbsp;<%=u.getYearTermCnt()%></td>
									<td align="center"><%=u.getType()%></td>
									<td align="center"><%=u.getAvg()%></td>
									<td align="center">
										<%
											if (u.getAvg() != 0.0) {
										%> <a class="btn btn-primary"
										href="AllCourseAvgServlet?yearId=<%=u.getYearId()%>&termId=<%=u.getTermId()%>&type=<%=u.getType()%>&yearTermCnt=<%=u.getYearTermCnt()%>">Course
											Avg</a> &emsp; <a class="btn btn-primary"
										href="UgPgQuestionAvgServlet?yearId=<%=u.getYearId()%>&termId=<%=u.getTermId()%>&type=<%=u.getType()%>&yearTermCnt=<%=u.getYearTermCnt()%>">Question
											Avg</a> &emsp; <a class="btn btn-primary"
										href="GetUGPGCompleteDetails?yearId=<%=u.getYearId()%>&termId=<%=u.getTermId()%>&type=<%=u.getType()%>&yearTermCnt=<%=u.getYearTermCnt()%>">Total
											Avg Report</a> &emsp; <a class="btn btn-primary"
										href="ProgramAvgDetailServlet?yearId=<%=u.getYearId()%>&termId=<%=u.getTermId()%>&type=<%=u.getType()%>&yearTermCnt=<%=u.getYearTermCnt()%>">Program
											Avg</a> <%
 	}
 %>
									</td>
								</tr>

								<%
									}
									} else {
								%>

								<h1>
									<center>No Record Found....!</center>
								</h1>
								<%
									}
								%>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<%}else{ %><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<h1><center>You are not authorised to access this page</center></h1>
<%} %>
		</section>
	</div>
</body>
</html>



