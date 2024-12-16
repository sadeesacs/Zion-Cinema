package model;

public class FoodItem {
    private int foodId;
    private String name;
    private String foodImage;
    private String type;
    private double price;

    public FoodItem() {}

    public FoodItem(int foodId, String name, String foodImage, String type, double price) {
        this.foodId = foodId;
        this.name = name;
        this.foodImage = foodImage;
        this.type = type;
        this.price = price;
    }

    public int getFoodId() { return foodId; }
    public void setFoodId(int foodId) { this.foodId = foodId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getFoodImage() { return foodImage; }
    public void setFoodImage(String foodImage) { this.foodImage = foodImage; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
