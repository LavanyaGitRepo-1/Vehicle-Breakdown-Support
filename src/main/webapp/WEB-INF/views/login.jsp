<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String errorMessage = (String) request.getAttribute("errorMessage"); // Get error message from request
%>
<html>
<head>
    <title>User Login</title>
	<style>
		body{
					margin: 0;
					padding: 0;
					font-family: Arial, sans-serif;
					background-color: #f0f8ff;
					display: flex;
					justify-content: center;
					align-items: center;
					height: 100vh;
					}
	   .form-container {
					background-color: #ffffff;
					padding: 30px 40px;
					border-radius: 12px;
				    box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
					width: 350px;
					text-align: left;
					}
		h2 {
		text-align: center;
				    margin-bottom: 20px;
					color: #333;
					}
		label {
					display: block;
					margin-top: 15px;
					font-weight: bold;
					}
		input {
					width: 100%;
					padding: 8px;
					margin-top: 5px;
					border: 1px solid #ccc;
					border-radius: 6px;
				}
		button {
					margin-top: 20px;
					padding: 10px;
					width: 100%;
					background-color: #008080;
					color: white;
					border: none;
					border-radius: 6px;
					font-weight: bold;
					cursor: pointer;
				}
		button:hover {
					background-color: #006666;
				}
	</style>
</head>
<body>
	<div class="form-container">
    <h2>Login</h2>

    <% if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>

    <form action="login" method="post">
        <label>Email:</label> <input type="email" name="email" required /><br>
        <label>Password:</label> <input type="password" name="password" required /><br>
        <button type="submit">Login</button>
    </form>
	</div>
</body>
</html>
