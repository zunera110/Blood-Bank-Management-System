<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Blood Stock</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">Manage Blood Stock</h2>
        <a href="AddBloodStock.jsp" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addStockModal">Add Blood Stock</a>
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Blood Group</th>
                    <th>Quantity (Units)</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Map<String, String>> stockList = (List<Map<String, String>>) request.getAttribute("stockList");
                    if (stockList != null) {
                        for (Map<String, String> stock : stockList) {
                %>
                <tr>
                    <td><%= stock.get("id") %></td>
                    <td><%= stock.get("bloodGroup") %></td>
                    <td><%= stock.get("quantity") %></td>
                    <td>
<!--                        <button class="btn btn-warning btn-sm edit-btn" data-bs-toggle="modal" data-bs-target="#editStockModal"
                                data-id="<%= stock.get("id") %>"
                                data-bloodgroup="<%= stock.get("bloodGroup") %>"
                                data-quantity="<%= stock.get("quantity") %>">Edit</button>-->
                        <a href="ManageBloodStockServlet?action=reduce&id=<%= stock.get("id") %>" class="btn btn-warning  btn-sm">Reduce</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4" class="text-center text-danger">No data available</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Add Blood Stock Modal -->
    <div class="modal fade" id="addStockModal" tabindex="-1" aria-labelledby="addStockModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addStockModalLabel">Add Blood Stock</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="ManageBloodStockServlet" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Blood Group</label>
                            <select name="bloodGroup" class="form-select" required>
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
                        <div class="mb-3">
                            <label class="form-label">Quantity</label>
                            <input type="number" name="quantity" class="form-control" required min="1">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="action" value="add">Add Stock</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.querySelectorAll(".edit-btn").forEach(button => {
                button.addEventListener("click", function() {
                    document.querySelector("#editStockModal input[name='id']").value = this.getAttribute("data-id");
                    document.querySelector("#editStockModal select[name='bloodGroup']").value = this.getAttribute("data-bloodgroup");
                    document.querySelector("#editStockModal input[name='quantity']").value = this.getAttribute("data-quantity");
                });
            });
        });
    </script>
</body>
</html>
