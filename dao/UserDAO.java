package com.javabite.dao;

import com.javabite.models.User;
import com.javabite.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    // Register new user
    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (full_name, phone, address) VALUES (?, ?, ?)";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getAddress());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("Register error: " + e.getMessage());
            return false;
        }
    }

    // Login user by phone
    public User loginUser(String phone) {
        String sql = "SELECT * FROM users WHERE phone = ?";
        User user = null;
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            System.out.println("Login error: " + e.getMessage());
        }
        return user;
    }

    // Get user by ID
    public User getUserById(int userId) {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        User user = null;
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            System.out.println("GetUser error: " + e.getMessage());
        }
        return user;
    }
}