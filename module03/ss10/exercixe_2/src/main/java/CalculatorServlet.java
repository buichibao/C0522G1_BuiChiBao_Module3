import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet",value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("firstOperand"));
        float secondOperand = Float.parseFloat(request.getParameter("secondOperand"));
        char opera = request.getParameter("opera").charAt(0);
        String result = null;
        switch (opera){
            case '+':
                 result = String.valueOf(firstOperand + secondOperand);
                break;
            case '-':
                result = String.valueOf(firstOperand - secondOperand);
                break;
            case '*':
                result = String.valueOf(firstOperand * secondOperand);
                break;
            case '/':
                result = String.valueOf(firstOperand / secondOperand);
                break;   
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display/display.jsp");
        request.setAttribute("result",result);
        requestDispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
