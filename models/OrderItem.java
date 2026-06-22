package com.javabite.models;

public class OrderItem {

    private int orderItemId;
    private int orderId;
    private int foodId;
    private int quantity;
    private double price;
    private double subtotal;

    // Default Constructor
    public OrderItem() {}

    // Parameterized Constructor
    public OrderItem(int orderItemId, int orderId, int foodId,
                     int quantity, double price, double subtotal) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.foodId = foodId;
        this.quantity = quantity;
        this.price = price;
        this.subtotal = subtotal;
    }

    // Getters and Setters
    public int getOrderItemId() {
        return orderItemId;
    }
    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getOrderId() {
        return orderId;
    }
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getFoodId() {
        return foodId;
    }
    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }

    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    public double getSubtotal() {
        return subtotal;
    }
    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
}