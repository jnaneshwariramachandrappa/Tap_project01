package com.javabite.servlets;

import com.javabite.dao.OrderDAO;
import com.javabite.models.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        List<Order> orders = orderDAO.getAllOrders();

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/admin/admin-orders.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");

        orderDAO.updateOrderStatus(orderId, status);

        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}