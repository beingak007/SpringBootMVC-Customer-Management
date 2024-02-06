<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/add-customer-style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<title>ADD CUSTOMER</title>
</head>

<body>

	<div id="wrapper" align="center">
		<div id="header">
			<h2 style="color: green;">CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<form:form method="post" action="saveCustomer" modelAttribute="customer">
		
		<!-- Passing the ID as a hidden field -->
		<form:hidden path="id"/>
	
		<table align="center">
			<tr>
				<th>First Name</th>
				<td>
					<form:input path="firstName"/>
				</td>
			</tr>
			<tr>
				<th>Last Name</th>
				<td>
					<form:input path="lastName"/>
				</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>
					<form:input path="email"/>
				</td>
			</tr>
			
			<tr>
				<th></th>
				<td>
					<input type="submit" value="Save Customer" class="save">
				</td>
			</tr>
		</table>
	</form:form>
	
	<br/>
	
	<div align="center">
		<a href="list" align="center">Back To Customer List Page</a>	
	</div>
	
</body>

</html>