<%@page import="courseFeedback.bean.AdminBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Admin List</title>

<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="icon" href="photos/daiict.png" />
<style>
td, tr, th {
	/*text-transform: uppercase;*/
	
}
</style>
</head>
<body>
	<%@include file="adminHeader.jsp"%>
	<div style="margin-top: -850px; margin-left: 250px;">
		<section class="content content-header"> <%
 	if (adminBeanHeader.getIsSuper().equals("0")) {
 %>
		<h1>
			Admin <small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Admin</li>
		</ol>
		<br>
		<br>
		<a href="adminInsert.jsp"><input type="button" value="ADD"
			name="ADD" class="btn btn-primary"></a> <br>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1"
							class="table table-bordered table-hover table-striped">
							<%
								ArrayList<AdminBean> listofAdmin = (ArrayList) request.getAttribute("listOfAdmin");
									if (listofAdmin != null) {
							%>
							<%
								HttpSession session1 = request.getSession();
										AdminBean adminBean1 = (AdminBean) session1.getAttribute("adminBean");
										String isSuper = adminBean1.getIsSuper();
							%>
							<thead class="gujju-theme text-uppercase">
								<tr>
									<th><center>Email</center></th>
									<th><center>Is Super</center></th>
									<th><center>Is Available</center></th>
									<%
										if (isSuper.equals("1")) {
									%>
									<th><center>Action</center></th>
									<%
										}
									%>
								</tr>
							</thead>


							<tbody>
								<%
									for (int i = 0; i < listofAdmin.size(); i++) {
												AdminBean adminBean = listofAdmin.get(i);
								%>
								<tr>

									<td><center><%=adminBean.getAdminEmail()%></center></td>
									<%
										if (adminBean.getIsSuper().equals("0")) {
									%>
									<td align="center"><img src="photos/no1.jpg" height="30"
										width="30" class="img-rounded" /></td>
									<%
										} else {
									%>
									<td align="center"><img src="photos/yes1.jpg" height="30"
										width="30" class="img-rounded" /></td>
									<%
										}
									%>
									<%
										if (adminBean.getIsAvailable() == 0) {
									%>
									<td align="center"><img src="photos/no1.jpg" height="30"
										width="30" class="img-rounded" /></td>
									<%
										} else {
									%>
									<td align="center"><img src="photos/yes1.jpg" height="30"
										width="30" class="img-rounded" /></td>
									<%
										}
									%>
									<%
										if (isSuper.equals("1")) {
									%>
									<td><center>

											<a
												href="AdminDeleteServlet?adminId=<%=adminBean.getAdminId()%>">
												<img src="photos/Recycle Bin.ico" height="30" width="30"
												class="img-rounded" />
											</a>
										</center></td>
									<%
										}
									%>
								</tr>

								<%
									}
										}

										else {
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
		<%
			} else {
		%><br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<h1>
			<center>You are not authorised to access this page</center>
		</h1>
		<%
			}
		%> </section>
	</div>
</body>
</html>