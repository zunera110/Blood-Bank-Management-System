<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Donor</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Edit Donor</h2>
        <%
            String id = (String) request.getAttribute("id");
            String fullName = (String) request.getAttribute("fullName");
            String age = (String) request.getAttribute("age");
            String bloodGroup = (String) request.getAttribute("bloodGroup");

            if (id != null) {
        %>
        <form action="UpdateDonorServlet" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <label>Full Name:</label> 
            <input type="text" name="fullName" value="<%= fullName %>" class="form-control">
            
            <label>Age:</label> 
            <input type="number" name="age" value="<%= age %>" class="form-control">
            
            <label>Blood Group:</label> 
            <input type="text" name="bloodGroup" value="<%= bloodGroup %>" class="form-control">
            
            <br>
            <button type="submit" class="btn btn-success">Update</button>
            <a href="ManageDonorsServlet" class="btn btn-primary">Cancel</a>
        </form>
        <%
            } else {
        %>
        <p>Donor not found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
