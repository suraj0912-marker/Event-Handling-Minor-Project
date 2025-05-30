<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Event</title>
    <style>
        body {
            font-family: sans-serif;
            background: #eef2f7;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-box {
            background: #fff;
            padding: 25px 35px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #222;
        }

        input, textarea {
            width: 100%;
            padding: 9px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        textarea {
            resize: vertical;
        }

        .btn {
            width: 100%;
            padding: 11px;
            background: #4a7bff;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
        }

        .btn:hover {
            background: #3a66d6;
        }

        .note {
            text-align: center;
            margin-top: 10px;
            color: #444;
        }

        .msg-success {
            color: green;
            text-align: center;
            margin-bottom: 10px;
        }

        .msg-error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="form-box">
    <h2>New Event</h2>

    <%
        String msg = request.getParameter("msg");
        if ("success".equals(msg)) {
    %>
        <div class="msg-success">Event added successfully!</div>
    <%
        } else if ("error".equals(msg)) {
    %>
        <div class="msg-error">Something went wrong. Please try again.</div>
    <%
        }
    %>

    <form action="AddEventServlet" method="post">
        <input type="text" name="title" placeholder="Event title" required />
        <textarea name="description" rows="4" placeholder="Short description" required></textarea>
        <input type="date" name="date" required />
        <input type="number" name="fee" placeholder="Fee (₹)" min="0" required />
        <button type="submit" class="btn">Add Event</button>
    </form>

    <div class="note">
        <a href="admin_dashboard.jsp">← Back to dashboard</a>
    </div>
</div>

</body>
</html>
