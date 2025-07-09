<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="refresh" content="0;URL=AdminDashboardServlet">
    <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, max-age=0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background: #b30000;
            color: white;
            padding: 15px;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
        }
        .sidebar a:hover {
            background: #990000;
        }
        .content {
            padding: 20px;
        }
        .card {
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <form action="AdminDashboardServlet" method="GET">
</form>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 sidebar">
                <h3 class="text-center">Admin Panel</h3>
                <a href="ManageDonorsServlet">Manage Donors</a>
                <a href="ManageRequestsServlet">Manage Requests</a>
                <a href="ManageBloodStockServlet">Manage Blood Stock</a>
                <a href="CampServlet">Manage Camps</a>
                <a href="ManageQueryServlet">Manage Query</a>
                <a href="LogoutServlet">Logout</a>
            </div>
            <div class="col-md-10 content">
                <h2>Welcome to Admin Panel</h2>
                <div class="row">
                    <%
                        Integer totalDonors = (Integer) request.getAttribute("totalDonors");
                        Integer totalRequests = (Integer) request.getAttribute("totalRequests");
                        Integer bloodStock = (Integer) request.getAttribute("bloodStock");
                    %>
                    <div class="col-md-4">
                        <div class="card text-center p-3">
                            <h4>Total Donors</h4>
                            <p><%= (totalDonors != null) ? totalDonors : "No data" %></p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card text-center p-3">
                            <h4>Total Blood Requests</h4>
                            <p><%= (totalRequests != null) ? totalRequests : "No data" %></p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card text-center p-3">
                            <h4>Blood Stock</h4>
                            <p><%= (bloodStock != null) ? bloodStock : "No data" %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
