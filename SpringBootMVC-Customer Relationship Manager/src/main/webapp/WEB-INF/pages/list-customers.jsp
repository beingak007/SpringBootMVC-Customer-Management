<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Of Customers</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body>

	<div id="wrapper" align="center">
		<div id="header">
			<h2 style="color: green;">CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<div id="container" align="center">
		<div id="content">
			
			<!-- Button to Add Customer--> 
			<input type="button" value="Add Customer" 
				onclick="window.location.href='./showForm'; return false;" class="add-button" />
				
			<br/>
				
			<table border="1">
				<tr style="background-color: coral;">
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email ID</th>
					<th>Actions</th>
				</tr>
				
				<c:forEach var="customer" items="${customers}">
				
					<!-- showFormUpdate?customerId=1 -->
					<c:url value="/customer/showFormUpdate" var="update">
						<c:param name="customerId" value="${customer.id}"/>
					</c:url>
					
					<c:url value="/customer/showFormDelete" var="delete">
						<c:param name="customerId" value="${customer.id}"/>
					</c:url>
			
				
					<tr>
						<td>${customer.firstName}</td>
						<td>${customer.lastName}</td>
						<td>${customer.email}</td>
						<td>
							<a href="${update}">Update</a>
							              |
							<a href="${delete}" 
								onclick="if(!confirm('Are You Sure To Delete the Person?')) return false;">
									Delete</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
	</div>
	
</body>
</html>
