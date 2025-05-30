package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.project.model.DBConnection;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private String safeTrim(String param) {
        return (param == null) ? "" : param.trim();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String name = safeTrim(request.getParameter("name"));
        String email = safeTrim(request.getParameter("email"));
        String password = safeTrim(request.getParameter("password"));
        String branch = safeTrim(request.getParameter("branch"));
        String year = safeTrim(request.getParameter("year"));
        String semester = safeTrim(request.getParameter("semester"));
        String mobile = safeTrim(request.getParameter("mobile"));
        String question = safeTrim(request.getParameter("question"));
        String answer = safeTrim(request.getParameter("answer"));

        if (name.isEmpty() || email.isEmpty() || password.isEmpty() || branch.isEmpty() ||
                year.isEmpty() || semester.isEmpty() || mobile.isEmpty() || question.isEmpty() || answer.isEmpty()) {
            response.sendRedirect("register.jsp?error=Please fill all the fields.");
            return;
        }

       
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO users (name, email, password, branch, year, semester, mobile, role, question, answer) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, 'student', ?, ?)";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, hashedPassword);
                stmt.setString(4, branch);
                stmt.setString(5, year);
                stmt.setString(6, semester);
                stmt.setString(7, mobile);
                stmt.setString(8, question);
                stmt.setString(9, answer);

                int rowsInserted = stmt.executeUpdate();

                if (rowsInserted > 0) {
                    response.sendRedirect("login.jsp?success=Registered successfully, please login.");
                } else {
                    response.sendRedirect("register.jsp?error=Registration failed. Please try again.");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();  
            response.sendRedirect("register.jsp?error=Server error occurred. Please try again.");
        }
    }
}
