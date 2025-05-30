<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password | Event Portal</title>
    <style>
        body {
            font-family: sans-serif;
            background: #ecf4fb;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: white;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            width: 360px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
        }

        .btn:hover {
            background: #2980b9;
        }

        .error {
            color: red;
            font-size: 13px;
            text-align: center;
            margin-bottom: 10px;
        }

        .link-container {
            text-align: center;
            margin-top: 15px;
        }

        .link-container a {
            color: #555;
            text-decoration: none;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Forgot Password</h2>

        <% 
            String error = request.getParameter("error");
            if (error != null) { 
        %>
            <div class="error">Something went wrong. Please try again.</div>
        <% 
            } 
        %>

        <form action="ForgotPasswordServlet" method="post">
            <input type="email" name="email" placeholder="Enter your registered email" required>

            <select name="question" required>
                <option value="">Choose your security question</option>
                <option>What is your favorite color?</option>
                <option>What is your mother's maiden name?</option>
                <option>What was your first pet's name?</option>
                <option>What city were you born in?</option>
            </select>

            <input type="text" name="answer" placeholder="Answer to the question" required>
            <input type="password" name="newPassword" placeholder="New Password" required>

            <button type="submit" class="btn">Reset Password</button>
        </form>

        <div class="link-container">
            <a href="login.jsp">← Back to Login</a>
        </div>
    </div>

</body>
</html>
