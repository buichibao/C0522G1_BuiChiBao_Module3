import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "StudentServlet",urlPatterns = "/student")
public class StudentServlet extends javax.servlet.http.HttpServlet {
    private static List<Student> studentList = new ArrayList<>();

    static {
        studentList.add(new Student(1,"Bùi Chí Bảo",true,"22-02-2001",7,"bcbao",1,"bao@2202"));
        studentList.add(new Student(2,"Nguyễn Duy Quyết",true,"15-11-1996",7,"ndquyet",1,"quyet@2202"));
        studentList.add(new Student(3,"Huỳnh Văn Nam",true,"15-11-1993",7,"hvnam",1,"nam@2202"));
        studentList.add(new Student(4,"Phạm Đạt",true,"15-08-1993",7,"pdat",1,"dat@2202"));
    }
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        request.setAttribute("studentList",studentList);
        requestDispatcher.forward(request,response);
    }
}
