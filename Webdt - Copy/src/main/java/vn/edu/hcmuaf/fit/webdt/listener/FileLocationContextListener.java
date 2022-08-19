package vn.edu.hcmuaf.fit.webdt.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.io.File;

/**
 * đây là một web listener
 */
@WebListener
public class FileLocationContextListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {

    public FileLocationContextListener() {
    }

    //bước chuẩn bị nơi lưu trữ file
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        /* This method is called when the servlet context is initialized(when the Web application is deployed). */
//        String rootPath = System.getProperty("catalina.home");  //duong dan den thu muc root cua tomcat
        String rootPath = "D:\\word-copy2"; //co the chon duong dan khac
        ServletContext ctx = sce.getServletContext(); //truy xuat den duoc cai bien o web.xml
        String relativePath = ctx.getInitParameter("tempfile.dir");  //duong dan tuong doi de thay luu tru cai file nay o dau
        File file = new File(rootPath + File.separator + relativePath); //File.separator là // hoặc là \\ tuy theo hệ điều hành của máy
//        File file = new File(rootPath + File.separator + "webapps" + File.separator + relativePath);

        //phía trên là đường link đến nơi lưu trữ các file được upload:
        //đầu tiên đến nơi để tomcat sẽ thấy thư mục webapps do ở trên và trong webapps sẽ có các thư mục trong relativePath ở web.xml
        //=> tomcat\\webapps\\Webdt - Copy\\manage\\upload

        if (!file.exists()) file.mkdirs();   //neu khong co file nay luc dau thi tao ra no

        System.out.println("File Directory created to be used for storing files");

        //gửi lên lại mọi file với key và value như thế này
        ctx.setAttribute("FILES_DIR_FILE", file);
//        ctx.setAttribute("FILES_DIR", rootPath + File.separator + "webapps" + File.separator + relativePath);
        ctx.setAttribute("FILES_DIR", rootPath + File.separator + relativePath);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        /* This method is called when the servlet Context is undeployed or Application Server shuts down. */
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is added to a session. */
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is removed from a session. */
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is replaced in a session. */
    }
}
