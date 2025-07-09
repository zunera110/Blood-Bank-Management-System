<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Donate Blood</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<script>
    function onlyAlphabets(event, allowSpace = false) {
        let char = String.fromCharCode(event.which);
        if (!/^[a-zA-Z]+$/.test(char) && !(allowSpace && char === ' ')) {
            return false;
        }
        return true;
    }
    function validateForm() {
        let fullName = document.getElementById("fullName").value.trim();
        let username = document.getElementById("username").value.trim();
        let password = document.getElementById("password").value.trim();
        if (!/^[a-zA-Z\s]+$/.test(fullName)) {
            alert("Full Name can only contain letters and spaces!");
            return false;
        }
        if (!/^[a-zA-Z]+$/.test(username)) {
            alert("Username can only contain letters!");
            return false;
        }
        let passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8}$/;
        if (password.length !== 8) {
            alert("Password must be 8 characters long!");
            return false;
        }
        if (!passwordRegex.test(password)) {
            alert("Password must contain atleast one Uppercase, Lowercase, Special Character and a Number.");
            return false;
        }
        alert("Donor Registered Successfully!");
        return true;
    }
    function validateContactNumber(input) {
    if (input.value.length > 10) {
        input.value = input.value.slice(0, 10);
    }
}
</script>
<style>
        body {
            background-size: cover;
        } .register-box {
        width: 320px;
        margin: 1% auto;
        background: white;
        padding: 15px;
        border-radius: 10px;
        box-shadow: 2px 2px 5px 5px grey;
        text-align: center;
    }
    .input-group {
        position: relative;
        margin-bottom: 10px;
    }
    .input-group input, .input-group select, .input-group textarea {
        width: 100%;
        padding: 8px;
        height: 35px;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        font-size: 14px;
        background: transparent;
    }
    .input-group textarea {
        height: 60px;
    }
    .input-group label {
        position: absolute;
        top: 8px;
        left: 12px;
        color: #999;
        font-size: 14px;
        transition: 0.3s ease all;
        pointer-events: none;
    }
    .input-group input:focus ~ label,
    .input-group input:not(:placeholder-shown) ~ label,
    .input-group select:valid ~ label,
    .input-group textarea:focus ~ label,
    .input-group textarea:not(:placeholder-shown) ~ label {
        top: -14px;
        font-size: 12px;
        color: #b22222;
    }
    .btn-danger {
        width: 100%;
        background-color: #b22222;
        border-color: #b22222;
        padding: 8px;
        font-size: 14px;
    }
    .btn-danger:hover {
        background-color: #8b1a1a;
        border-color: #8b1a1a;
    }
        #nav{
            background: #b30000;
        }
    </style>
<body>
<nav id="nav" class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="donorRegister.jsp">Donate Blood</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="needblood.jsp">Need Blood</a></li>
                <li class="nav-item"><a class="nav-link active" href="donorRegister.jsp">Donate Blood</a></li>
                <li class="nav-item"><a class="nav-link" href="aboutdonation.jsp">About Donation</a></li>
                <li class="nav-item"><a class="nav-link" href="home.jsp#contact">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mt-4">
    <div class="row">

    <div class="register-box">
        <h2 style="color: #b22222;">Donor Registration</h2><br>
        <%
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p class="text-danger"><%= errorMessage %></p>
        <%
            session.removeAttribute("errorMessage");
            }
        %>
        <form action="DonorRegisterServlet" method="post" onsubmit="return validateForm();">
    <div class="input-group">
        <input type="text" name="fullName" id="fullName" class="form-control" placeholder=" " required onkeypress="return onlyAlphabets(event, true);">
        <label>Full Name</label>
    </div>
    <div class="input-group">
        <input type="text" name="username" id="username" class="form-control" placeholder=" " required onkeypress="return onlyAlphabets(event, false);">
        <label>User Name</label>
    </div>
    <div class="input-group">
        <input type="number" name="age" class="form-control" placeholder=" " required oninput="this.value = this.value.slice(0, 3);">
        <label>Age</label>
    </div>
    <div class="input-group">
        <select name="gender" class="form-select" required>
            <option value="" disabled selected></option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>
        <label>Gender</label>
    </div>
    <div class="input-group">
        <select name="bloodGroup" class="form-select" required>
            <option value="" disabled selected></option>
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
        </select>
        <label>Blood Group</label>
    </div>
    <div class="input-group">
        <textarea name="address" class="form-control" placeholder=" " required></textarea>
        <label>Address</label>
    </div>
    <div class="input-group">
        <input type="email" name="email" class="form-control" placeholder=" " required>
        <label>Email</label>
    </div>
    <div class="input-group">
        <input type="number" name="contactNumber" id="contactNumber" class="form-control" placeholder=" " required oninput="validateContactNumber(this)" maxlength="10">
        <label>Contact Number</label>
    </div>
    <div class="input-group">
        <input type="password" name="password" id="password" class="form-control" placeholder=" " required>
        <label>Password</label>
    </div>
    <button type="submit" class="btn btn-danger">Register</button>
</form>        
        <div class="login-link">
            <p>Already have an account? <a href="DonorLogin.jsp" class="text-danger">Login Here</a></p>
        </div>
    </div>
    </div>
</div>
</body>
</html>