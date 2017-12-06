<%@page import="courseFeedback.bean.SemesterProgramDetailsBean"%>
<%@page import="courseFeedback.dao.TermDetailsDAO"%>
<%@page import="courseFeedback.bean.TermDetailsBean"%>
<%@page import="courseFeedback.dao.FeedbackDAO"%>
<%@page import="courseFeedback.bean.FeedbackBean"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Course Selection</title>
<noscript>
	<div style="color: #FF0000">place enable java script</div>
</noscript>
<script type="text/javascript" src="javaScript/mainscript.js"></script>
<script type="text/javascript">
	function hi() {
		var val = document.getElementById('cmbYearTerm').value;
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState === 4 && xhttp.status === 200) {
				document.getElementById('selCourseName').innerHTML = xhttp.responseText;
			}
		};
		xhttp.open("POST", "AjaxServlet3?valAjax2=" + val, true);
		xhttp.send();
	}
</script>
<link rel="icon" href="photos/daiict.png" />
</head>
<body>
	<%@ include file="adminHeader.jsp"%>
	<div style="margin-top: -850px; margin-left: 250px;">
		<section class="content-header">
		<% if( adminBeanHeader.getIsSuper().equals("0")){ %>
		<h1>
			Course <small>Selection</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Course</li>
		</ol>
		</section>
		<br> <br>

		<div class="col-lg-6">
			<div class="container">
				<form action="GetCourseFeedbackServlet" method="post"
					name="Registration">
					<br />
					<%
						ArrayList<FeedbackBean> feedbackBeans = new FeedbackDAO().uniqueCourse();
					%>
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Year-Term
								:</font>
						</label>
						<div class="col-lg-6">
							<select name="cmbYearTerm" class="form-control" id="cmbYearTerm"
								onChange="hi()">
								<option value="0">--Select Batch--</option>
								<%
									List<TermDetailsBean> listOfTermDetails = new TermDetailsDAO().list();

									if (listOfTermDetails != null) {
										for (TermDetailsBean t : listOfTermDetails) {
											String s = t.getYearName() + " " + t.getTermName() + " " + t.getYearTermCnt();
											String temp = t.getYearId() + " " + t.getTermId();
											if (temp.equals(request.getAttribute("yearTerm"))) {
								%>
								<option
									value="<%=t.getYearId() + " " + t.getTermId() + " " + t.getYearTermCnt()%>"
									selected="selected"><%=s%></option>
								<%
									} else {
								%>
								<option
									value="<%=t.getYearId() + " " + t.getTermId() + " " + t.getYearTermCnt()%>"><%=s%></option>
								<%
									}
										}
									}
								%>
							</select> <font color="red">${cmbYearTerm}</font>
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Course
								Selection :</font>
						</label>
						<div class="col-lg-6">
							<%-- <select name="selCourseName" class="form-control">
								<%
									for (FeedbackBean bean : feedbackBeans) {
								%>
								<option value="<%=bean.getCourseCode()%>"><%=bean.getCourseName()%>
									<%=bean.getCourseCode()%></option>
								<%
									}
								%>
							</select> --%>

							<select class="form-control" data-placeholder="Select a Course"
								name="selCourseName" id="selCourseName">
							</select> <font color="red">${cmbYearTerm}</font>
						</div>
					</div>
					<br /> <br />
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<input type="Submit" value="Get List" name="submit"
						class="btn btn-success">

				</form>
			</div>
		</div>
		<%}else{ %><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<h1><center>You are not authorised to access this page</center></h1>
<%} %>
	</div>
</body>
</html>




