package vn.edu.hcmuaf.fit.webdt.controller.admin;

import vn.edu.hcmuaf.fit.webdt.Service.ProductServiceWithDB;
import vn.edu.hcmuaf.fit.webdt.beans.Cart;
import vn.edu.hcmuaf.fit.webdt.beans.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteAdminProduct", value = "/DeleteAdminProduct")
public class DeleteAdminProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        //load cart from session
        List<Product> listProduct = (List<Product>) session.getAttribute("AdminProduct");
//        if(cart.get(id) == null) {//neu khong co san pham trong Map cart
//            response.setStatus(404);
//            return;
//        }
        for(Product p: listProduct){
            if(p.getId() == id){
                listProduct.remove(p);
                boolean deleteComplete = ProductServiceWithDB.getInstance().deleteProduct(id);
            }
        }

//        session.setAttribute("AdminProduct",listProduct);
//        request.getRequestDispatcher("cart.jsp").forward(request,response);
    }
}
