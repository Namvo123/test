package vn.edu.hcmuaf.fit.webdt.controller.admin;

import vn.edu.hcmuaf.fit.webdt.Service.ProductServiceWithDB;
import vn.edu.hcmuaf.fit.webdt.beans.Cart;
import vn.edu.hcmuaf.fit.webdt.beans.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProduct", value = "/AdminProduct")
public class AdminProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get cart from session
        HttpSession session = request.getSession();
//        Cart cart = (Cart) session.getAttribute("cart");
//
//        if (cart == null) {
//            cart = Cart.getInstance();
//        }
        List<Product> listProduct = ProductServiceWithDB.getInstance().getAll();
        session.setAttribute("AdminProduct", listProduct);//add cart vao session
//        request.setAttribute("cart", cart);
        request.getRequestDispatcher("list_account_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
