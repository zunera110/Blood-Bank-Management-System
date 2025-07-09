<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Donation Camps</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Upcoming Donation Camps</h2>

    <table class="table table-bordered table-striped text-center">
        <thead class="table-dark">
        <tr>
            <th>Camp Name</th>
            <th>Location</th>
            <th>Date</th>
            <th>Time</th>
            <th>Organizer</th>
        </tr>
        </thead>
        <tbody>
        <%= request.getAttribute("tableContent") != null ? request.getAttribute("tableContent") : "<tr><td colspan='5' class='text-center'>No upcoming camps</td></tr>" %>
        </tbody>
    </table>
</div>
</body>
</html>
