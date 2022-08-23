import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServlet",value = "/discount")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("a");
        double price = Double.parseDouble(request.getParameter("b"));
        double discount = Double.parseDouble(request.getParameter("c"));

        double discountAmount =price * discount * 0.01;
        double priceAfter = price -discountAmount;

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("resutl.jsp");
        request.setAttribute("product",product);
        request.setAttribute("productName",discountAmount);
        request.setAttribute("priceAfter",priceAfter);
        requestDispatcher.forward(request,response);
    }
}
