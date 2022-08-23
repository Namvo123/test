package vn.edu.hcmuaf.fit.webdt.controller;

import vn.edu.hcmuaf.fit.webdt.Service.ProductServiceWithDB;
import vn.edu.hcmuaf.fit.webdt.beans.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Others", value = "/Others")
public class Others extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //lay list product co id = 5(tuc other)
//        List<Product> productList = ProductServiceWithDB.getInstance().getProductListByIdCategory(5);
//        request.setAttribute("productList",productList);

        int id_category = Integer.parseInt(request.getParameter("id"));//nhan id tu link other

//        //lay ten category bang id_category
//        String nameCategory = ProductServiceWithDB.getInstance().getNameCategoryByID(id_category);
//        request.setAttribute("categoryName",nameCategory);


        int page; //trang hiện tại(nếu mới đầu thì auto page =1)

        String pageString = request.getParameter("page");
        try {                                                     //vì lúc đầu không có số page đươc gửi qua nên phải dùng try catch
            page = Integer.parseInt(pageString);                   //trang vừa được nhấn
        } catch (NumberFormatException e) {
            page = 1;                                             //nếu mới đầu thì auto page =1
        }

        //lấy ra danh sách tổng số sản phẩm có id bang id_category để lấy total vì = productList.size()
        List<Product> productList = ProductServiceWithDB.getInstance().getProductListByIdCategory(id_category);

        int total = productList.size();             //tong so san pham
        int pageSize = 12;                            //so san pham trong mot trang
        int endPage = total / pageSize;             //tong so trang
        if (total % pageSize != 0) {                  //neu ma total % pageSize != 0(tuc neu co 7 san pham(so le) thi khong chia duoc)
            endPage++;                              //cong tong so trang len mot
        }
        request.setAttribute("endPage", endPage);
        request.setAttribute("id", id_category);
        request.setAttribute("pageIsSelected", page); //gửi qua bên search.jsp page được chọn để đổi màu

        //
        //lấy danh sách từ page hiện tại , số sản phẩm trong 1 page và tên sản phẩm cần tìm đó
        List<Product> productListWithPage = ProductServiceWithDB.getInstance().getProductWithPage(page, pageSize, id_category);
        request.setAttribute("productList", productListWithPage);


        request.getRequestDispatcher("others.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
