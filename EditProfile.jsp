<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    // Fetch the donor's current details from the session
    String name = (String) session.getAttribute("fullName");
    String username = (String) session.getAttribute("username");
    String age = (String) session.getAttribute("age");
    String gender = (String) session.getAttribute("gender");
    String bloodGroup = (String) session.getAttribute("bloodGroup");
    String address = (String) session.getAttribute("address");
    String email = (String) session.getAttribute("email");
    String contact = (String) session.getAttribute("contactNumber");
    String lastDonationDate = (String) session.getAttribute("lastDonationDate");
%>

<html>
<head>
    <title>Edit Profile</title>
</head>
<body>
    <h1>Edit Your Profile</h1>
    <form action="UpdateProfileServlet" method="POST">
        <table>
            <tr>
                <td class="label">Full Name:</td>
                <td><input type="text" name="fullName" value="<%= name %>" required/></td>
            </tr>
            <tr>
                <td class="label">Username:</td>
                <td><input type="text" name="username" value="<%= username %>" required/></td>
            </tr>
            <tr>
                <td class="label">Age:</td>
                <td><input type="number" name="age" value="<%= age %>" required/></td>
            </tr>
            <tr>
                <td class="label">Gender:</td>
                <td>
                    <select name="gender">
                        <option value="Male" <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="label">Blood Group:</td>
                <td>
                    <select name="bloodGroup">
                        <option value="A+" <%= bloodGroup.equals("A+") ? "selected" : "" %>>A+</option>
                        <option value="B+" <%= bloodGroup.equals("B+") ? "selected" : "" %>>B+</option>
                        <option value="O+" <%= bloodGroup.equals("O+") ? "selected" : "" %>>O+</option>
                        <option value="AB+" <%= bloodGroup.equals("AB+") ? "selected" : "" %>>AB+</option>
                        <option value="A-" <%= bloodGroup.equals("A-") ? "selected" : "" %>>A-</option>
                        <option value="B-" <%= bloodGroup.equals("B-") ? "selected" : "" %>>B-</option>
                        <option value="O-" <%= bloodGroup.equals("O-") ? "selected" : "" %>>O-</option>
                        <option value="AB-" <%= bloodGroup.equals("AB-") ? "selected" : "" %>>AB-</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="label">Address:</td>
                <td><input type="text" name="address" value="<%= address %>" required/></td>
            </tr>
            <tr>
                <td class="label">Email:</td>
                <td><input type="email" name="email" value="<%= email %>" required/></td>
            </tr>
            <tr>
                <td class="label">Contact:</td>
                <td><input type="text" name="contactNumber" value="<%= contact %>" required/></td>
            </tr>
            <tr>
                <td class="label">Last Donation Date:</td>
                <td><%= lastDonationDate != null ? lastDonationDate : "Not Available" %></td>
            </tr>
        </table>
        <input type="submit" value="Update Profile"/>
    </form>
</body>
</html>
