<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Requests - BBMS</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container">
        <a class="navbar-brand" href="#">Manage Requests</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="AdminHome.jsp">Admin Home</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h2 class="text-danger text-center">Blood Requests</h2>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Blood Group</th>
                <th>Contact Number</th>
                <th>Message</th>
                <th>Status</th>
                <th>Actions</th> 
            </tr>
        </thead>
        <tbody>
            <%
                List<Map<String, String>> requests = (List<Map<String, String>>) request.getAttribute("requests");
                if (requests != null) {
                    for (Map<String, String> req : requests) {
            %>
            <tr>
                <td><%= req.get("id") %></td>
                <td><%= req.get("fullName") %></td>
                <td><%= req.get("email") %></td>
                <td><%= req.get("bloodGroup") %></td>
                <td><%= req.get("contactNumber") %></td>
                <td><%= req.get("message") %></td>
                <td><%= req.get("status") %></td>
                <td>
                    <form action="DeleteRequestServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= req.get("id") %>">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                    <% if (!"Paid".equals(req.get("status"))) { %>
                    <form action="MarkPaidServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= req.get("id") %>">
                        <button type="submit" class="btn btn-success btn-sm">Mark as Paid</button>
                    </form>
                    <% } %>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr><td colspan="8" class="text-center">No blood requests found.</td></tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
