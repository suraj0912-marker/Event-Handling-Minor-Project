package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.project.model.DBConnection;

import java.io.IOException;
import java.sql.*;

@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String eventName = request.getParameter("name");
        String eventDesc = request.getParameter("description");
        String priceInput = request.getParameter("price");

        // Basic validation
        if (eventName == null || eventName.trim().isEmpty() ||
            eventDesc == null || eventDesc.trim().isEmpty() ||
            priceInput == null || priceInput.trim().isEmpty()) {
            
            request.setAttribute("errorMsg", "Please fill in all the fields.");
            request.getRequestDispatcher("add_event.jsp").forward(request, response);
            return;
        }

        int price = 0;
        try {
            price = Integer.parseInt(priceInput.trim());
            if (price < 0) {
                throw new NumberFormatException("Negative price not allowed.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMsg", "Please enter a valid positive number for price.");
            request.getRequestDispatcher("add_event.jsp").forward(request, response);
            return;
        }

        String insertSQL = "INSERT INTO events (name, description, price) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(insertSQL)) {

            stmt.setString(1, eventName.trim());
            stmt.setString(2, eventDesc.trim());
            stmt.setInt(3, price);

            int inserted = stmt.executeUpdate();

            if (inserted > 0) {
                request.setAttribute("successMsg", "Event added successfully!");
            } else {
                request.setAttribute("errorMsg", "Oops! Something went wrong. Please try again.");
            }

        } catch (SQLException e) {
            e.printStackTrace();  // For debugging during development
            request.setAttribute("errorMsg", "Database error: Could not save event.");
        }

        request.getRequestDispatcher("add_event.jsp").forward(request, response);
    }
}
