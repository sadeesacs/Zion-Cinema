package model;

public class FoodOrder {
    private String foodName;
    private int quantity;

    // Constructor
    public FoodOrder(String foodName, int quantity) {
        this.foodName = foodName;
        this.quantity = quantity;
    }

    // Getters and Setters
    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
