<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Event Portal</title>
    <style>
        body {
            font-family: sans-serif;
            background: linear-gradient(to right, #f1f5f9, #e2f0fb);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background: white;
            padding: 35px;
            border-radius: 12px;
            width: 360px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2e3a59;
            margin-bottom: 25px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 12px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            font-size: 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #2d83bc;
        }

        .error, .success {
            font-size: 14px;
            text-align: center;
            margin-bottom: 10px;
        }

        .error {
            color: #e74c3c;
        }

        .success {
            color: #27ae60;
        }

        .link-container {
            text-align: center;
            margin-top: 18px;
        }

        .link-container a {
            text-decoration: none;
            color: #555;
            font-size: 13px;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>User Login</h2>

        <!-- Show error or success -->
        <%
            String error = request.getParameter("error");
            String success = request.getParameter("success");
            if (error != null) {
        %>
            <div class="error"><%= error %></div>
        <%
            } else if (success != null) {
        %>
            <div class="success"><%= success %></div>
        <%
            }
        %>

        <form action="LoginServlet" method="post">
            <input type="email" name="email" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            <button type="submit" class="btn">Login</button>
        </form>

        <div class="link-container">
            <a href="forgot_password.jsp">Forgot Password?</a><br>
            <a href="index.jsp">Back to Home</a>
        </div>
    </div>

</body>
</html>
