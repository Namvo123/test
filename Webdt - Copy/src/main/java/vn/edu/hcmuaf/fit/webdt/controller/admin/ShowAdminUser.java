package vn.edu.hcmuaf.fit.webdt.controller.admin;

import vn.edu.hcmuaf.fit.webdt.Service.ProductServiceWithDB;
import vn.edu.hcmuaf.fit.webdt.Service.UserServiceWithDB;
import vn.edu.hcmuaf.fit.webdt.beans.Product;
import vn.edu.hcmuaf.fit.webdt.beans.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ShowAdminUser", value = "/ShowAdminUser")
public class ShowAdminUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        User user = UserServiceWithDB.getInstance().getUserById(id);

        request.setAttribute("user", user);

        request.getRequestDispatcher("AccountDetail.jsp").forward(request, response);
    }
}
