<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Queries</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">User Queries</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Message</th>
                    <th>Status</th>
                    <th style="width: 250px;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Map<String, String>> queryList = (List<Map<String, String>>) request.getAttribute("queryList");
                    if (queryList != null && !queryList.isEmpty()) {
                        for (Map<String, String> query : queryList) {
                %>
                <tr>
                    <td><%= query.get("id") %></td>
                    <td><%= query.get("name") %></td>
                    <td><%= query.get("email") %></td>
                    <td><%= query.get("message") %></td>
                     <td><%= query.get("status") %></td>
                <td>
                <form action="ReplyQuery.jsp" method="get" style="display:inline;">
    <input type="hidden" name="email" value="<%= query.get("email") %>">
    <input type="hidden" name="queryId" value="<%= query.get("id") %>">
    <button type="submit" class="btn btn-info btn-sm">Reply</button>
</form>


                <!-- Mark as Resolved Action (only show if not already resolved) -->
                <%
                    String status = query.get("status");
                    if (status == null || !status.equalsIgnoreCase("Resolved")) {
                %>
        
                <form action="MarkResolvedServlet" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= query.get("id") %>">
                    <button type="submit" class="btn btn-success btn-sm">Mark Resolved</button>
                </form>
                
                <%
                    }
                %>

    <!-- Delete Action -->
    <form action="DeleteQueryServlet" method="post" style="display:inline;">
        <input type="hidden" name="id" value="<%= query.get("id") %>">
        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
    </form>
</td>

                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="text-center">No queries found</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
