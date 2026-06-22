package com.javabite.servlets;

import com.javabite.dao.OrderDAO;
import com.javabite.models.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        Integer orderId = (Integer) session.getAttribute("orderId");

        // ================= SUCCESS PAGE =================
        if (orderId != null) {

            Order order = orderDAO.getOrderById(orderId);

            request.setAttribute("order", order);

            session.removeAttribute("orderId");

            request.getRequestDispatcher("order-success.jsp")
                   .forward(request, response);

        }
        // ================= ORDER LIST =================
        else {

            List<Order> orders = orderDAO.getOrdersByUser(userId);

            request.setAttribute("orders", orders);

            request.getRequestDispatcher("my-orders.jsp")
                   .forward(request, response);
        }
    }
}