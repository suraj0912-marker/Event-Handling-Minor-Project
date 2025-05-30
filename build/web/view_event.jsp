<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Event" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Events</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9fbff;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #2e3a59;
            margin-bottom: 25px;
        }
        table {
            width: 90%;
            margin: 0 auto 30px;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 8px rgba(0,0,0,0.05);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 14px 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #eef2f6;
            color: #333;
        }
        .note {
            text-align: center;
            padding: 15px 0;
            color: #777;
            font-style: italic;
        }
        .back-link {
            text-align: center;
        }
        .back-link a {
            display: inline-block;
            text-decoration: none;
            color: #4466dd;
            padding: 10px 20px;
            background-color: #e0e7ff;
            border-radius: 5px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .back-link a:hover {
            background-color: #c0cfff;
        }
    </style>
</head>
<body>

    <h2>All Available Events</h2>

    <table>
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Date</th>
            <th>Fee (₹)</th>
        </tr>
        <%
            List<Event> eventList = (List<Event>) request.getAttribute("eventList");
            if (eventList != null && !eventList.isEmpty()) {
                for (Event e : eventList) {
        %>
        <tr>
            <td><%= e.getTitle() %></td>
            <td><%= e.getDescription() %></td>
            <td><%= e.getEventDate() %></td>
            <td><%= e.getFee() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4" class="note">No events are currently available.</td>
        </tr>
        <% } %>
    </table>

    <div class="back-link">
        <a href="student_dashboard.jsp">Back to Dashboard</a>
    </div>

</body>
</html>
