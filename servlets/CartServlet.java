package com.javabite.servlets;

import com.javabite.dao.CartDAO;
import com.javabite.dao.FoodItemDAO;
import com.javabite.models.Cart;
import com.javabite.models.CartItem;
import com.javabite.models.FoodItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/cart")   // 🔥 THIS FIXES YOUR 404 ERROR
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartDAO cartDAO = new CartDAO();
    private FoodItemDAO foodItemDAO = new FoodItemDAO();

    // ================= SHOW CART =================
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        Cart cart = cartDAO.getCartByUserId(userId);

        if (cart == null) {
            int cartId = cartDAO.createCart(userId);

            cart = new Cart();
            cart.setCartId(cartId);
            cart.setUserId(userId);
            cart.setTotalAmount(0.0);
        }

        List<CartItem> cartItems =
                cartDAO.getCartItems(cart.getCartId());

        request.setAttribute("cart", cart);
        request.setAttribute("cartItems", cartItems);

        request.getRequestDispatcher("/cart.jsp")
               .forward(request, response);
    }

    // ================= CART ACTIONS =================
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        Cart cart = cartDAO.getCartByUserId(userId);

        if (cart == null) {
            int cartId = cartDAO.createCart(userId);

            cart = new Cart();
            cart.setCartId(cartId);
            cart.setUserId(userId);
            cart.setTotalAmount(0.0);
        }

        // ================= ADD ITEM =================
        if ("add".equals(action)) {

            int foodId = Integer.parseInt(request.getParameter("foodId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            FoodItem foodItem = foodItemDAO.getFoodItemById(foodId);

            if (foodItem == null) {
                response.sendRedirect(request.getContextPath() + "/menu");
                return;
            }

            double subtotal = foodItem.getPrice() * quantity;

            CartItem item = new CartItem();
            item.setCartId(cart.getCartId());
            item.setFoodId(foodId);
            item.setQuantity(quantity);
            item.setSubtotal(subtotal);

            cartDAO.addItemToCart(item);

            cart.setTotalAmount(cart.getTotalAmount() + subtotal);
            cartDAO.updateCartTotal(cart.getCartId(), cart.getTotalAmount());
        }

        // ================= REMOVE ITEM =================
        else if ("remove".equals(action)) {

            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));

            List<CartItem> items =
                    cartDAO.getCartItems(cart.getCartId());

            for (CartItem item : items) {

                if (item.getCartItemId() == cartItemId) {

                    double newTotal =
                            cart.getTotalAmount() - item.getSubtotal();

                    cart.setTotalAmount(newTotal);
                    cartDAO.updateCartTotal(cart.getCartId(), newTotal);

                    break;
                }
            }

            cartDAO.removeCartItem(cartItemId);
        }

        // ================= UPDATE ITEM =================
        else if ("update".equals(action)) {

            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
            int foodId = Integer.parseInt(request.getParameter("foodId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            FoodItem foodItem = foodItemDAO.getFoodItemById(foodId);

            if (foodItem == null) {
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }

            double newSubtotal = foodItem.getPrice() * quantity;

            List<CartItem> items =
                    cartDAO.getCartItems(cart.getCartId());

            for (CartItem item : items) {

                if (item.getCartItemId() == cartItemId) {

                    double newTotal =
                            cart.getTotalAmount()
                            - item.getSubtotal()
                            + newSubtotal;

                    cart.setTotalAmount(newTotal);
                    cartDAO.updateCartTotal(cart.getCartId(), newTotal);

                    break;
                }
            }

            cartDAO.updateCartItem(cartItemId, quantity, newSubtotal);
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }
}