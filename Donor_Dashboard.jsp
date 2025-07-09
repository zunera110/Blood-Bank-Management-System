<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.*, java.time.format.*" %>

<%
    String name = (String) request.getAttribute("fullName");
    String username = (String) request.getAttribute("username");
    String age = (String) request.getAttribute("age");
    String gender = (String) request.getAttribute("gender");
    String bloodGroup = (String) request.getAttribute("bloodGroup");
    String address = (String) request.getAttribute("address");
    String email = (String) request.getAttribute("email");
    String contact = (String) request.getAttribute("contactNumber");
    String lastDonationDate = (String) request.getAttribute("lastDonationDate");

    boolean isEligible = false;
    String eligibilityMsg = "No previous donation record.";

    if (lastDonationDate != null && !lastDonationDate.isEmpty()) {
        LocalDate lastDate = LocalDate.parse(lastDonationDate);
        LocalDate today = LocalDate.now();
        LocalDate nextEligibleDate = lastDate.plusMonths(3);

        if (today.isAfter(nextEligibleDate) || today.isEqual(nextEligibleDate)) {
            isEligible = true;
            eligibilityMsg = "✅ You are eligible to donate.";
        } else {
            eligibilityMsg = "⏳ You can donate after: " + nextEligibleDate.format(DateTimeFormatter.ofPattern("dd MMM yyyy"));
        }
    } else {
        isEligible = true;
        eligibilityMsg = "✅ You are eligible to donate.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Donor Dashboard</title>
    <style>
        body {
            font-family: Arial;
            background: #eef2f3;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 25%;
            background-color: #b30000 ;
            color: white;
            padding: 30px 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

        .sidebar h2 {
            margin-bottom: 20px;
        }

        .sidebar a {
            display: block;
            background-color: #b22210;
            color: white;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            text-decoration: none;
            /*font-weight: bold;*/
            /*text-align: center;*/
        }

        .sidebar a:hover {
            background-color: #990000;
        }

        .content {
            width: 75%;
            padding: 40px;
            background: white;
        }

        .content h2 {
            font-size: 45px;
            text-align: center;
            /*margin-bottom: 30px;*/
        }

        .info-table {
            width: 60%;
            border-collapse: collapse;
            margin-left: 200px;
            text-align: left;
        }

        .info-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .info-table td.label {
            font-weight: bold;
            width: 30%;
            color: #333;
        }

        .eligible {
            color: green;
            font-weight: bold;
        }

        .not-eligible {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Sidebar with Quick Actions -->
    <div class="sidebar">
        <h2>Donor Dashboard</h2>
        <a href="RegisterDonation.jsp"> Register for Donation</a>
        <!--<a href="ViewDonationsServlet"> View Past Donations</a>-->
        <a href="#"> Check Eligibility</a>
        <!--<a href="EditProfile.jsp"> Edit Profile</a>-->
        <a href="DonorLogoutServlet"> Logout</a>
    </div>

    <!-- Main Content Area -->
    <div class="content">
        <h2>Welcome, <%= name %></h2>
        <table class="info-table">
            <tr><td class="label">Full Name:</td><td><%= name %></td></tr>
            <tr><td class="label">Username:</td><td><%= username %></td></tr>
            <tr><td class="label">Age:</td><td><%= age %></td></tr>
            <tr><td class="label">Gender:</td><td><%= gender %></td></tr>
            <tr><td class="label">Blood Group:</td><td><%= bloodGroup %></td></tr>
            <tr><td class="label">Address:</td><td><%= address %></td></tr>
            <tr><td class="label">Email:</td><td><%= email %></td></tr>
            <tr><td class="label">Contact:</td><td><%= contact %></td></tr>
            <tr><td class="label">Last Donation:</td><td><%= (lastDonationDate != null && !lastDonationDate.isEmpty()) ? lastDonationDate : "N/A" %></td></tr>
            <tr>
                <td class="label">Eligibility:</td>
                <td><span class="<%= isEligible ? "eligible" : "not-eligible" %>"><%= eligibilityMsg %></span></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
