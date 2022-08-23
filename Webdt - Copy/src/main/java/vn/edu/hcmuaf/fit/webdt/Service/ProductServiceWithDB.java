package vn.edu.hcmuaf.fit.webdt.Service;

import vn.edu.hcmuaf.fit.webdt.Dao.ProductDao;
import vn.edu.hcmuaf.fit.webdt.beans.Cart;
import vn.edu.hcmuaf.fit.webdt.beans.Product;
import vn.edu.hcmuaf.fit.webdt.db.JDBIConnector;

import java.util.List;

public class ProductServiceWithDB {
    private static ProductServiceWithDB instance;

    //none constructor
    private ProductServiceWithDB(){

    }

    //lớp này là để chỉ gọi ProductServiceWithDB một lần thôi
    public static ProductServiceWithDB getInstance(){
        if(instance == null){
            instance = new ProductServiceWithDB();
        }
        return instance;
    }

    public List<Product> getAll(String searchName){
        return ProductDao.getInstance().getAll(searchName);
    }

    public Product getById(int id) {
        return ProductDao.getById(id);
    }

    public boolean updateQuantity(Cart cart) {
        return ProductDao.updateQuantity(cart);
    }

    public List<String> getImgById(int id) {
        return ProductDao.getImgById(id);
    }

    public String getNameCategoryByProduct(Product product) {
        return ProductDao.getNameCategoryByProduct(product);
    }

    public String getNameCategoryByID(int id){
        return ProductDao.getNameCategoryByID(id);
    }
    public List<Product> getProductListByIdCategory(int id_category) {
        return ProductDao.getProductByIdCategory(id_category);
    }

    public List<Product> getByTopSeller() {
        return ProductDao.getByTopSeller();
    }

    public List<Product> getByLastestProduct() {
        return ProductDao.getByLastestProduct();
    }

    public List<Product> getProductSearchWithPage(int page, int size, String searchName) {
        return ProductDao.getProductSearchWithPage(page, size ,searchName);
    }

    public List<Product> getProductWithPage(int page, int size, int id) {
        return ProductDao.getProductWithPage(page, size ,id);
    }

    public int getCategoryIdByID(int id){
        return ProductDao.getCategoryIdByID(id);
    }

    public List<Product> getAll() {
        return ProductDao.getAll();
    }

    public boolean deleteProduct(int id) {
        return ProductDao.deleteProduct(id);
    }

    public boolean addProduct(int categoryID, String name, String description, double price, double salePrice, String img, int quantity) {
        return ProductDao.addProduct(categoryID, name, description, price, salePrice, img, quantity);
    }

    public boolean updateProduct(int id, String name, String description, double price, double salePrice, int quantity, int categoryID, String img) {
        return ProductDao.updateProduct(id, name , description, price, salePrice, quantity, categoryID, img);
    }
}
