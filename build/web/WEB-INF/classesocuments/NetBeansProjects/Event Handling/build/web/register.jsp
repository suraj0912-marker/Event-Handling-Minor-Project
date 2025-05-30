<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Event Portal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #fdfbfb, #ebedee);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 420px;
        }

        h2 {
            text-align: center;
            color: #444;
            margin-bottom: 20px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #3e8e41;
        }

        .error {
            color: red;
            text-align: center;
            font-size: 14px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Student Registration</h2>

    <% String error = request.getParameter("error");
       if (error != null) { %>
       <div class="error">Registration failed. Try again.</div>
    <% } %>

    <form action="RegisterServlet" method="post">
        <input type="text" name="name" placeholder="Full Name" required />
        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="text" name="branch" placeholder="Branch" required />
        <input type="text" name="year" placeholder="Year" required />
        <input type="text" name="semester" placeholder="Semester" required />
        <input type="text" name="mobile" placeholder="Mobile Number" required />

        <select name="question" required>
            <option value="">-- Select Security Question --</option>
            <option value="What is your pet's name?">What is your pet's name?</option>
            <option value="What is your mother's maiden name?">What is your mother's maiden name?</option>
            <option value="What is your favorite teacher's name?">What is your favorite teacher's name?</option>
        </select>

        <input type="text" name="answer" placeholder="Answer" required />

        <button type="submit" class="btn">Register</button>
    </form>
</div>

</body>
</html>
