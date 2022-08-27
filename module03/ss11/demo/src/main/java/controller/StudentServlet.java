package controller;

import model.Student;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "StudentServlet",value = "/student")
public class StudentServlet extends HttpServlet {
    private IStudentService studentService = new StudentService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String action = request.getParameter("action");
      if (action==null){
          action="";
      }
      switch (action){
          case "add" :
              save(request,response);
              break;
          case "delete":
              break;
          default:
      }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean gender =Boolean.parseBoolean(request.getParameter("gender"));
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        int point =Integer.parseInt(request.getParameter("point"));
        int classId = Integer.parseInt(request.getParameter("classId"));
        String account = request.getParameter("account");
        Student student = new Student(id,name,gender,birthday,point,account,classId,email);
        studentService.add(student);
        request.setAttribute("mess","Thêm mới thành công");

        showFormAdd(request,response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String action = request.getParameter("action");
     if (action== null){
         action="";
     }
     switch (action){
         case "add":
             showFormAdd(request,response);
             break;
         case "deleted":
             break;
         default:
             showListStudent(request,request);
     }

    }

    private void showListStudent(HttpServletRequest request, HttpServletRequest response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/student/list.jsp");
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/student/add.jsp");
    }

}
