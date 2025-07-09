<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Manage Donors</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Manage Donors</h2>
        <a href="AddDonor.jsp" class="btn btn-success mb-3">Add New Donor</a>
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Username</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Blood Group</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<String[]> donorsList = (List<String[]>) request.getAttribute("donorsList");
                    if (donorsList != null) {
                        for (String[] donor : donorsList) {
                %>
                <tr>
                    <td><%= donor[0] %></td>
                    <td><%= donor[1] %></td>
                    <td><%= donor[2] %></td>
                    <td><%= donor[3] %></td>
                    <td><%= donor[4] %></td>
                    <td><%= donor[5] %></td>
                    <td><%= donor[6] %></td>
                    <td><%= donor[7] %></td>
                    <td><%= donor[8] %></td>
                    <td><%= donor[9] %></td>
                    
                    <td>
                        <!--<a href="UpdateStatusServlet?id=<%= donor[0] %>&status=Donated" class="btn btn-primary btn-sm">Mark as Donated</a>-->
                        <% if ("Donation Pending".equalsIgnoreCase(donor[9])) { %>
                            <a href="UpdateStatusServlet?id=<%= donor[0] %>&status=Donated" class="btn btn-primary btn-sm mb-1">Mark as Donated</a>
                        <% } %>
                        <a href="ViewDonorServlet?id=<%= donor[0] %>" class="btn btn-info btn-sm">View</a>
                        <a href="EditDonorServlet?id=<%= donor[0] %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="DeleteDonorServlet?id=<%= donor[0] %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr><td colspan="10" class="text-center">No Donors Found</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>

