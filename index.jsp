<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script>
        function validateForm() {
            let username = document.getElementById("username").value;
            let password = document.getElementById("password").value;
        }

        function restrictUsernameInput(event) {
            let key = event.key;
            if (!/^[A-Za-z]$/.test(key)) { 
                event.preventDefault();
            }
        }
    </script>
    <style>
        body {
            /*background: url('BBCells.jpg') no-repeat center center fixed;*/
            background-size: cover;
            font-family: Arial, sans-serif;
        }
        .login-container {
            width: 350px;
            margin: 100px auto;
            margin-top: 200px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 3px 3px 5px 5px grey;
            text-align: center;
        }
        h2 {
            color: #b30000;
        }
        .input-group {
            position: relative;
            margin: 20px 0;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
            font-size: 16px;
            color: #333;
        }
        .input-group label {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            font-size: 16px;
            transition: 0.3s ease all;
            pointer-events: none;
        }
        .input-group input:focus ~ label,
        .input-group input:not(:placeholder-shown) ~ label {
            top: -10px;
            font-size: 14px;
            color: #b30000;
        }
        button {
            background: #b30000;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }

        button:hover {
            background: #800000;
        }
        p a {
            color: #b30000;
            text-decoration: none;
        }
        p a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>User Login</h2>
        <form action="LoginServlet" method="post" onsubmit="return validateForm();" name="frm">
            <div class="input-group">
                <input class="field" type="text" id="username" name="username" required placeholder=" " onkeypress="restrictUsernameInput(event)">
                <label for="username">Username</label>
            </div>
            <div class="input-group">
                <input class="field" type="password" id="password" name="password" required placeholder=" ">
                <label for="password">Password</label>
            </div>
            <%
                String errorMsg = request.getParameter("error");
                if (errorMsg != null) {
            %>
                <script>
                    alert("Invalid username or password!");
                </script>
            <%
                }
            %>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="userregister.jsp">Create Account</a></p>
        <!--<p><a href="ForgetPassword.jsp">Forgot Password?</a></p>-->
    </div>
</body>
</html>