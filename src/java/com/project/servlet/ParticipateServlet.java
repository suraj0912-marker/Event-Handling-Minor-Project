package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.project.model.DBConnection;

import java.io.IOException;
import java.sql.*;

@WebServlet("/ParticipateServlet")
public class ParticipateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentEmail") == null) {
            // User not logged in, redirect to login
            response.sendRedirect("login.jsp");
            return;
        }

        String studentEmail = (String) session.getAttribute("studentEmail");
        String eventIdParam = request.getParameter("event_id");

        if (eventIdParam == null || eventIdParam.trim().isEmpty()) {
            request.setAttribute("errorMsg", "Invalid event selection.");
            request.getRequestDispatcher("view_events.jsp").forward(request, response);
            return;
        }

        int eventId;
        try {
            eventId = Integer.parseInt(eventIdParam.trim());
        } catch (NumberFormatException e) {
            request.setAttribute("errorMsg", "Invalid event ID.");
            request.getRequestDispatcher("view_events.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {

            // Check if the student already participated
            String checkSql = "SELECT 1 FROM participations WHERE student_email = ? AND event_id = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                checkStmt.setString(1, studentEmail);
                checkStmt.setInt(2, eventId);

                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("errorMsg", "You have already participated in this event.");
                        request.getRequestDispatcher("view_events.jsp").forward(request, response);
                        return;
                    }
                }
            }

            // Insert new participation record
            String insertSql = "INSERT INTO participations (student_email, event_id) VALUES (?, ?)";
            try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                insertStmt.setString(1, studentEmail);
                insertStmt.setInt(2, eventId);

                int result = insertStmt.executeUpdate();
                if (result > 0) {
                    request.setAttribute("successMsg", "You have successfully joined the event!");
                } else {
                    request.setAttribute("errorMsg", "Failed to register participation. Please try again.");
                }
            }

            request.getRequestDispatcher("view_events.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Oops! Something went wrong with the database.");
            request.getRequestDispatcher("view_events.jsp").forward(request, response);
        }
    }
}
