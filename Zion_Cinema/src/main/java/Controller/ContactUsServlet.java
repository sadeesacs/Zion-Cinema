
package Controller;

import DAO.ContactUsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ContactInquiry;


@WebServlet(name = "ContactUsServlet", urlPatterns = {"/ContactUsServlet"})
public class ContactUsServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        ContactInquiry inquiry = new ContactInquiry(fullName, email, message);
        ContactUsDAO dao = new ContactUsDAO();
        
        if (dao.insertInquiry(inquiry)) {
            response.sendRedirect("ContactUs.jsp?success=true");
        } else {
            response.sendRedirect("ContactUs.jsp?error=true");
        }
    }
}
