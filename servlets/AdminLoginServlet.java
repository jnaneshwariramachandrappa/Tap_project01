package com.javabite.servlets;

import com.javabite.dao.AdminDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Show login page
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/admin/admin-login.jsp")
               .forward(request, response);
    }

    // Handle login
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get form data
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // 2. Call DAO
        AdminDAO dao = new AdminDAO();

        boolean isValid = dao.validateAdmin(phone, password);

        // 3. Check login
        if (isValid) {

            HttpSession session = request.getSession();

            session.setAttribute("admin", phone);

            // Optional (if you want later)
            // session.setAttribute("role", "ADMIN");

            // Redirect to admin dashboard
            response.sendRedirect(
                    request.getContextPath() + "/admin/orders"
            );

        } else {

            // Invalid login
            request.setAttribute("error", "Invalid credentials! Try again.");

            request.getRequestDispatcher("/admin/admin-login.jsp")
                   .forward(request, response);
        }
    }
}