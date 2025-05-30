<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Handling Portal</title>
    <style>
        body {
            font-family: sans-serif;
            background: #dbeafe;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 25px;
            font-size: 24px;
        }

        .btn {
            display: inline-block;
            margin: 10px 5px;
            padding: 12px 20px;
            font-size: 15px;
            border: none;
            border-radius: 6px;
            background: #3498db;
            color: white;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #2c80b4;
        }

        footer {
            margin-top: 25px;
            font-size: 13px;
            color: #666;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Welcome to Event Handling Portal</h1>
        <a href="login.jsp" class="btn">Login</a>
        <a href="register.jsp" class="btn">Register</a>

        <footer>
            <!-- Optional: add credits or small note here -->
            &copy; 2025 Event Portal. All rights reserved.
        </footer>
    </div>

</body>
</html>
