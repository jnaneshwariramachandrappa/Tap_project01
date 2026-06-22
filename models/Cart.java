package com.javabite.models;

public class Cart {

    private int cartId;
    private int userId;
    private double totalAmount;

    // Default Constructor
    public Cart() {}

    // Parameterized Constructor
    public Cart(int cartId, int userId, double totalAmount) {
        this.cartId = cartId;
        this.userId = userId;
        this.totalAmount = totalAmount;
    }

    // Getters and Setters
    public int getCartId() {
        return cartId;
    }
    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
}