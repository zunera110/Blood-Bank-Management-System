<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Donor</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .form-container {
            width: 70%;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: #fff;
        }
        .form-left, .form-right {
            width: 48%;
        }
        .form-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .form-group label {
            width: 30%;
            font-weight: bold;
            font-size: 1.1rem;
        }
        .form-group input, .form-group select, .form-group textarea {
            width: 65%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .form-container h2 {
            width: 100%;
            text-align: center;
            margin-bottom: 30px;
            color: #4CAF50;
        }
        .btn-custom, .btn-back {
            width: 200px;
            margin: 10px;
            border-radius: 5px;
        }
        .btn-custom {
            background-color: #4CAF50;
            color: white;
        }
        .btn-back {
            background-color: #f0f0f0;
            color: #333;
        }
        .form-group input::placeholder {
            color: #aaa;
        }
        .btn-custom:hover, .btn-back:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Add New Donor</h2>

    <% String message = (String) request.getAttribute("message");
        if (message != null) { %>
        <div class="alert alert-info"><%= message %></div>
    <% } %>

    <form action="AddDonorServlet" method="post" onsubmit="return validatePassword();">
        <div class="form-container">
            <div class="form-left">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" placeholder="Enter Full Name" class="form-control" required
                           pattern="[A-Za-z ]+" title="Only characters and spaces allowed"
                           onkeypress="return /^[a-zA-Z ]$/.test(event.key)">
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter Username" class="form-control" required
                           pattern="[A-Za-z]+" title="Only alphabets allowed"
                           onkeypress="return /^[a-zA-Z]$/.test(event.key)">
                </div>

                <div class="form-group">
                    <label for="age">Age</label>
                        <input type="text" id="age" name="age" placeholder="Enter Age" class="form-control" required
                            pattern="[0-9]{1,3}" maxlength="3"
                            title="Only numbers allowed (max 3 digits)"
                            oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0,3);">
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" class="form-control" required>
                        <option value="" disabled selected>Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="bloodGroup">Blood Group</label>
                    <select id="bloodGroup" name="bloodGroup" class="form-control" required>
                        <option value="" disabled selected>Select Blood Group</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                    </select>
                </div>
            </div>

            <div class="form-right">
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" placeholder="Enter Address" class="form-control" required
                              oninput="this.value = this.value.replace(/[^a-zA-Z0-9 ]/g, '')"
                              title="Only letters, numbers and spaces allowed"></textarea>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter Email" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="contactNumber">Contact Number</label>
                        <input type="text" id="contact" name="contactNumber" placeholder="Enter Contact Number" class="form-control" required
                            pattern="[0-9]{10}" maxlength="10"
                            title="Enter a valid 10-digit number"
                            oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0,10);">
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter Password" class="form-control" required>
                </div>
            </div>
        </div>

        <div class="d-flex justify-content-center">
            <button type="submit" class="btn btn-custom">Add Donor</button>
            <a href="ManageDonors.jsp" class="btn btn-back">Back</a>
        </div>
    </form>
</div>

<script>
    function validatePassword() {
        const password = document.getElementById("password").value;

        // Length check
        if (password.length !== 8) {
            alert("Password must be exactly 8 characters long.");
            return false;
        }

        // Content check
        const uppercase = /[A-Z]/.test(password);
        const lowercase = /[a-z]/.test(password);
        const number = /[0-9]/.test(password);
        const specialChar = /[!@#\$%\^\&*\)\(+=._-]/.test(password);

        if (!uppercase || !lowercase || !number || !specialChar) {
            alert("Password must include at least one uppercase letter, one lowercase letter, one number, and one special character.");
            return false;
        }

        return true;
    }
</script>
</body>
</html>
