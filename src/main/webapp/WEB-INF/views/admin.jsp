<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Dashboard</title>
	<style>
		body {
		            margin: 0;
		            font-family: Arial, sans-serif;
		            background-color: #f0f8ff;
		            padding: 20px;
		        }
		.container {
				    max-width: 1000px;
				    margin: 0 auto;
				    background-color: #fff;
				    padding: 30px;
				    border-radius: 10px;
				    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
				   }
		 h2 {
				    text-align: center;
				    color: #004d66;
				    margin-bottom: 30px;
				   }
				   
		 table {
				    width: 100%;
				    border-collapse: collapse;
				    background-color: #fdfdfd;
				    }
		th, td {
					padding: 12px 15px;
					text-align: center;
					border: 1px solid #ccc;
					}
		th {
					background-color: #008080;
					color: white;
					}
		select {
					padding: 5px;
					border-radius: 4px;
					border: 1px solid #ccc;
					}
	    button {
					padding: 6px 12px;
					background-color: #00796b;
					color: white;
					border: none;
					border-radius: 4px;
					cursor: pointer;
					margin-top: 5px;
					}

	    button:hover {
					background-color: #005f56;
					 }

	    form {
					margin: 0;
					
				}

	</style>
</head>
<body>
	<div class="container">
    <h2>Admin Dashboard - Breakdown Requests</h2>

    <table border="1">
        <thead>
            <tr>
                <th>User</th>
                <th>Location</th>
                <th>Vehicle Type</th>
                <th>Issue</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="breakdown" items="${breakdowns}">
                <tr>
                    <td>${breakdown.user.name}</td>
                    <td>${breakdown.location}</td>
                    <td>${breakdown.vehicleType}</td>
                    <td>${breakdown.issue}</td>
                    <td>${breakdown.status}</td>
                    <td>
						<form action="/admins/update-status/${breakdown.id}" method="post">
						    <select name="status">
						        <option value="Pending" <c:if test="${breakdown.status == 'Pending'}">selected</c:if>>Pending</option>
						        <option value="In Progress" <c:if test="${breakdown.status == 'In Progress'}">selected</c:if>>In Progress</option>
						        <option value="Resolved" <c:if test="${breakdown.status == 'Resolved'}">selected</c:if>>Resolved</option>
						    </select>
						    <button type="submit">Update</button>
						</form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
	</div>
</body>
</html>
