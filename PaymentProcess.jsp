<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Secure Payment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .payment-container {
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        background: white;
        border-radius: 10px;
        box-shadow: 5px 5px 10px 10px gray;
    }
    .form-label {
        font-weight: bold;
    }
    .error {
        color: red;
        font-size: 14px;
        display: none;
    }
    .btn-payment {
        background-color: green;
        color: white;
        font-weight: bold;
    }
</style>
<body>
<%
    String bloodGroup = request.getParameter("bloodGroup");
    String quantityNeeded = request.getParameter("requestedQuantity");
    String totalAmount = request.getParameter("totalPrice");
%>
<div class="payment-container">
    <h3 class="text-center">Secure Payment</h3>
    <form action="ConfirmPayment.jsp" method="POST" onsubmit="return validatePayment()">
        <input type="hidden" name="bloodGroup" value="<%= bloodGroup %>">
        <input type="hidden" name="requestedQuantity" value="<%= quantityNeeded %>">
        <input type="hidden" name="totalPrice" value="<%= totalAmount %>">
        <label class="form-label">Select Payment Method:</label>
        <div class="mb-3">
            <input type="radio" name="paymentMethod" value="card" checked onclick="togglePaymentMethod()"> Debit/Credit Card
            <input type="radio" name="paymentMethod" value="upi" onclick="togglePaymentMethod()"> UPI Payment
        </div>
        <div id="cardPaymentSection">
            <div class="mb-3">
                <label class="form-label">Cardholder Name:</label>
                <input type="text" name="cardholderName" class="form-control" required onkeypress="return /^[a-zA-Z\s]$/.test(String.fromCharCode(event.which));">
            </div>
            <div class="mb-3">
    <label class="form-label">Card Number:</label>
    <input type="text" id="cardNumber" name="cardNumber" class="form-control" maxlength="16" required
           onkeypress="return /[0-9]/.test(String.fromCharCode(event.which));">
    <small class="error" id="cardError"></small>
</div>

            <div class="row mb-3">
                <div class="col">
                    <label class="form-label">Expiry Date:</label>
                    <select class="form-select" name="expiryMonth" required>
                        <option value="">MM</option>
                        <% for (int i = 1; i <= 12; i++) { %>
                            <option value="<%= i %>"><%= i %></option>
                        <% } %>
                    </select>
                </div>
                <div class="col">
                    <label class="form-label">Year:</label>
                    <select class="form-select" name="expiryYear" required>
                        <option value="">YYYY</option>
                        <% for (int i = 2024; i <= 2035; i++) { %>
                            <option value="<%= i %>"><%= i %></option>
                        <% } %>
                    </select>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">CVV:</label>
                <input type="password" id="cvv" name="cvv" class="form-control" maxlength="3" required onkeypress="return /[0-9]/.test(String.fromCharCode(event.which));">
                <small class="error" id="cvvError"></small>
            </div>
        </div>
        <div id="upiPaymentSection" style="display: none;">
            <div class="mb-3">
                <label class="form-label">UPI ID:</label>
                <input type="text" id="upiId" name="upiId" class="form-control" oninput="validateUPI()">
                <small class="text-muted">Example: username@upi</small>
                <small class="error" id="upiError">Invalid UPI ID. Example: user@upi</small>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">Amount:</label>
            <input type="text" name="amount" class="form-control" value="₹<%= totalAmount %>" readonly>
        </div>
        <button type="submit" style="background:#d9534f; "class="btn btn-payment w-100">Pay</button>
    </form>
</div>
<script>
    function togglePaymentMethod() {
        let cardSection = document.getElementById("cardPaymentSection");
        let upiSection = document.getElementById("upiPaymentSection");
        let selectedMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
        if (selectedMethod === "card") {
            cardSection.style.display = "block";
            upiSection.style.display = "none";
        } else {
            cardSection.style.display = "none";
            upiSection.style.display = "block";
        }
    }

    function validateUPI() {
        let upiId = document.getElementById("upiId").value.trim();
        let upiError = document.getElementById("upiError");
        let upiRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z]+$/;
        if (!upiRegex.test(upiId)) {
            upiError.style.display = "block";
            return false;
        } else {
            upiError.style.display = "none";
            return true;
        }
    }

    function validatePayment() {
        let selectedMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
        let isValid = true;

        if (selectedMethod === "card") {
            let cardNumber = document.getElementById("cardNumber").value.trim();
            let cardError = document.getElementById("cardError");
            if (cardNumber.length !== 16 || isNaN(cardNumber)) {
                cardError.style.display = "block";
                cardError.innerText = "Card number must be 16 digits.";
                isValid = false;
            } else {
                cardError.style.display = "none";
            }

            let cvv = document.getElementById("cvv").value.trim();
            let cvvError = document.getElementById("cvvError");
            if (cvv.length !== 3 || isNaN(cvv)) {
                cvvError.style.display = "block";
                cvvError.innerText = "CVV must be 3 digits.";
                isValid = false;
            } else {
                cvvError.style.display = "none";
            }
        } else if (selectedMethod === "upi") {
            if (!validateUPI()) {
                isValid = false;
            }
        }

        if (!isValid) {
            return false; // prevent form submit
        }

        alert("Payment Successful! Click OK to continue.");
        return true; // allow form to submit
    }
</script>

</body>
</html>
