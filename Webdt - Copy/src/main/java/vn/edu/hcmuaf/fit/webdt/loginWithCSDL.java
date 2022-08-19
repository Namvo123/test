package vn.edu.hcmuaf.fit.webdt;

import vn.edu.hcmuaf.fit.webdt.Mail.MailSend;
import vn.edu.hcmuaf.fit.webdt.Service.UserServiceWithDB;
import vn.edu.hcmuaf.fit.webdt.beans.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Locale;
import javax.mail.*;

//ĐÂY LÀ MỘT SERVLET ĐĂNG NHẬP VỚI DỮ LIỆU TỪ DATABASE
//DAY LA MOT SERVLET CHU KHONG PHAI MOT LOP JAVA BINH THUONG

@WebServlet(name = "loginWithCSDL", value = "/loginWithCSDL")
public class loginWithCSDL extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = (request.getParameter("username")).toLowerCase(Locale.ROOT);
        String password = request.getParameter("password");


//        chuyển qua chữ việt thì sẽ bị lỗi (vẫn chưa biết cách sửa) ==> dùng tiếng anh cho khỏe
//        String subject ="Xác nhận đăng ký tài khoảng!";
//        String textMessage = "Tin nhắn này để xác nhận khách hàng vừa đăng ký tài khoản trên shop của chúng tôi";
//
//        MailSend.getInstance().sendMail(userName, subject, textMessage);

        User user =UserServiceWithDB.getInstance().checkLogin(userName,password);
        if(user != null){
            //set(gui) session user
            HttpSession session = request.getSession();
            session.setAttribute("auth", user);

            if(user.getId() != 1) {
                //check neu co username va password trong db thi chuyen den trang index.jsp
                response.sendRedirect("/Webdt/HomePage");
            }else{
                response.sendRedirect("/Webdt/AdminProduct");
            }
//            response.sendRedirect("index2.jsp");

        }else{
            //neu khong thi gui mot attribute ten la error voi value la "username or password is incorred"
            request.setAttribute("error", "username or password is incorred");
            request.getRequestDispatcher("login.jsp").forward(request, response);//copy du lieu tu login.jsp (html, css)
            //va co them mot div de hien dong chu "username or password is incorred"
        }
    }
}
