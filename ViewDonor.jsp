<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Donor</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Donor Details</h2>
        <p><strong>ID:</strong> <%= request.getAttribute("id") %></p>
        <p><strong>Full Name:</strong> <%= request.getAttribute("fullName") %></p>
        <p><strong>Username:</strong> <%= request.getAttribute("username") %></p>
        <p><strong>Age:</strong> <%= request.getAttribute("age") %></p>
        <p><strong>Gender:</strong> <%= request.getAttribute("gender") %></p>
        <p><strong>Blood Group:</strong> <%= request.getAttribute("bloodGroup") %></p>
        <p><strong>Address:</strong> <%= request.getAttribute("address") %></p>
        <p><strong>Email:</strong> <%= request.getAttribute("email") %></p>
        <p><strong>Contact:</strong> <%= request.getAttribute("contactNumber") %></p>
        <a href="ManageDonorsServlet" class="btn btn-primary">Back</a>
    </div>
</body>
</html>
