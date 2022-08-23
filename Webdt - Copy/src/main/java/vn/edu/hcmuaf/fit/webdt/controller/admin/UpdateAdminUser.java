package vn.edu.hcmuaf.fit.webdt.controller.admin;

import vn.edu.hcmuaf.fit.webdt.Dao.UserDao;
import vn.edu.hcmuaf.fit.webdt.Service.UserServiceWithDB;
import vn.edu.hcmuaf.fit.webdt.beans.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateAdminUser", value = "/UpdateAdminUser")
public class UpdateAdminUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = UserServiceWithDB.getInstance().getUserById(id);
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String phone_number = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String zip_code = request.getParameter("zip_code");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String password = request.getParameter("password");

        String mhPassword ="";
        if(!password.equals("")) {//neu change password(trong password có chữ )
            mhPassword = UserDao.hashPassword(password);//mã hóa password
        }else{//nếu không có change password thì nó sẽ lấy lại password cũ trong csdl để lưu lại
            mhPassword = user.getPassword();
        }
        boolean result = UserServiceWithDB.getInstance().updateUser(id,userName, email, phone_number, address,zip_code,city,state, country,mhPassword);
        User newUser =  UserServiceWithDB.getInstance().getUserById(id);//lấy user mới vừa cập nhật trong csdl
        if(result){
            response.sendRedirect("/Webdt/Customer");
        }
    }
}
