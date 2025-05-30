<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Event" %>
<%@ page import="com.project.model.Participate" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard | Admin</title>
    <style>
        body {
            font-family: sans-serif;
            background: #f3f6fb;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #2a2f45;
        }

        .logout {
            text-align: right;
            margin-bottom: 15px;
        }

        .logout a {
            background: #e74c3c;
            color: #fff;
            padding: 8px 12px;
            border-radius: 5px;
            text-decoration: none;
        }

        .add-event {
            margin: 15px 0;
        }

        .add-event a {
            background: #2ecc71;
            color: white;
            padding: 8px 14px;
            border-radius: 5px;
            text-decoration: none;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            margin: 30px 0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.08);
        }

        th, td {
            padding: 11px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #f0f4f9;
            font-weight: bold;
        }

        .btn {
            padding: 6px 10px;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
        }

        .btn-delete {
            background: #c0392b;
        }

        .note {
            text-align: center;
            font-style: italic;
            color: #777;
        }
    </style>
</head>
<body>

    <div class="logout">
        <a href="LogoutServlet">Logout</a>
    </div>

    <h2>Admin Panel</h2>

    <div class="add-event">
        <a href="add_event.jsp">+ Add Event</a>
    </div>

    <h3>Event List</h3>
    <table>
        <tr>
            <th>Title</th>
            <th>Date</th>
            <th>Fee (₹)</th>
            <th>Actions</th>
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
                <form action="DeleteEventServlet" method="post" style="display:inline;">
                    <input type="hidden" name="eventId" value="<%= e.getId() %>">
                    <button type="submit" class="btn btn-delete">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="4" class="note">No events added yet.</td></tr>
        <%
            }
        %>
    </table>

    <h3>Participants</h3>
    <table>
        <tr>
            <th>Name</th>
            <th>Event</th>
            <th>Branch</th>
            <th>Year</th>
            <th>Mobile</th>
        </tr>
        <%
            List<Participate> participation = (List<Participate>) request.getAttribute("participationList");
            if (participation != null && !participation.isEmpty()) {
                for (Participate p : participation) {
        %>
        <tr>
            <td><%= p.getStudentName() %></td>
            <td><%= p.getEventTitle() %></td>
            <td><%= p.getBranch() %></td>
            <td><%= p.getYear() %></td>
            <td><%= p.getMobile() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="5" class="note">No participation records found.</td></tr>
        <%
            }
        %>
    </table>

</body>
</html>
