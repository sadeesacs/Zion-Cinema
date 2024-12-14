package model;

public class FoodItem {
    private int foodId;
    private String name;
    private String foodImage;
    private String type;
    private double price;

    public FoodItem(int foodId, String name, String foodImage, String type, double price) {
        this.foodId = foodId;
        this.name = name;
        this.foodImage = foodImage;
        this.type = type;
        this.price = price;
    }
    
    public int getFoodId() {return foodId;}
    public String getName() {return name;}
    public String getFoodImage() {return foodImage;}
    public String getType() {return type;}
    public double getPrice() {return price;}
}