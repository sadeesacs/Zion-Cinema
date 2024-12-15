package model;

public class CustomerInquiries {
    private int InquiryID;
    private String Name;
    private String Email;
    private String Message;


    public CustomerInquiries() {

    }

    public CustomerInquiries(int InquiryID, String Name, String Email, String Message) {
        this.InquiryID = InquiryID;
        this.Name = Name;
        this.Email = Email;
        this.Message = Message;
    }
    public int getInquiryID() {
        return InquiryID;
    }
    public void setInquiryID(int InquiryID) {
        this.InquiryID = InquiryID;
    }
    public String getName() {
        return Name;
    }
    public void setName(String name) {
        this.Name = name;
    }
    public String getEmail() {
        return Email;
    }
    public void setEmail(String Email) {
        this.Email = Email;
    }
    public String getMessage() {
        return Message;
    }
    public void setMessage(String Message) {
        this.Message = Message;
    }
}
