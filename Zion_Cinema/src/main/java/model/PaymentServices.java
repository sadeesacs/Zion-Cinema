package model;
 
import java.util.*;
 
import com.paypal.api.payments.*;
import com.paypal.base.rest.*;
 
public class PaymentServices {
    private static final String CLIENT_ID = "AZfjP-xX90st2qVDg7hqLpq9_hOyTwgXpNlF85tXbQI6Vo2qcv-3G31r42jyrBeQj6boArpxyQ_nSiYS";
    private static final String CLIENT_SECRET = "EBd51HwZtFVsfZDESWzUhRwxVJKyXkHqT9aCOEIKT-cFN1ONLc1UEbtz1o24V4pD1js-FafSzOJxEcgN";
    private static final String MODE = "sandbox";
 
    public String authorizePayment(OrderDetail orderDetail)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
        Payment approvedPayment = requestPayment.create(apiContext);
 
        return getApprovalLink(approvedPayment);
 
    }
     
    private Payer getPayerInformation() {
        
        Payer payer = new Payer();
    payer.setPaymentMethod("paypal");
     
    PayerInfo payerInfo = new PayerInfo();
    payerInfo.setFirstName("senuri")
             .setLastName("Perera")
             .setEmail("senuriperera@gmail.com");
     
    payer.setPayerInfo(payerInfo);
     
    return payer;
        
        
    }
     
    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
    redirectUrls.setCancelUrl("http://localhost:8080/Zion_Cinema/cancel.html");
    redirectUrls.setReturnUrl("http://localhost:8080/Zion_Cinema/review_payment");
     
    return redirectUrls;
    }
    
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
    return Payment.get(apiContext, paymentId);
    }
    
    public Payment executePayment(String paymentId, String payerId)
        throws PayPalRESTException {
    PaymentExecution paymentExecution = new PaymentExecution();
    paymentExecution.setPayerId(payerId);
 
    Payment payment = new Payment().setId(paymentId);
 
    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
    return payment.execute(apiContext, paymentExecution);
    }
     
    private List<Transaction> getTransactionInformation(OrderDetail orderDetail) {
    double subtotal = orderDetail.getTotalFoodPrice() + orderDetail.getTotalTicketPrice();
    double vat = subtotal * 0.03;
    double total = subtotal + vat + orderDetail.getTax();

    Details details = new Details();
    details.setShipping(String.format("%.2f", vat)); // Use VAT as "shipping"
    details.setSubtotal(String.format("%.2f", subtotal));
    details.setTax(String.format("%.2f", orderDetail.getTax()));

    Amount amount = new Amount();
    amount.setCurrency("USD");
    amount.setTotal(String.format("%.2f", total)); // Total amount (subtotal + tax + VAT)
    amount.setDetails(details);

    Transaction transaction = new Transaction();
    transaction.setAmount(amount);
    transaction.setDescription(orderDetail.getMovieName());

    ItemList itemList = new ItemList();
    List<Item> items = new ArrayList<>();

    if (orderDetail.getTotalFoodPrice() > 0) {
        Item foodItem = new Item();
        foodItem.setCurrency("USD");
        foodItem.setName("Food Items");
        foodItem.setPrice(String.format("%.2f", orderDetail.getTotalFoodPrice()));
        foodItem.setTax("0.00");
        foodItem.setQuantity("1");
        items.add(foodItem);
    }

    if (orderDetail.getTotalTicketPrice() > 0) {
        Item ticketItem = new Item();
        ticketItem.setCurrency("USD");
        ticketItem.setName("Tickets for: " + orderDetail.getMovieName()); // Include movie name
        ticketItem.setPrice(String.format("%.2f", orderDetail.getTotalTicketPrice()));
        ticketItem.setTax("0.00");
        ticketItem.setQuantity("1");
        items.add(ticketItem);
    }

    itemList.setItems(items);
    transaction.setItemList(itemList);

    List<Transaction> listTransaction = new ArrayList<>();
    listTransaction.add(transaction);

    return listTransaction;
}


     
    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
    String approvalLink = null;
     
    for (Links link : links) {
        if (link.getRel().equalsIgnoreCase("approval_url")) {
            approvalLink = link.getHref();
            break;
        }
    }      
     
    return approvalLink;
    }

}
