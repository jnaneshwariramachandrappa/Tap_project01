package com.javabite.dao;

import com.javabite.models.Cart;
import com.javabite.models.CartItem;
import com.javabite.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    // Create cart for user
    public int createCart(int userId) {
        String sql = "INSERT INTO cart (user_id, total_amount) VALUES (?, 0.00)";
        int cartId = -1;
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql, 
                PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, userId);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                cartId = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("CreateCart error: " + e.getMessage());
        }
        return cartId;
    }

    // Get cart by user ID
    public Cart getCartByUserId(int userId) {
        String sql = "SELECT * FROM cart WHERE user_id = ?";
        Cart cart = null;
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cart = new Cart();
                cart.setCartId(rs.getInt("cart_id"));
                cart.setUserId(rs.getInt("user_id"));
                cart.setTotalAmount(rs.getDouble("total_amount"));
            }
        } catch (SQLException e) {
            System.out.println("GetCart error: " + e.getMessage());
        }
        return cart;
    }

    // Add item to cart
    public boolean addItemToCart(CartItem cartItem) {
        String sql = "INSERT INTO cart_items (cart_id, food_id, quantity, subtotal) VALUES (?, ?, ?, ?)";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cartItem.getCartId());
            ps.setInt(2, cartItem.getFoodId());
            ps.setInt(3, cartItem.getQuantity());
            ps.setDouble(4, cartItem.getSubtotal());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("AddItemToCart error: " + e.getMessage());
            return false;
        }
    }

    // Get all cart items by cart ID
    public List<CartItem> getCartItems(int cartId) {
        String sql = "SELECT * FROM cart_items WHERE cart_id = ?";
        List<CartItem> cartItems = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cartId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartItem item = new CartItem();
                item.setCartItemId(rs.getInt("cart_item_id"));
                item.setCartId(rs.getInt("cart_id"));
                item.setFoodId(rs.getInt("food_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setSubtotal(rs.getDouble("subtotal"));
                cartItems.add(item);
            }
        } catch (SQLException e) {
            System.out.println("GetCartItems error: " + e.getMessage());
        }
        return cartItems;
    }

    // Update cart item quantity
    public boolean updateCartItem(int cartItemId, int quantity, double subtotal) {
        String sql = "UPDATE cart_items SET quantity = ?, subtotal = ? WHERE cart_item_id = ?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setDouble(2, subtotal);
            ps.setInt(3, cartItemId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("UpdateCartItem error: " + e.getMessage());
            return false;
        }
    }

    // Remove item from cart
    public boolean removeCartItem(int cartItemId) {
        String sql = "DELETE FROM cart_items WHERE cart_item_id = ?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cartItemId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("RemoveCartItem error: " + e.getMessage());
            return false;
        }
    }

    // Update cart total amount
    public boolean updateCartTotal(int cartId, double totalAmount) {
        String sql = "UPDATE cart SET total_amount = ? WHERE cart_id = ?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDouble(1, totalAmount);
            ps.setInt(2, cartId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("UpdateCartTotal error: " + e.getMessage());
            return false;
        }
    }

    // Clear cart after order placed
    public boolean clearCart(int cartId) {
        String sql = "DELETE FROM cart_items WHERE cart_id = ?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cartId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("ClearCart error: " + e.getMessage());
            return false;
        }
    }
}