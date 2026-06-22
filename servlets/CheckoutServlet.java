package com.javabite.servlets;

import com.javabite.dao.CartDAO;
import com.javabite.models.Cart;
import com.javabite.models.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private CartDAO cartDAO = new CartDAO();

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

        Cart cart = cartDAO.getCartByUserId(userId);

        if (cart == null) {
            response.sendRedirect("cart");
            return;
        }

        List<CartItem> cartItems =
                cartDAO.getCartItems(cart.getCartId());

        request.setAttribute("cart", cart);
        request.setAttribute("cartItems", cartItems);

        request.getRequestDispatcher("checkout.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        String address = request.getParameter("deliveryAddress");
        String payment = request.getParameter("paymentMethod");

        // Get cart
        CartDAO cartDAO = new CartDAO();
        Cart cart = cartDAO.getCartByUserId(userId);

        if (cart == null) {
            response.sendRedirect("cart");
            return;
        }

        double totalAmount = cart.getTotalAmount();

        // Create Order object
        com.javabite.models.Order order = new com.javabite.models.Order();
        order.setUserId(userId);
        order.setTotalAmount(totalAmount);
        order.setOrderStatus("Pending");
        order.setPaymentMethod(payment);
        order.setDeliveryAddress(address);

        // Save to DB
        com.javabite.dao.OrderDAO orderDAO = new com.javabite.dao.OrderDAO();
        int orderId = orderDAO.createOrder(order);

        System.out.println("Order saved with ID: " + orderId);

        response.sendRedirect("order-success.jsp");
    }
    }
