package model;

public class FoodMenu {
    private int FoodID;
    private String Name;
    private String Type;
    private float Price;

    public FoodMenu() {
    }

    public FoodMenu(int FoodID, String Name, String Type, float Price) {
        this.FoodID = FoodID;
        this.Name = Name;
        this.Type = Type;
        this.Price = Price;
    }
    public int getFoodID() {
        return FoodID;
    }
    public void setFoodID(int FoodID) {
        this.FoodID = FoodID;
    }
    public String getName() {
        return Name;
    }
    public void setName(String name) {
        Name = name;
    }
    public String getType() {
        return Type;
    }
    public void setType(String type) {
        Type = type;
    }
    public float getPrice() {
        return Price;
    }
    public void setPrice(float price) {
        Price = price;
    }
}
