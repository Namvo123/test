package vn.edu.hcmuaf.fit.webdt.controller;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.hcmuaf.fit.webdt.Service.ProductServiceWithDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "UploadDownLoadFileServlet", value = "/UploadDownLoadFileServlet")
public class UploadDownLoadFileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ServletFileUpload uploader =null;
    private String productPath ="/products";
    private int num = 1;

    //kiem tra va thiet lap cac folder upload cac file
    @Override
    public void init() throws ServletException{
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File fileDir = (File) getServletContext().getAttribute("FILES_DIR_FILE"); //lấy value từ key FILES_DIR_FILE ở lớp FileLocationContextListener(trong listener)
        fileFactory.setRepository(fileDir);
        this.uploader = new ServletFileUpload(fileFactory);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    //những nội dung được gửi lên từ form sẽ nằm trong request
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(!ServletFileUpload.isMultipartContent(request)){
            throw new ServletException("Content type is not multipart/form-data");
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.write("<html><head></head><body>");

        //chỗ này là upload file
        try{

            List<FileItem> fileItemList =uploader.parseRequest(request);    //chỗ này dùng vì có thể là gửi nhiều file chứ không phải một file
            for (FileItem fileItem : fileItemList) {
                //in ra thông tin của file
                System.out.println("FieldName=" + fileItem.getFieldName());
                System.out.println("FileName=" + fileItem.getName());
                System.out.println("ContentType=" + fileItem.getContentType());
                System.out.println("Size in bytes=" + fileItem.getSize());

//                String name = request.getParameter("productName");
//                String description =request.getParameter("Description");
//                double price = Double.parseDouble(request.getParameter("price")) ;
//                double salePrice = Double.parseDouble(request.getParameter("salePrice"));
//                int quantity = Integer.parseInt(request.getParameter("quantity"));
//                int categoryID = Integer.parseInt(request.getParameter("categoryID"));
//                String img = "img/"+ fileItem.getName();

                //lấy value từ key FILES_DIR ở lớp FileLocationContextListener(trong listener)
//                File productDir = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator + productPath);
//
//                //đường link hiện tại(cộng thêm productPath):tomcat\\webapps\\Webdt - Copy\\manage\\upload\\products
//
//                if(!productDir.exists()) productDir.mkdirs();  //nếu không tồn tại thì tạo thêm
//
//                File file = new File(productDir.getAbsolutePath()+ File.separator + fileItem.getName());//tạo nơi chứa cho nội dung cái file
//                if(file.exists()) { //nêu có tên file này rồi thì thêm số vào tên file
//                    file = new File(productDir.getAbsolutePath()+ File.separator + fileItem.getName() +"("+num+")");
//                    num ++;
//                }

                File file = new File(request.getServletContext().getAttribute("FILES_DIR")+ File.separator + fileItem.getName());//tạo nơi chứa cho nội dung cái file
                if(file.exists()) { //nêu có tên file này rồi thì thêm số vào tên file
                    file = new File(request.getServletContext().getAttribute("FILES_DIR")+ File.separator + fileItem.getName() +"("+num+")");
                    num ++;
                }
                System.out.println("Absolute Path at server=" + file.getAbsolutePath());
                fileItem.write(file);   //lấy nôi dung của cái file được gửi lên và lưu vào nơi chứa cho nội dung cái file mới được tạo
                //nếu lưu thành công thì sẽ thực hiện dưới này
                out.write("path" + file.getAbsolutePath());
                out.write("File" + fileItem.getName() + " uploaded successfully.");
                out.write("<br>");
                out.write("<a href=\"UploadDownLoadFileServlet?fileName=" + fileItem.getName() + "\">Download" + fileItem.getName() + "</a>");

                request.setAttribute("img", "img/"+fileItem.getName());
                request.getRequestDispatcher("upload.jsp").forward(request, response);
//                boolean addSuccess = ProductServiceWithDB.getInstance().addProduct(categoryID, name, description, price, salePrice, img, quantity);
            }
            //nếu lưu không thành công thì nó sẽ thực hiện cái catch này
        } catch(Exception e){
            out.write("Exception in upload file");
        }
        out.write("</body></html>");
    }
}
