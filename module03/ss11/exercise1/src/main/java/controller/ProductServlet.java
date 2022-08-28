package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = {"","/product"})
public class ProductServlet extends HttpServlet {
    private static IProductService iProductService = new ProductService();
    private static List<Product> productList = new ArrayList<>();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addNewProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        Product product = iProductService.findById(id);

        RequestDispatcher requestDispatcher;
        if(product== null){
              requestDispatcher = request.getRequestDispatcher("view/error.jsp");
        }else {
            iProductService.delete(id);
            try {
                response.sendRedirect("/product");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        Product product = iProductService.findById(id);
        RequestDispatcher requestDispatcher;
        if(product == null) {
           requestDispatcher = request.getRequestDispatcher("view/error.jsp");
        }else {
            product.setId(id);
            product.setProductName(productName);
            product.setPrice(price);
            product.setDescription(description);
            product.setProducer(producer);
            request.setAttribute("product",product);
            request.setAttribute("message","Cập nhật thành công");
            requestDispatcher=request.getRequestDispatcher("view/edit.jsp");
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException |IOException e) {
            e.printStackTrace();
        }
    }
    private void addNewProduct(HttpServletRequest request, HttpServletResponse response) {
        int id =Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        Product product = new Product(id,productName,price,description,producer);
        iProductService.save(product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/add.jsp");
        request.setAttribute("message","Thêm mới sản phẩn thành công");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String action = request.getParameter("action");
      if(action==null){
          action="";
      }
      switch (action){
          case "add":
              showAddProduct(request,response);
              break;
          case "update":
              showUpdateProduct(request,response);
              break;
          case "delete":
              showDeleteProduct(request,response);
              break;
          case "display":
              viewProduct(request,response);
              break;
          case "search":
              break;
          default:
              showListProduct(request,response);
      }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) {
         int id = Integer.parseInt(request.getParameter("id"));
         Product product = iProductService.findById(id);
         RequestDispatcher requestDispatcher;
         if(product == null){
             requestDispatcher = request.getRequestDispatcher("view/error.jsp");
         }else {
             request.setAttribute("product",product);
             requestDispatcher = request.getRequestDispatcher("view/display.jsp");
         }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException |IOException e) {
            e.printStackTrace();
        }

    }

    private void showUpdateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findById(id);
        RequestDispatcher requestDispatcher;
        if(product == null){
            requestDispatcher = request.getRequestDispatcher("view/error.jsp");
        }else {
            request.setAttribute("product",product);
            requestDispatcher = request.getRequestDispatcher("view/edit.jsp");
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException |IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id =Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findById(id);
        RequestDispatcher requestDispatcher ;

        if(product == null){
            requestDispatcher = request.getRequestDispatcher("view/error.jsp");
        }else{
            request.setAttribute("product",product);
            requestDispatcher = request.getRequestDispatcher("view/delete.jsp");
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //Thê mới sản phẩm
    private void showAddProduct(HttpServletRequest request, HttpServletResponse response) {
       RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/add.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //Hiển thị danh sách sinh viên
    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> product = iProductService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        request.setAttribute("product",product);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
