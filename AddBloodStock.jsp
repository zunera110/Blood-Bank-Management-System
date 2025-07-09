<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Blood Stock</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Add Blood Stock</h2>

    <!-- Display Message if set in request -->
    <% String message = (String) request.getAttribute("message");
        if (message != null) { %>
        <div class="alert alert-info"><%= message %></div>
    <% } %>

    <form action="AddBloodStockServlet" method="post">
        <div class="form-group">
            <label>Blood Group</label>
            <select name="bloodGroup" class="form-control" required>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
            </select>
        </div>

        <div class="form-group">
            <label>Quantity (ml)</label>
            <input type="number" name="quantity" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-success">Add Stock</button>
        <a href="ManageBloodStock.jsp" class="btn btn-secondary">Back</a>
    </form>
</div>
</body>
</html>
