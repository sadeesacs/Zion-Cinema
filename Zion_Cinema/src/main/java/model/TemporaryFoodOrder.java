package model;

/**
 *
 * @author sadee
 */
public class TemporaryFoodOrder {
    private int tempFoodOrderId;
    private int showtimeId;
    private int foodId;
    private int userId;
    private int quantity;
    private double price;

    // Constructor
    public TemporaryFoodOrder(int tempFoodOrderId, int showtimeId, int foodId, int userId, int quantity, double price) {
        this.tempFoodOrderId = tempFoodOrderId;
        this.showtimeId = showtimeId;
        this.foodId = foodId;
        this.userId = userId;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters and setters
    public int getTempFoodOrderId() {
        return tempFoodOrderId;
    }

    public void setTempFoodOrderId(int tempFoodOrderId) {
        this.tempFoodOrderId = tempFoodOrderId;
    }

    public int getShowtimeId() {
        return showtimeId;
    }

    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public int getFoodId() {
        return foodId;
    }

    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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
}
