package com.javabite.dao;

import com.javabite.models.FoodItem;
import com.javabite.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodItemDAO {

    // Get all food items
    public List<FoodItem> getAllFoodItems() {
        String sql = "SELECT * FROM food_items WHERE availability = true";
        List<FoodItem> foodItems = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FoodItem item = new FoodItem();
                item.setFoodId(rs.getInt("food_id"));
                item.setFoodName(rs.getString("food_name"));
                item.setCategory(rs.getString("category"));
                item.setDescription(rs.getString("description"));
                item.setPrice(rs.getDouble("price"));
                item.setImagePath(rs.getString("image_path"));
                item.setAvailability(rs.getBoolean("availability"));
                foodItems.add(item);
            }
        } catch (SQLException e) {
            System.out.println("GetAllFoodItems error: " + e.getMessage());
        }
        return foodItems;
    }

    // Get food items by category
    public List<FoodItem> getFoodItemsByCategory(String category) {
        String sql = "SELECT * FROM food_items WHERE category = ? AND availability = true";
        List<FoodItem> foodItems = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FoodItem item = new FoodItem();
                item.setFoodId(rs.getInt("food_id"));
                item.setFoodName(rs.getString("food_name"));
                item.setCategory(rs.getString("category"));
                item.setDescription(rs.getString("description"));
                item.setPrice(rs.getDouble("price"));
                item.setImagePath(rs.getString("image_path"));
                item.setAvailability(rs.getBoolean("availability"));
                foodItems.add(item);
            }
        } catch (SQLException e) {
            System.out.println("GetFoodItemsByCategory error: " + e.getMessage());
        }
        return foodItems;
    }

    // Get food item by ID
    public FoodItem getFoodItemById(int foodId) {
        String sql = "SELECT * FROM food_items WHERE food_id = ?";
        FoodItem item = null;
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, foodId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                item = new FoodItem();
                item.setFoodId(rs.getInt("food_id"));
                item.setFoodName(rs.getString("food_name"));
                item.setCategory(rs.getString("category"));
                item.setDescription(rs.getString("description"));
                item.setPrice(rs.getDouble("price"));
                item.setImagePath(rs.getString("image_path"));
                item.setAvailability(rs.getBoolean("availability"));
            }
        } catch (SQLException e) {
            System.out.println("GetFoodItemById error: " + e.getMessage());
        }
        return item;
    }

    // Add food item (Admin)
    public boolean addFoodItem(FoodItem item) {
        String sql = "INSERT INTO food_items (food_name, category, description, price, image_path, availability) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, item.getFoodName());
            ps.setString(2, item.getCategory());
            ps.setString(3, item.getDescription());
            ps.setDouble(4, item.getPrice());
            ps.setString(5, item.getImagePath());
            ps.setBoolean(6, item.isAvailability());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("AddFoodItem error: " + e.getMessage());
            return false;
        }
    }

    // Update food item (Admin)
    public boolean updateFoodItem(FoodItem item) {
        String sql = "UPDATE food_items SET food_name=?, category=?, description=?, price=?, image_path=?, availability=? WHERE food_id=?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, item.getFoodName());
            ps.setString(2, item.getCategory());
            ps.setString(3, item.getDescription());
            ps.setDouble(4, item.getPrice());
            ps.setString(5, item.getImagePath());
            ps.setBoolean(6, item.isAvailability());
            ps.setInt(7, item.getFoodId());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("UpdateFoodItem error: " + e.getMessage());
            return false;
        }
    }

    // Delete food item (Admin)
    public boolean deleteFoodItem(int foodId) {
        String sql = "DELETE FROM food_items WHERE food_id = ?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, foodId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("DeleteFoodItem error: " + e.getMessage());
            return false;
        }
    }
}