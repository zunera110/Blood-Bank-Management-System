<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            /*background: url('BBCells.jpg') no-repeat center center fixed;*/
            background-size: cover;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 5px 5px 15px 10px grey;
            width: 350px;
        }
        h3 {
            color: #b22222;
        }
        .form-group {
            position: relative;
            margin-bottom: 25px;
        }
        .form-group label {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            transition: all 0.3s ease-in-out;
            background: white;
            padding: 0 5px;
            color: #999;
            font-size: 14px;
        }
        .form-control:focus + label,
        .form-control:not(:placeholder-shown) + label {
            top: -12px;
            left: 15px;
            font-size: 12px;
            color: #b22222;
            background: none;
            font-weight: bold;
        }
        .btn-login {
            color: white;
            background-color: #b22210;
            border: none;
            font-size: 16px;
            padding: 12px;
        }
        .btn-login:hover {
            background-color: #8b0000;
        }
    </style>
<script>
    function isLetter(evt) {
        const charCode = evt.which || evt.keyCode;
        const charStr = String.fromCharCode(charCode);
        // Allow only A-Z and a-z
        return /^[a-zA-Z]+$/.test(charStr);
    }

    function removeInvalidChars(input) {
        // Remove anything that's not a letter
        input.value = input.value.replace(/[^a-zA-Z]/g, '');
    }

    function validateForm() {
        let username = document.getElementById("username").value.trim();
        let password = document.getElementById("password").value.trim();
        if (username === "") {
            alert("Username cannot be empty!");
            return false;
        }
        if (password === "") {
            alert("Password cannot be empty!");
            return false;
        }
        return true; 
    }

    window.onload = function () {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('error')) {
            alert("Invalid Username or Password");

            // Remove the 'error' parameter from the URL without reloading
            const newUrl = window.location.origin + window.location.pathname;
            window.history.replaceState({}, document.title, newUrl);
        }
    };
</script>


</head>
<body class="d-flex justify-content-center align-items-center vh-100">
    <div class="login-container text-center">
        <h3>Admin Login</h3><br>
        <form action="AdminLoginServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <!--<input type="text" class="form-control" id="username" name="username" required placeholder=" ">-->
                <input type="text" class="form-control" id="username" name="username" required placeholder=" " 
                     onkeypress="return isLetter(event)" oninput="removeInvalidChars(this)">
                
                <label for="username">Username</label>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="password" name="password" required placeholder=" ">
                <label for="password">Password</label>
            </div>
        
            <button type="submit" class="btn btn-login w-100">Login</button>
        </form>
    </div>
</body>
</html>
