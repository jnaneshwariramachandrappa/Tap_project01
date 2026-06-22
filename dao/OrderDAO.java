package com.javabite.dao;

import com.javabite.models.Order;
import com.javabite.utils.DBConnection;

import java.sql.*;
import java.util.*;

public class OrderDAO {

    // =========================
    // GET ORDERS BY USER
    // =========================
    public List<Order> getOrdersByUser(int userId) {

        List<Order> list = new ArrayList<>();

        String sql = "SELECT * FROM orders WHERE user_id=? ORDER BY order_id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setOrderStatus(rs.getString("order_status"));
                o.setPaymentMethod(rs.getString("payment_method"));
                o.setDeliveryAddress(rs.getString("delivery_address"));

                list.add(o);
            }

        } catch (Exception e) {
            System.out.println("OrderDAO error (getOrdersByUser): " + e.getMessage());
        }

        return list;
    }

    // =========================
    // GET ALL ORDERS (ADMIN)
    // =========================
    public List<Order> getAllOrders() {

        List<Order> list = new ArrayList<>();

        String sql = "SELECT * FROM orders ORDER BY order_id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setOrderStatus(rs.getString("order_status"));
                o.setPaymentMethod(rs.getString("payment_method"));
                o.setDeliveryAddress(rs.getString("delivery_address"));

                list.add(o);
            }

        } catch (Exception e) {
            System.out.println("OrderDAO error (getAllOrders): " + e.getMessage());
        }

        return list;
    }

    // =========================
    // GET ORDER BY ID
    // =========================
    public Order getOrderById(int orderId) {

        Order o = null;

        String sql = "SELECT * FROM orders WHERE order_id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setOrderStatus(rs.getString("order_status"));
                o.setPaymentMethod(rs.getString("payment_method"));
                o.setDeliveryAddress(rs.getString("delivery_address"));
            }

        } catch (Exception e) {
            System.out.println("OrderDAO error (getOrderById): " + e.getMessage());
        }

        return o;
    }

    // =========================
    // UPDATE ORDER STATUS
    // =========================
    public boolean updateOrderStatus(int orderId, String status) {

        String sql = "UPDATE orders SET order_status=? WHERE order_id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, orderId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("OrderDAO error (updateOrderStatus): " + e.getMessage());
            return false;
        }
    }

    // =========================
    // CREATE ORDER (IMPORTANT)
    // =========================
    public int createOrder(Order o) {

        int id = 0;

        String sql = "INSERT INTO orders (user_id, total_amount, order_status, payment_method, delivery_address) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, o.getUserId());
            ps.setDouble(2, o.getTotalAmount());
            ps.setString(3, o.getOrderStatus());
            ps.setString(4, o.getPaymentMethod());
            ps.setString(5, o.getDeliveryAddress());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println("OrderDAO error (createOrder): " + e.getMessage());
        }

        return id;
    }
}