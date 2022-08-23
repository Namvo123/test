package vn.edu.hcmuaf.fit.webdt.Dao;

import vn.edu.hcmuaf.fit.webdt.beans.Cart;
import vn.edu.hcmuaf.fit.webdt.beans.Product;
import vn.edu.hcmuaf.fit.webdt.db.DBConnection;
import vn.edu.hcmuaf.fit.webdt.db.JDBIConnector;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductDao {
    private static ProductDao instance;

    //none constructor
    private ProductDao() {

    }

    //lớp này là để chỉ gọi ProductDao một lần thôi
    public static ProductDao getInstance() {
        if (instance == null) {
            instance = new ProductDao();
        }
        return instance;
    }

    public static List<Product> getProductSearchWithPage(int page, int size, String searchName) {
        if (searchName.equals("")) {
            List<Product> show = new ArrayList<>();
            return show;
        } else {
            String tname = "%" + searchName + "%";
            int fromNum = page * size - (size - 1);
            int toNum = page * size;
            return JDBIConnector.get().withHandle(handle -> {
                return handle.createQuery("WITH x AS( SELECT *, ROW_NUMBER() OVER(ORDER BY id ASC) AS Row\n" +
                                "FROM products\n" +
                                "WHERE NAME LIKE ?)\n" +
                                "SELECT * FROM x WHERE Row BETWEEN ? AND ?")
                        .bind(0, tname)
                        .bind(1, fromNum)
                        .bind(2, toNum)
                        .mapToBean(Product.class).stream().collect(Collectors.toList());//quá không hiểu
                /**
                 * thầy giải thích:
                 *  -"select * from product" : thực thi cái câu sql "select * from product"
                 *  -.mapToBean(Product.class) : map(lấy) những cái thuộc tính trong class Product thuộc beans cũng là tên các cột trong sql
                 *  -collect(Collectors.toList()) :  chuyển nó thành một List (Collectors.toList())
                 */
            });
        }
    }

    public static List<Product> getProductWithPage(int page, int size, int id) {
//            String tname = "%" + searchName + "%";
        int fromNum = page * size - (size - 1);
        int toNum = page * size;
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("WITH x AS( SELECT *, ROW_NUMBER() OVER(ORDER BY id ASC) AS Row\n" +
                            "FROM products\n" +
                            "WHERE category_id = ?)\n" +
                            "SELECT * FROM x WHERE Row BETWEEN ? AND ?")
                    .bind(0, id)
                    .bind(1, fromNum)
                    .bind(2, toNum)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());//quá không hiểu
            /**
             * thầy giải thích:
             *  -"select * from product" : thực thi cái câu sql "select * from product"
             *  -.mapToBean(Product.class) : map(lấy) những cái thuộc tính trong class Product thuộc beans cũng là tên các cột trong sql
             *  -collect(Collectors.toList()) :  chuyển nó thành một List (Collectors.toList())
             */
        });
    }

    public static int getCategoryIdByID(int id) {
        int result = 0;
        String sql = "SELECT * FROM products WHERE id =?";
        PreparedStatement preparedStatement = DBConnection.getInstance().get(sql);
        try {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                result = rs.getInt("category_id");
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
            return result;
        }
    }

    public static List<Product> getAll() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM products")
                    .mapToBean(Product.class).stream().collect(Collectors.toList());//quá không hiểu
            /**
             * thầy giải thích:
             *  -"select * from product" : thực thi cái câu sql "select * from product"
             *  -.mapToBean(Product.class) : map(lấy) những cái thuộc tính trong class Product thuộc beans cũng là tên các cột trong sql
             *  -collect(Collectors.toList()) :  chuyển nó thành một List (Collectors.toList())
             */
        });
    }


    //METHOD NÀY DÙNG JDBI
    //trong đây sử dụng cú pháp lambda expression(cung cấp cách để viết code ngắn gọn hơn) (không biết cần xem thêm)
    //lambda expression: (parameter1, parameter2) -> { code block }
    public List<Product> getAll(String searchName) {
        if (searchName.equals("")) {
            List<Product> show = new ArrayList<>();
            return show;
        } else {
            String tname = "%" + searchName + "%";
            return JDBIConnector.get().withHandle(handle -> {
                return handle.createQuery("SELECT * FROM products WHERE name like ?")
                        .bind(0, tname)
                        .mapToBean(Product.class).stream().collect(Collectors.toList());//quá không hiểu
                /**
                 * thầy giải thích:
                 *  -"select * from product" : thực thi cái câu sql "select * from product"
                 *  -.mapToBean(Product.class) : map(lấy) những cái thuộc tính trong class Product thuộc beans cũng là tên các cột trong sql
                 *  -collect(Collectors.toList()) :  chuyển nó thành một List (Collectors.toList())
                 */
            });
        }
    }

    public static Product getById(int id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM products WHERE id = ?")
                    .bind(0, id)
                    .mapToBean(Product.class).first();
        });
    }

    public static boolean updateQuantity(Cart cart) {

        int result = JDBIConnector.get().withHandle(handle -> {
            int sum = 0;
            int id = 0;
            for (Product product : cart.getProductList()) {
                id = product.getId();
                sum += handle.createUpdate("UPDATE products SET quantity =? WHERE id =?")
                        .bind(0, product.getQuantity() - product.getQualitySold())
                        .bind(1, id).execute();
            }
            return sum;
        });

        return result == cart.getProductList().size();//nếu update được hết thì return true else return false
    }

    public static List<String> getImgById(int id) {
        List<String> result = new ArrayList<>();
        String sql = "SELECT * FROM product_images WHERE id_product =?";
        PreparedStatement preparedStatement = DBConnection.getInstance().get(sql);
        try {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                result.add(rs.getString("thumbnail"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return result;
    }

    //lay ten category bang product
    public static String getNameCategoryByProduct(Product product) {
        int id_category = product.getCategory_id();
        String result = "";
        String sql = "SELECT * FROM category WHERE id =?";
        PreparedStatement preparedStatement = DBConnection.getInstance().get(sql);
        try {
            preparedStatement.setInt(1, id_category);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                result = rs.getString("name_category");
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    //lay ten category bang id
    public static String getNameCategoryByID(int id) {
        String result = "";
        String sql = "SELECT * FROM category WHERE id =?";
        PreparedStatement preparedStatement = DBConnection.getInstance().get(sql);
        try {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                result = rs.getString("name_category");
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static List<Product> getProductByIdCategory(int id_category) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM products WHERE category_id = ?")
                    .bind(0, id_category)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());//quá không hiểu
            /**
             * thầy giải thích:
             *  -"select * from product" : thực thi cái câu sql "select * from product"
             *  -.mapToBean(Product.class) : map(lấy) những cái thuộc tính trong class Product thuộc beans cũng là tên các cột trong sql
             *  -collect(Collectors.toList()) :  chuyển nó thành một List (Collectors.toList())
             */
        });
    }

    public static List<Integer> getProductIDByTopSeller() {
        List<Integer> result = new ArrayList<>();
        int count = 0;
        String sql = "SELECT * from order_details GROUP BY product_id ORDER BY quantity desc";
        PreparedStatement preparedStatement = DBConnection.getInstance().get(sql);

        try {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                result.add(rs.getInt("product_id"));
                count++;
                if (count > 8) break;
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    //

    public static List<Product> getByTopSeller() {
        List<Integer> ids = getProductIDByTopSeller();
        List<Product> result = new ArrayList<>();

        for (Integer integer : ids) {
            result.add(getById(integer));
        }

        return result;
    }

    public static List<Product> getByLastestProduct() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM products ORDER BY id desc")
                    .mapToBean(Product.class).stream().collect(Collectors.toList());//quá không hiểu
            /**
             * thầy giải thích:
             *  -"select * from product" : thực thi cái câu sql "select * from product"
             *  -.mapToBean(Product.class) : map(lấy) những cái thuộc tính trong class Product thuộc beans cũng là tên các cột trong sql
             *  -collect(Collectors.toList()) :  chuyển nó thành một List (Collectors.toList())
             */
        });
    }
    public static boolean deleteProduct(int id) {
        int i = JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM products WHERE id = ?")
                        .bind(0, id).execute()//lay thoi gian(ngay va gio) hien tai
        );
        return i == 1;
    }

    public static boolean addProduct(int categoryID, String name, String description, double price, double salePrice, String img, int quantity) {
        int i = JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO products(category_id, name, description, price, sale_price, img, quantity) VALUES (?,?,?,?,?,?,?)")
                        .bind(0, categoryID)
                        .bind(1, name)
                        .bind(2, description)
                        .bind(3, price)
                        .bind(4, salePrice)
                        .bind(5, img)
                        .bind(6,quantity).execute()//lay thoi gian(ngay va gio) hien tai
        );
        return i == 1;
    }
    public static boolean updateProduct(int id, String name, String description, double price, double salePrice, int quantity, int categoryID, String img) {
        int i = JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE products SET category_id =? , name =?, description = ?, price = ?, sale_price =?, img= ?, quantity =? WHERE id = ?")
                        .bind(0, categoryID)
                        .bind(1,name)
                        .bind(2,description)
                        .bind(3,price)
                        .bind(4,salePrice)
                        .bind(5,img)
                        .bind(6,quantity)
                        .bind(7,id).execute()
        );
        return i==1;
    }
    //
    public static void main(String[] args) {
//        boolean result = deleteProduct(9);
//        boolean result = addProduct(1, "Iphone 12 Pro Max", "san pham chat luong cao", 983.33, 893.54,"img/iphone12promax.jpg", 10);
        boolean result = updateProduct(20, "Iphone 12 Pro Max", "san pham chat luong cao", 983.33, 893.54,10, 1, "img/iphone12promax.jpg");
        if(result){
            System.out.println("yes");
        }else{
            System.out.println("no");
        }
    }
}
