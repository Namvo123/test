package vn.edu.hcmuaf.fit.webdt.controller.admin;

import vn.edu.hcmuaf.fit.webdt.Service.ProductServiceWithDB;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateAdminProduct", value = "/UpdateAdminProduct")
public class UpdateAdminProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("productName");
        String description = request.getParameter("Description");
        double price = Double.parseDouble(request.getParameter("price"));
        double salePrice = Double.parseDouble(request.getParameter("salePrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        String img = request.getParameter("img");

        boolean isFinish = ProductServiceWithDB.getInstance().updateProduct(id, name, description, price, salePrice, quantity, categoryID, img);

        if(isFinish){
            response.sendRedirect("/Webdt/AdminProduct");
        }
    }
}
