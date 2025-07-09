<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register for Donation</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
            padding: 50px;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #b10000;
        }

        label {
            display: block;
            margin-top: 20px;
            font-weight: bold;
        }

        input[type="text"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 30px;
            background-color: #b10000;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #900000;
        }
    </style>
    <script>
        window.onload = function () {
            const today = new Date().toISOString().split("T")[0];
            document.getElementById("donationDate").setAttribute("min", today);
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Register for Donation</h2>
        <form action="RegisterDonationServlet" method="post">
            <label for="donationDate">Date of Donation:</label>
            <input type="date" id="donationDate" name="donationDate" required>

            <label for="location">Location:</label>
            <input type="text" id="location" name="location" required>

            <label for="units">Units Donated (ml):</label>
            <input type="number" id="units" name="units" min="50" max="500" required>

            <input type="submit" value="Submit Donation">
        </form>
    </div>
</body>
</html>
