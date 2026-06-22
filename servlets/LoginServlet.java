package com.javabite.servlets;

import com.javabite.dao.UserDAO;
import com.javabite.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/login.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String phone = request.getParameter("phone");

        User user = userDAO.loginUser(phone);

        if (user != null) {

            HttpSession session = request.getSession();

            session.setAttribute("user", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getFullName());

            response.sendRedirect(request.getContextPath() + "/home");

        } else {

            request.setAttribute("error",
                    "Invalid phone number! Please try again.");

            request.getRequestDispatcher("/login.jsp")
                   .forward(request, response);
        }
    }
}