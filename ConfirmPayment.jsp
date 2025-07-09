<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<html>
<head>
    <title>Payment Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 50px;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 40%;
            margin: auto;
        }
        h2 {
            color: green;
        }
        .details {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            background: #fafafa;
            border-radius: 5px;
            text-align: left;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            margin: 10px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

<%
    // Retrieve payment details
    String paymentMethod = request.getParameter("paymentMethod");
    String cardNumber = request.getParameter("cardNumber");
    String cardHolder = request.getParameter("cardholderName");  // ✅ Fixed mismatch
    String expiryMonth = request.getParameter("expiryMonth");  // ✅ Fixed
    String expiryYear = request.getParameter("expiryYear");  // ✅ Fixed
    String cvv = request.getParameter("cvv");
    String upiId = request.getParameter("upiId");
    String amount = request.getParameter("totalPrice");  // ✅ Use the correct parameter

    // Get additional details from the previous page
    String bloodGroup = request.getParameter("bloodGroup");
    String quantityNeeded = request.getParameter("requestedQuantity");

    boolean isValid = true;
    String errorMessage = "";

    if (paymentMethod == null || amount == null || amount.isEmpty()) {
        isValid = false;
        errorMessage = "Invalid payment details.";
    } else if ("card".equals(paymentMethod)) {
        if (cardNumber == null || cardNumber.length() < 16 || cardHolder == null || expiryMonth == null || expiryYear == null || cvv == null) {
            isValid = false;
            errorMessage = "All card details are required.";
        }
    } else if ("upi".equals(paymentMethod)) {
        if (upiId == null || upiId.isEmpty()) {
            isValid = false;
            errorMessage = "UPI ID is required.";
        }
    }
%>

<div class="container">
    <% if (!isValid) { %>
        <p class="error"><%= errorMessage %></p>
        <a href="PaymentProcess.jsp" class="btn">Go Back</a>  <!-- ✅ Corrected link -->
    <% } else { %>
        <h2>Payment Successful!</h2>
        <p>Thank you for your payment.</p>

        <div class="details">
            <h3>Payment Details</h3>
            <p><strong>Amount:</strong> ₹<%= amount %></p>
            <p><strong>Payment Method:</strong> <%= paymentMethod.toUpperCase() %></p>
            <p><strong>Blood Group Ordered:</strong> <%= bloodGroup %></p> <!-- ✅ Display additional details -->
            <p><strong>Quantity Requested:</strong> <%= quantityNeeded %> units</p>

            <% if ("card".equals(paymentMethod)) { %>
                <p><strong>Card Holder:</strong> <%= cardHolder %></p>
                <p><strong>Card Number:</strong> **** **** **** <%= cardNumber.substring(cardNumber.length() - 4) %></p>
                <p><strong>Expiry Date:</strong> <%= expiryMonth %>/<%= expiryYear %></p>
            <% } else { %>
                <p><strong>UPI ID:</strong> <%= upiId %></p>
            <% } %>
        </div>

<form action="GeneratePDFServlet" method="post">
    <input type="hidden" name="paymentMethod" value="<%= paymentMethod %>">
    <input type="hidden" name="amount" value="<%= amount %>">
    <input type="hidden" name="bloodGroup" value="<%= bloodGroup %>">
    <input type="hidden" name="requestedQuantity" value="<%= quantityNeeded %>">

    <% if ("card".equals(paymentMethod)) { %>
        <input type="hidden" name="cardNumber" value="<%= cardNumber != null ? cardNumber : "" %>">
        <input type="hidden" name="cardholderName" value="<%= cardHolder != null ? cardHolder : "" %>">
        <input type="hidden" name="expiryMonth" value="<%= expiryMonth != null ? expiryMonth : "" %>">
        <input type="hidden" name="expiryYear" value="<%= expiryYear != null ? expiryYear : "" %>">
        <input type="hidden" name="cvv" value="<%= cvv != null ? cvv : "" %>">
    <% } else { %>
        <input type="hidden" name="upiId" value="<%= upiId != null ? upiId : "" %>">
    <% } %>

    <button type="submit" class="btn">Download as PDF</button>
</form>


        <a href="home.jsp" class="btn">Back to Home</a>
    <% } %>
</div>

</body>
</html>
