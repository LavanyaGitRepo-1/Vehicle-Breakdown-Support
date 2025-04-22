 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Breakdown Support</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">
	<style>
		body{
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
			background-color: #f9f9f9;
			text-align: center;
		}
		.container{
			margin-top: 40px; 
		}
		h2 {
		      font-size: 28px;
		      color: #333;
		    }
		.links{
			margin-top: 10px;
			font-size: 18px;
		}
		.links a {
		      margin: 0 10px;
		      text-decoration: none;
		      color: #007bff;
		      font-weight: bold;
		    }
			.links a:hover {
			      text-decoration: underline;
				  color:#0056b3
			    }
	</style>
</head>
<body class="container">
    <h2>Welcome to Vehicle Breakdown Emergency Support</h2>
    <div class="links">
		<a href="<%= request.getContextPath() %>/users/register">Register</a> | 
        <a href="<%= request.getContextPath() %>/users/login">Login</a>
	</div>
</body>
</html>
