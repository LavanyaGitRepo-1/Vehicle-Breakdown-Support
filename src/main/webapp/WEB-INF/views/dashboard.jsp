<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.VehicleBreakdownSupport.model.Breakdown" %> <!-- Import your model class -->
<%
    //Retrieve user and breakdown list from session
	Object userObj = session.getAttribute("user");
	List<Breakdown> breakdowns = (List<Breakdown>) session.getAttribute("breakdowns");
    System.out.println(breakdowns);
%>



<html>
<head>
    <title>User Dashboard</title>
	<style>
		body{
			margin: 0;
			font-family: Arial, sans-serif;
			background-color: #e6f2ff;
			}
	    .container {
			max-width: 800px;
			margin: 40px auto;
			padding: 30px;
			background-color: white;
			border-radius: 10px;
			box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.1);
			}
	    h2, h3 {
			text-align: center;
			color: #004d66;
			}
		.user-info p {
			 font-size: 16px;
			 margin: 8px 0;
			 }
		form {
			 margin-top: 20px;
			 }
		label {
			 display: block;
			 margin: 10px 0 5px;
			 font-weight: bold;
			 }
	    input[type="text"] {
			  width: 100%;
			  padding: 8px;
			  margin-bottom: 12px;
			  border: 1px solid #ccc;
			  border-radius: 6px;
			  }
		button, input[type="submit"] {
			  background-color: #008080;
			  color: white;
			  padding: 10px 15px;
			  border: none;
			  border-radius: 6px;
			  cursor: pointer;
			  margin-top: 10px;
			  }
		button:hover, input[type="submit"]:hover {
			  background-color: #006666;
			  }
		table {
			   width: 100%;
			   margin-top: 20px;
			   border-collapse: collapse;
			   background-color: #f9f9f9;
			  }
	     th, td {
			   padding: 10px;
			   border: 1px solid #ddd;
			   text-align: center;
			  }
		th {
			   background-color: #008080;
			   color: white;
			   }
				 
	</style>
</head>
<body>
	<div class="container">
	<h2>Welcome, <%= (userObj != null) ? ((com.VehicleBreakdownSupport.model.Users) userObj).getName() : "Guest" %>!</h2>
	<div class="user-info">
	<p>Email: <%= (userObj != null) ? ((com.VehicleBreakdownSupport.model.Users) userObj).getEmail() : "N/A" %></p>
	<p>Phone: <%= (userObj != null) ? ((com.VehicleBreakdownSupport.model.Users) userObj).getPhone() : "N/A" %></p>
    </div>

    <h3>Submit Breakdown Request</h3>
    <form action="submit-breakdown" method="post">
        <label>Location:</label> <input type="text" name="location" required /><br>
        <label>Vehicle Type:</label> <input type="text" name="vehicleType" required /><br>
        <label>Issue:</label> <input type="text" name="issue" required /><br>
        <button type="submit">Submit Request</button>
    </form>

    <h3>Your Breakdown Requests</h3>
    <table border="1">
        <tr>
            <th>Location</th>
            <th>Vehicle Type</th>
            <th>Issue</th>
            <th>Status</th>
        </tr>
        <% if (breakdowns != null) { 
            for (Breakdown breakdown : breakdowns) { %>
                <tr>
                    <td><%= breakdown.getLocation() %></td>
                    <td><%= breakdown.getVehicleType() %></td>
                    <td><%= breakdown.getIssue() %></td>
                    <td><%= breakdown.getStatus() %></td>
                </tr>
        <%  } 
        } else { %>
            <tr><td colspan="4">No breakdown requests found.</td></tr>
        <% } %>
    </table>
<div>
 <form action="users/home" method="get">
 <input type="submit" value="LOGOUT">
</div>
 
  </form>
  </div>
</body>
</html>
