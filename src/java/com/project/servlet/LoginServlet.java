package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.project.model.DBConnection;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Basic validation to avoid null or empty inputs
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            response.sendRedirect("login.jsp?error=Please enter both email and password.");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT * FROM users WHERE email = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email.trim());

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String storedHash = rs.getString("password");
                        String role = rs.getString("role");
                        String name = rs.getString("name");

                        if (BCrypt.checkpw(password, storedHash)) {
                            // Password matches, set session attributes
                            HttpSession session = request.getSession();
                            session.setAttribute("userType", role);
                            session.setAttribute("studentName", name);
                            session.setAttribute("studentEmail", email.trim());

                            // Redirect based on user role
                            if ("admin".equalsIgnoreCase(role)) {
                                response.sendRedirect("admin_dashboard.jsp");
                            } else {
                                response.sendRedirect("student_dashboard.jsp");
                            }
                        } else {
                            // Password incorrect
                            response.sendRedirect("login.jsp?error=Invalid email or password.");
                        }
                    } else {
                        // Email not found
                        response.sendRedirect("login.jsp?error=Invalid email or password.");
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Server error. Please try again later.");
        }
    }
}
