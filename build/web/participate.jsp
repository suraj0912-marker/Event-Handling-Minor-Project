<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.project.model.Event" %>
<!DOCTYPE html>
<html>
<head>
    <title>Participate in Event</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #f0f4f8, #e0ecf8);
            margin: 0;
            padding: 40px 0;
        }

        .container {
            width: 480px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2c3e50;
        }

        .label {
            font-weight: bold;
            margin-top: 15px;
            color: #444;
        }

        .info {
            margin-bottom: 10px;
            line-height: 1.6;
            color: #555;
        }

        .actions {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 15px;
        }

        .btn-confirm {
            background-color: #27ae60;
            color: white;
        }

        .btn-confirm:hover {
            background-color: #219150;
        }

        .btn-back {
            background-color: #bdc3c7;
            color: black;
        }

        .btn-back:hover {
            background-color: #a7b1b5;
        }

        .error {
            text-align: center;
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Confirm Participation</h2>

        <%
            Event event = (Event) request.getAttribute("event");
            if (event != null) {
        %>

        <div class="info">
            <div class="label">Event Name:</div>
            <div><%= event.getTitle() %></div>

            <div class="label">Description:</div>
            <div><%= event.getDescription() %></div>

            <div class="label">Date:</div>
            <div><%= event.getEventDate() %></div>

            <div class="label">Fee:</div>
            <div>₹<%= event.getFee() %></div>
        </div>

        <div class="actions">
            <form action="ParticipateServlet" method="post" style="display:inline;">
                <input type="hidden" name="eventId" value="<%= event.getId() %>">
                <button class="btn btn-confirm" type="submit">Confirm</button>
            </form>
            <a href="student_dashboard.jsp">
                <button class="btn btn-back" type="button">Back</button>
            </a>
        </div>

        <% } else { %>
            <div class="error">Event not found.</div>
        <% } %>

    </div>

</body>
</html>
