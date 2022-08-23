package vn.edu.hcmuaf.fit.webdt.controller.admin;

import vn.edu.hcmuaf.fit.webdt.Mail.MailSend;
import vn.edu.hcmuaf.fit.webdt.Service.ProductServiceWithDB;
import vn.edu.hcmuaf.fit.webdt.Service.UserServiceWithDB;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalTime;
import java.util.Locale;

@WebServlet(name = "AddAdminUser", value = "/AddAdminUser")
public class AddAdminUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        //
        String username =request.getParameter("username");
        String userAfter = username.toLowerCase(Locale.ROOT);
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String day = request.getParameter("day");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String gender = request.getParameter("gender");
        String card_number = request.getParameter("card_number");

        LocalTime time = LocalTime.now();
        int hour = time.getHour();
        int second = time.getSecond();
        int minute = time.getMinute();

        String day_birth =year+ "-" +month+ "-" +day +" 00:00:00";

        //neu dang ky thanh cong thi tro lai trang login
        if(UserServiceWithDB.getInstance().register(userAfter,password, email, day_birth,gender, card_number)){
            response.sendRedirect("/Webdt/Customer");
        }else{
            //neu khong thi gui mot attribute ten la error voi value la "username or password is incorred"
            request.setAttribute("error", "username has already token");
            request.getRequestDispatcher("user.jsp").forward(request,response);//copy du lieu tu login.jsp (html, css)
            //va co them mot div de hien dong chu "username or password is incorred"
        }
    }
}
