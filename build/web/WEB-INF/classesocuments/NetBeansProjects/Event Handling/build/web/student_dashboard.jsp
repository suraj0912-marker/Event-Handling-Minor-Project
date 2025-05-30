<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Event" %>
<%@ page import="com.project.model.Participation" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 20px;
        }
        h1, h2 {
            text-align: center;
            color: #333;
        }
        .logout {
            text-align: right;
            margin-bottom: 20px;
        }
        .logout a {
            background-color: #e74c3c;
            color: white;
            padding: 8px 14px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
        }
        .section {
            margin: 30px auto;
            max-width: 900px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f0f4f8;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #3e8e41;
        }
        .note {
            text-align: center;
            font-style: italic;
            color: #888;
            padding: 10px;
        }
    </style>
</head>
<body>

    <div class="logout">
        <a href="LogoutServlet">Logout</a>
    </div>

    <h1>Welcome, Student</h1>

    <!-- Available Events Section -->
    <div class="section">
        <h2>Available Events</h2>
        <table>
            <tr>
                <th>Title</th>
                <th>Date</th>
                <th>Fee (₹)</th>
                <th>Action</th>
            </tr>

            <%
                List<Event> events = (List<Event>) request.getAttribute("eventList");
                if (events != null && !events.isEmpty()) {
                    for (Event e : events) {
            %>
            <tr>
                <td><%= e.getTitle() %></td>
                <td><%= e.getEventDate() %></td>
                <td><%= e.getFee() %></td>
                <td>
                    <form action="ParticipateServlet" method="post">
                        <input type="hidden" name="eventId" value="<%= e.getId() %>" />
                        <button type="submit" class="btn">Participate</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4" class="note">No events available at the moment.</td>
            </tr>
            <% } %>
        </table>
    </div>

    <!-- Participation History Section -->
    <div class="section">
        <h2>Your Participations</h2>
        <table>
            <tr>
                <th>Event Title</th>
                <th>Date</th>
                <th>Fee Paid (₹)</th>
            </tr>

            <%
                List<Participation> participations = (List<Participation>) request.getAttribute("participationList");
                if (participations != null && !participations.isEmpty()) {
                    for (Participation p : participations) {
            %>
            <tr>
                <td><%= p.getEventTitle() %></td>
                <td><%= p.getEventDate() %></td>
                <td><%= p.getFee() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="3" class="note">You haven't participated in any events yet.</td>
            </tr>
            <% } %>
        </table>
    </div>

</body>
</html>
