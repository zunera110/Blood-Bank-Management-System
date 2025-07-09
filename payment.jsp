<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Payment - BBMS</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<style>
    #div {
        box-shadow: 5px 5px 5px 5px grey;
        width: 400px;
        height: 480px;
        border-radius: 10px;
        padding: 20px;
    }
    button {
        margin-top: 10px;
        display: block;
        width: 100%;
    }
</style>
<body>
    <div class="container mt-5 d-flex justify-content-center">
        <div id="div">
            <h2 class="text-center text-danger">Blood Payment</h2>

            <%
                String bloodGroup = (String) request.getAttribute("bloodGroup");
                Integer availableQuantity = (Integer) request.getAttribute("availableQuantity");
            %>

            <form id="paymentForm" action="PaymentProcess.jsp" method="POST">
                <input type="hidden" name="bloodGroup" value="<%= bloodGroup %>">

                <div class="mb-3">
                    <label class="form-label">Blood Group:</label>
                    <input type="text" class="form-control" value="<%= bloodGroup %>" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label">Available Quantity:</label>
                    <input type="text" class="form-control" value="<%= availableQuantity %>" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label">Quantity Needed:</label>
                    <input type="number" id="quantityNeeded" name="requestedQuantity" class="form-control" min="1" max="<%= availableQuantity %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Total Price:</label>
                    <input type="text" id="totalPrice" name="totalPrice" class="form-control" readonly>
                </div>

                <button type="submit" class="btn btn-danger">Proceed to Payment</button>
            </form>
        </div>
    </div>

    <script>
        document.querySelector("#quantityNeeded").addEventListener("input", function() {
            let quantity = parseInt(this.value);
            let pricePerUnit = 500;
            document.getElementById("totalPrice").value = quantity * pricePerUnit;
        });
    </script>
</body>
</html>
