<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register - Blood Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        body {
            background-size: cover;
        }
        .register-box {
            width: 350px;
            margin: 8% auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 3px 3px 5px 5px grey;
            text-align: center;
        }
        .input-group {
            position: relative;
            margin-bottom: 20px;
        }
        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
            font-size: 16px;
            background: transparent;
        }
        .input-group label {
            position: absolute;
            top: 10px;
            left: 12px;
            color: #999;
            font-size: 16px;
            transition: 0.3s ease all;
            pointer-events: none;
        }
        .input-group input:focus ~ label,
        .input-group input:not(:placeholder-shown) ~ label {
            top: -10px;
            font-size: 14px;
            color: #b22222;
        }
        .btn-danger {
            width: 100%;
            background-color: #b22222;
            border-color: #b22222;
        }
        .btn-danger:hover {
            background-color: #8b1a1a;
            border-color: #8b1a1a;
        }
        .login-link {
            margin-top: 10px;
        }
    </style>

<script>
    function validateForm() {
        let password = document.getElementById("password");
        let passwordLengthRegex = /^.{8}$/;
        let passwordComplexityRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8}$/;
        if (!passwordLengthRegex.test(password.value)) {
            alert("Password must be 8 characters long!.");
            return false;
        }
        if (!passwordComplexityRegex.test(password.value)) {
            alert("Password must include at least one Uppercase, Lowercase, Number, and a special character.");
            return false;
        }
        return true;
    }

    // ✅ Full Name: Allow letters + space
    function restrictFullNameInput(event) {
        if (!/^[A-Za-z\s]$/.test(event.key)) {
            event.preventDefault();
        }
    }

    // ✅ Username: Allow only letters (no space)
    function restrictUsernameInput(event) {
        if (!/^[A-Za-z]$/.test(event.key)) {
            event.preventDefault();
        }
    }

    // ✅ Password: Max 8 characters
    function limitPasswordLength(event) {
        const input = event.target;
        if (input.value.length >= 8 && event.key !== 'Backspace' && event.key !== 'Delete') {
            event.preventDefault();
        }
    }

    window.onload = function () {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has("success")) {
            alert(" Congratulations!! Registration Successful..");
        }
        if (urlParams.has("error")) {
            alert("" + urlParams.get("error"));
        }
    };

    function validateContactNumber(input) {
        if (input.value.length > 10) {
            input.value = input.value.slice(0, 10); // Trim to 10 digits
        }
    }
</script>
    
    
</head>
<body>
    <div class="register-box">
        <h2>User Register</h2>
        <% String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null) { %>
            <p class="text-danger"><%= errorMessage %></p>
        <% session.removeAttribute("errorMessage"); } %>
        <form action="RegisterServlet" method="post" onsubmit="return validateForm()">
            <div class="input-group">
                <input type="text" id="fullname" name="full_name" class="form-control" placeholder=" " onkeypress="restrictFullNameInput(event)" required>
                <label>Full Name</label>
            </div>
            <div class="input-group">
                <input type="text" id="username" name="username" class="form-control" placeholder=" " onkeypress="restrictUsernameInput(event)" required>
                <label>Username</label>
            </div>
            <div class="input-group">
                <input type="email" name="email" class="form-control" placeholder=" " required>
                <label>Email</label>
            </div>
            <div class="input-group">
                <input type="password" id="password" name="password" class="form-control" placeholder=" " onkeypress="limitPasswordLength(event)" required>
                <label>Password</label>
            </div>
            <button type="submit" class="btn btn-danger">Register</button>
        </form>
        <div class="login-link">
            <p>Already have an account? <a href="index.jsp" class="text-danger">Login Here</a></p>
        </div>
    </div>
</body>
</html>
