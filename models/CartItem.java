package com.javabite.models;

public class CartItem {

    private int cartItemId;
    private int cartId;
    private int foodId;
    private int quantity;
    private double subtotal;

    // Default Constructor
    public CartItem() {}

    // Parameterized Constructor
    public CartItem(int cartItemId, int cartId, int foodId, 
                    int quantity, double subtotal) {
        this.cartItemId = cartItemId;
        this.cartId = cartId;
        this.foodId = foodId;
        this.quantity = quantity;
        this.subtotal = subtotal;
    }

    // Getters and Setters
    public int getCartItemId() {
        return cartItemId;
    }
    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public int getCartId() {
        return cartId;
    }
    public void setCartId(int cartId) {
        this.cartId = cartId;
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

    public double getSubtotal() {
        return subtotal;
    }
    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
}