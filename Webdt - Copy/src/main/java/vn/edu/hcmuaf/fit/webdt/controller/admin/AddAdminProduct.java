package vn.edu.hcmuaf.fit.webdt.controller.admin;

import vn.edu.hcmuaf.fit.webdt.Service.ProductServiceWithDB;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddAdminProduct", value = "/AddAdminProduct")
public class AddAdminProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("productName");
        String description = request.getParameter("Description");
        double price = Double.parseDouble(request.getParameter("price"));
        double salePrice = Double.parseDouble(request.getParameter("salePrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        String img = request.getParameter("img");
        boolean addSuccess = ProductServiceWithDB.getInstance().addProduct(categoryID, name, description, price, salePrice, img, quantity);

        if(addSuccess){
            response.sendRedirect("/Webdt/AdminProduct");
        }
    }
}
