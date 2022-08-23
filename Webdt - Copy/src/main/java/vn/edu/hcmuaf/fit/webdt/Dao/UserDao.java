package vn.edu.hcmuaf.fit.webdt.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.webdt.beans.Product;
import vn.edu.hcmuaf.fit.webdt.beans.User;
import vn.edu.hcmuaf.fit.webdt.db.DBConnection;
import vn.edu.hcmuaf.fit.webdt.db.JDBIConnector;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/*'
    ĐÂY LÀ LỚP THƯC HIỆN CÂU LỆNH SQL VE BANG USER
 */
public class UserDao {
    private static UserDao instance;

    //none constructor
    public UserDao() {

    }

    //lop de chi goi UserDao mot lan
    public static UserDao getInstance() {
        if (instance == null) {
            instance = new UserDao();
        }
        return instance;
    }

    //kiem tra xem coi co username va password trong CSDL nay khong neu co thi cho phep dang nhap(return true)
    public static User checkLogin(String username, String password) {
        List<User> users = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM user WHERE userName = ?")
                        .bind(0, username)
                        .mapToBean(User.class).stream().collect(Collectors.toList())
        );
        if (users.size() != 1) return null;
        User user = users.get(0);
        if (!user.getPassword().equals(hashPassword(password)) || !user.getUserName().equals(username)) {
            return null;
        }
        return user;
    }

    //kiem tra neu co ten roi thi return null
    public static User checkUserName(String username) {
        List<User> users = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM user WHERE userName = ?")
                        .bind(0, username)
                        .mapToBean(User.class).stream().collect(Collectors.toList())
        );
        if (users.size() != 1) return null;
        User user = users.get(0);
        return user;
    }
    //kiểm tra xem coi có username và password trong CSDL này không nếu không có thì thêm vào CSDL
    public static boolean register(String username, String password, String email, String day_birth, String gender, String card_number) {
        User user = checkUserName(username); //kiem tra neu da co ten roi thi return false
        if(user != null){
            return false;
        }
        int i = JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO user(userName, password, email, day_birth, gender, card_number,created_at) VALUES (?,?,?,?,?,?,?)")
                        .bind(0, username)
                        .bind(1, hashPassword(password))
                        .bind(2, email)
                        .bind(3, day_birth)
                        .bind(4, gender)
                        .bind(5, card_number)
                        .bind(6,Timestamp.valueOf(LocalDateTime.now())).execute()//lay thoi gian(ngay va gio) hien tai
        );
        return i == 1;
    }

    //mã hóa password với thuật toán sha-256
    public static String hashPassword(String password) {
        try {
            MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
            byte[] hash = sha256.digest(password.getBytes(StandardCharsets.UTF_8));
            BigInteger number = new BigInteger(1, hash);
            return number.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    //update thong tin nguoi dung
    public static boolean updateUser(int id, String userName, String email, String phone_number, String address, String zip_code,String city, String state,String country, String password) {
        int i = JDBIConnector.get().withHandle(handle ->
            handle.createUpdate("UPDATE user SET userName =? , password =?, email = ?, phone_number = ?, address =?, zip_code= ?, city =?, state =?, country =?, update_at=? WHERE id = ?")
                    .bind(0, userName)
                    .bind(1,password)
                    .bind(2,email)
                    .bind(3,phone_number)
                    .bind(4,address)
                    .bind(5,zip_code)
                    .bind(6,city)
                    .bind(7,state)
                    .bind(8,country)
                    .bind(9,Timestamp.valueOf(LocalDateTime.now()))
                    .bind(10,id).execute()
        );
        return i==1;
    }

    //lay user tu id
    public static User getUserById(int id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM user WHERE id = ?")
                    .bind(0,id)
                    .mapToBean(User.class).first();
        });
    }

    //lay tat ca user trong csdl
    public static List<User> getAll() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM user")
                    .mapToBean(User.class).stream().collect(Collectors.toList());
        });
    }

    //xoa nguoi dung voi id
    public static boolean deleteUser(int id) {
        int i = JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM user WHERE id = ?")
                        .bind(0, id).execute()//lay thoi gian(ngay va gio) hien tai
        );
        return i == 1;
    }
//    public static void main(String[] args) {
//        register("Najoo","123","vonam706@gmail.com", "1234", "male", "12345");
//
//    }
}
