package model;

public class User {
    private int userId;
    private String email;
    private String phoneNumber;
    private String firstName;
    private String lastName;
    private boolean isGuest;

    public User(int userId, String email, String phoneNumber, String firstName, String lastName, boolean isGuest) {
        this.userId = userId;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.firstName = firstName;
        this.lastName = lastName;
        this.isGuest = isGuest;
    }

    public int getUserId() { return userId; }
    public String getEmail() { return email; }
    public String getPhoneNumber() { return phoneNumber; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public boolean isGuest() { return isGuest; }
}
