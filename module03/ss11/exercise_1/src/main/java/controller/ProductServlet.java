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
import java.util.List;

@WebServlet(name = "ProductServlet",value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action== null){
            action="";
        }
        switch (action){
            case "add":
                save(request,response);
                break;
            case "delete":
                deleteById(request,response);
                break;
            default:

        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        String description= request.getParameter("description") ;
        String producer =request.getParameter("producer");
        Product product = new Product(id,productName,price,description,producer);
       iProductService.add(product);
        request.setAttribute("mess","Them moi thanh cong");
        showFormAdd(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "add":
                showFormAdd(request,response);
                break;
            case "delete":
                showDeleteById(request,response);
                break;
            case "search":
                showListNameSearch(request,response);
                break;
            default:
                showListProduct(request,response);
        }
    }

    private void showDeleteById(HttpServletRequest request, HttpServletResponse response) {
       int id = Integer.parseInt(request.getParameter("id"));
       Product product = iProductService.searchById(id);
       RequestDispatcher requestDispatcher;
       if(product== null){
           requestDispatcher = request.getRequestDispatcher("view/error.jsp");
       }else {
           request.setAttribute("product",product);
           requestDispatcher = request.getRequestDispatcher("view/delete.jsp");
       }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListNameSearch(HttpServletRequest request, HttpServletResponse response) {
        String productName = request.getParameter("productName");
        List<Product> list = iProductService.searchByName(productName);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/list.jsp");
        request.setAttribute("productList",list);
//        try {
//            response.sendRedirect("/product");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteById(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.searchById(id);
        RequestDispatcher requestDispatcher;
        if(product== null){
            requestDispatcher=request.getRequestDispatcher("view/error.jsp");
        }else {
            iProductService.
        }
        try {
            requestDispatcher.forward(request,response);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }


    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        request.setAttribute("productList",iProductService.findByAll());
        try {
            requestDispatcher.forward(request,response);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/add.jsp");
        try {
            requestDispatcher.forward(request,response);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }

    }
}
