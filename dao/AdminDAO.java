package com.javabite.dao;

import com.javabite.utils.DBConnection;

import java.sql.*;

public class AdminDAO {

    public boolean validateAdmin(String phone, String password) {

        boolean status = false;

        String sql = "SELECT * FROM admin WHERE phone=? AND password=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, phone);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = true;
            }

        } catch (Exception e) {
            System.out.println("Admin login error: " + e.getMessage());
        }

        return status;
    }
}