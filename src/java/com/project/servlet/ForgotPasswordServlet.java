package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.project.model.DBConnection;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.*;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String securityAnswer = request.getParameter("answer");
        String newPassword = request.getParameter("new_password");

        // Basic input validation
        if (email == null || email.trim().isEmpty() ||
            securityAnswer == null || securityAnswer.trim().isEmpty() ||
            newPassword == null || newPassword.trim().isEmpty()) {

            request.setAttribute("errorMsg", "Please fill in all fields.");
            request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {

            String query = "SELECT * FROM students WHERE email = ? AND answer = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(query)) {
                checkStmt.setString(1, email.trim());
                checkStmt.setString(2, securityAnswer.trim());

                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) {
                        // Email and answer matched, update password
                        String hashed = BCrypt.hashpw(newPassword.trim(), BCrypt.gensalt());

                        String updateSQL = "UPDATE students SET password = ? WHERE email = ?";
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateSQL)) {
                            updateStmt.setString(1, hashed);
                            updateStmt.setString(2, email.trim());

                            int rows = updateStmt.executeUpdate();

                            if (rows > 0) {
                                request.setAttribute("successMsg", "Password reset successfully.");
                            } else {
                                request.setAttribute("errorMsg", "Could not update password. Try again.");
                            }
                        }

                    } else {
                        request.setAttribute("errorMsg", "Invalid email or security answer.");
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Server error. Please try later.");
        }

        request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
    }
}
