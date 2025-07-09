<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    String email = request.getParameter("email");
    String queryId = request.getParameter("queryId");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Reply to User Query</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .reply-container {
            max-width: 600px;
            margin: 50px auto;
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
    </style>
</head>
<body>
    <div class="container reply-container">
        <h2>Reply to User Query</h2>
        <form method="post" action="ReplyQueryServlet">
            <div class="form-group">
                <label>User Email</label>
                <input type="email" name="email" class="form-control" readonly value="<%= email %>">
            </div>
            <div class="form-group">
                <label>Your Reply</label>
                <textarea name="adminReply" class="form-control" rows="6" required></textarea>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Send Reply</button>
                <a href="ManageQueryServlet" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
