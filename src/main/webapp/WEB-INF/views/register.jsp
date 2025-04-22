<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    String successMessage = (String) request.getAttribute("successMessage");
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
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
			   .login-link {
			               text-align: center;
			               margin-top: 15px;
			           }

			           .login-link a {
			               color: #008080;
			               text-decoration: none;
			           }

			           .login-link a:hover {
			               text-decoration: underline;
			           }

	</style>
</head>
<body>
	<div class="form-container">
    <h2>Register</h2>

    <% if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>

    <% if (successMessage != null) { %>
        <p style="color: green;"><%= successMessage %></p>
        <script>
            // Redirect to login page after 2 seconds
            setTimeout(function() {
                window.location.href = "<%= request.getContextPath() %>/login";
            }, 2000);
        </script>
    <% } %>

    <form action="<%= request.getContextPath() %>/users/register" method="post">
        <label>Name:</label> <input type="text" name="name" required /><br>
        <label>Email:</label> <input type="email" name="email" required /><br>
        <label>Phone:</label> <input type="text" name="phone" required /><br>
        <label>Password:</label> <input type="password" name="password" required /><br>
        <label>Confirm Password:</label> <input type="password" name="confirmPassword" required /><br>
        <button type="submit">Register</button>
    </form>

	<div class="login-link">
	    <p>Already have an account? <a href="<%= request.getContextPath() %>/users/login">Login here</a></p>
		
	</div>
	</div>
</body>
</html>
