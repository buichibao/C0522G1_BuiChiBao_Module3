package sevlet;

import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Bùi Chí Bảo","2001-02-22","Hà Tĩnh","https://giupban.com.vn/wp-content/uploads/hinh-anh-con-khi-7-640x418-1.jpg"));
        customerList.add(new Customer("Nguyễn Duy Quyết","1996-11-11","Nghệ An","https://phongkhammayo.vn/hinh-con-khi-cuoi/imager_3_66623_700.jpg"));
        customerList.add(new Customer("Huỳnh Văn Nam","1993-15-11","Quảng Nam","https://anhdepfree.com/wp-content/uploads/2020/09/hinh-anh-khi-dot-chup-anh-selfie.jpg"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/list.jsp");
        request.setAttribute("customerList",customerList);
        requestDispatcher.forward(request,response);
    }
}
