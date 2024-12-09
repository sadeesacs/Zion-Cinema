package model;

public class FoodMenu {
    private int FoodID;
    private String Name;
    private String Type;
    private double Price;
    private String Food_Image;

    public FoodMenu() {
    }

    public FoodMenu(int FoodID, String Name, String Type, double Price) {
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
    public double getPrice() {
        return Price;
    }
    public void setPrice(double price) {
        Price = price;
    }
    public String getFood_Image() {
        return Food_Image;
    }
    public void setFood_Image(String food_Image) {
        Food_Image = food_Image;
    }

}
