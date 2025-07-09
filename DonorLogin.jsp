<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Donor Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
    body {
        background-size: cover;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .login-box {
        width: 350px;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 2px 2px 5px 5px grey;
        text-align: center;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .btn-danger {
        width: 100%;
        background-color: #b22222;
        border-color: #b22222;
        padding: 10px;
    }
    .btn-danger:hover {
        background-color: #8b1a1a;
        border-color: #8b1a1a;
    }
    .register-link {
        margin-top: 10px;
    }
</style>
<body>

<div class="login-box">
    <h2 style="color: #b22222;">Donor Login</h2><br>
    <%
        String errorMessage = (String) session.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <script>
            window.onload = function() {
                alert("Incorrect Username or Password");
            }
        </script>
    <%
        session.removeAttribute("errorMessage");
        }
    %>
    <form action="DonorLoginServlet" method="post">
        <div class="form-group">
            <input type="text" name="username" class="form-control" placeholder="Username" required onkeypress="return /^[a-zA-Z]$/.test(String.fromCharCode(event.which));">
        </div>
        <div class="form-group">
            <input type="password" name="password" class="form-control" placeholder="Password" required required oninput="this.value = this.value.slice(0,8);">
        </div>
        <button type="submit" class="btn btn-danger">Login</button>
    </form>
    <div class="register-link">
        <p>Don't have an account? <a href="donorRegister.jsp" class="text-danger">Register Here</a></p>
    </div>
</div>
</body>
</html>
