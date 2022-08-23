package vn.edu.hcmuaf.fit.webdt.controller;

import vn.edu.hcmuaf.fit.webdt.Service.ProductServiceWithDB;
import vn.edu.hcmuaf.fit.webdt.beans.Cart;
import vn.edu.hcmuaf.fit.webdt.beans.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

/**
 * LỚP NÀY LẦN ĐẦU TẠO SESSION CART VÀ THAY ĐỔI SỐ TIÊN VÀ SÔ VẬT PHẨM TRONG CÁI CART Ở PHẦN TRÊN ĐẦU MỖI TRANG
 */
@WebServlet(name = "HomePage", value = "/HomePage")
public class HomePage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart == null){
            cart = Cart.getInstance();
        }
        session.setAttribute("cart",cart);

        //lastest product
        List<Product> lastestProduct = ProductServiceWithDB.getInstance().getByLastestProduct();
//        request.setAttribute("lastestProduct" ,lastestProduct);

        session.setAttribute("lastestProduct" ,lastestProduct);

        //product top seller
        List<Product> topSeller = ProductServiceWithDB.getInstance().getByTopSeller();
        request.setAttribute("topSeller" ,topSeller);

        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
