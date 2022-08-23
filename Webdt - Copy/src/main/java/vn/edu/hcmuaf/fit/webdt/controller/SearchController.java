package vn.edu.hcmuaf.fit.webdt.controller;

import vn.edu.hcmuaf.fit.webdt.Service.ProductServiceWithDB;
import vn.edu.hcmuaf.fit.webdt.beans.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

/**
 * day la lop servlet cua search khi bam vao nut search
 */
@WebServlet(name = "SearchController", value = "/SearchController")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);                      //khi nhấn nút qua trang khác thì nó sẽ thực hiện ở đây
    }

    //khi nhấn nút Search thì nó sẽ thực hiện ở đây (nó sẽ gửi dữ liệu ở trong form đến đây)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String show = "Can't not find your search!";                    //nếu không tìm thấy được sản phẩm nào thì nó sẽ hiện cái này ra
        int page;                                                       //trang hiện tại(nếu mới đầu thì auto page =1)

        String searchName = request.getParameter("searchName");
        String pageString = request.getParameter("page");
        try {                                                     //vì lúc đầu không có số page đươc gửi qua nên phải dùng try catch
            page = Integer.parseInt(pageString);                   //trang vừa được nhấn
        } catch (NumberFormatException e) {
            page = 1;                                             //nếu mới đầu thì auto page =1
        }

        //lấy ra danh sách tổng số sản phẩm có ten searchName để lấy total vì = productList.size()
        List<Product> productList = ProductServiceWithDB.getInstance().getAll(searchName);

        int total = productList.size();             //tong so san pham
        int pageSize = 12;                            //so san pham trong mot trang
        int endPage = total / pageSize;             //tong so trang
        if (total % pageSize != 0) {                //neu ma total % pageSize != 0(tuc neu co 7 san pham(so le) thi khong chia duoc)
            endPage++;                              //cong tong so trang len mot
        }
        request.setAttribute("endPage", endPage);
        request.setAttribute("searchName", searchName);
        request.setAttribute("pageIsSelected", page); //gửi qua bên search.jsp page được chọn để đổi màu

        //
        //lấy danh sách từ page hiện tại , số sản phẩm trong 1 page và tên sản phẩm cần tìm đó
        List<Product> productListWithPage = ProductServiceWithDB.getInstance().getProductSearchWithPage(page, pageSize, searchName);
        request.setAttribute("productSearch", productListWithPage);
        if (productList.size() != 0) {                      //tuc la tim duoc sản phẩm có tên searchName đó=> đổi show lại
            show = "Search results for: '" + searchName + "'";
        }
        request.setAttribute("show", show);

        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}
