<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Donation Camps</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        window.onload = function () {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById("campDate").setAttribute("min", today);
        };
    </script>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Manage Donation Camps</h2>

    <!-- Add Camp Form -->
    <form action="CampServlet" method="post" class="mb-4">
        <div class="row">
            <div class="col-md-2"><input type="text" name="camp_name" class="form-control" placeholder="Camp Name" required></div>
            <div class="col-md-2"><input type="text" name="location" class="form-control" placeholder="Location" required></div>
            <div class="col-md-2"><input type="date" id="campDate" name="date" class="form-control" required></div>
            <div class="col-md-2"><input type="time" name="time" class="form-control" required></div>
            <div class="col-md-2"><input type="text" name="organizer" class="form-control" placeholder="Organizer" required></div>
            <div class="col-md-2"><button type="submit" class="btn btn-primary w-100">Add Camp</button></div>
        </div>
    </form>

    <!-- Camps Table -->
    <table class="table table-bordered table-striped text-center">
        <thead class="table-dark">
        <tr>
            <th>Camp Name</th>
            <th>Location</th>
            <th>Date</th>
            <th>Time</th>
            <th>Organizer</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%= request.getAttribute("tableContent") != null ? request.getAttribute("tableContent") : "<tr><td colspan='6' class='text-center'>No camps available</td></tr>" %>
        </tbody>
    </table>
</div>
</body>
</html>
