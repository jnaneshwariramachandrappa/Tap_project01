package com.javabite.servlets;

import com.javabite.dao.UserDAO;
import com.javabite.models.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet; // Added this
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register") // This maps the servlet to http://localhost:8080/JavaBite/register
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forwards the user to the register.jsp page
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get data from form
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Create User object
        User user = new User();
        user.setFullName(fullName);
        user.setPhone(phone);
        user.setAddress(address);

        // Attempt registration
        boolean success = userDAO.registerUser(user);

        if (success) {
            // Redirect to login page on success
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            // Return to register page with error message
            request.setAttribute("error", "Registration failed! Try again.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}