<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | reset password</title>
<noscript>
	<div style="color: #FF0000">place enable java script</div>
</noscript>
<script type="text/javascript" src="javaScript/mainscript.js"></script>
<link rel="icon" href="photos/daiict.png" />
</head>
<body>
<%@ include file="adminHeader.jsp"%>
<div style="margin-top: -850px; margin-left: 250px;">
	<section class="content-header">
	<% if( adminBeanHeader.getIsSuper().equals("0")){ %>
	<h1>
		Password <small>Change</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="adminDashBoard.jsp"><i class="fa fa-dashboard"></i>
				Home</a></li>
		<li class="active">Password</li>
	</ol>
	</section>
	<br> <br>
	<div class="col-lg-6">
		<div class="container">
			<form action="ChangeAdminPasswordServlet" method="post" name="Registration">
				<br />
				<div class="row">
					<label class="col-sm-2"> <font size="+1">Email :</font>
					</label>

					<div class="col-lg-6">
						<input type="text" class="form-control" name="emailId"
							placeholder="example@daiict.ac.in" maxlength="30"
							value="${email}" /> <font color="red">${emailId}
						</font>
					</div>
				</div>
				<br />

				<div class="row">
					<label class="col-sm-2"> <font size="+1">Password :</font>
					</label>
					<div class="col-lg-6">
						<input type="password" class="form-control"
							name="newPassword" value="" placeholder="Create Password"
							maxlength="30" /> <font color="red">${newPassword} </font>
					</div>
				</div>
				<br /> 
				<br /> 
					<label class="col-sm-2 control-label"></label>
					<input type="reset" value="Reset" name="reset" class="btn  btn-danger">
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<input type="Submit" value="Change" name="submit" class="btn btn-success">
			</form>
		</div>
	</div>
	<%}else{ %><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<h1><center>You are not authorised to access this page</center></h1>
<%} %>
</div>
</body>
</html>








<%-- 









<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="ChangeAdminPasswordServlet" method="post">
		<table>
			<tr>
				<td>Email</td>
				<td>Password</td>
			</tr>
			<tr>
				<td><input type="text" name="emailId" value="${email}"
					placeholder="Enter Email Id">${emailId}</td>
				<td><input type="text" name="newPassword" value="${pass}"
					placeholder="Enter New Password">${newPassword}</td>
			</tr>
			<tr>
				<td><input type="submit" value="submit" /></td>
			</tr>
		</table>
	</form>
</body>
</html> --%>