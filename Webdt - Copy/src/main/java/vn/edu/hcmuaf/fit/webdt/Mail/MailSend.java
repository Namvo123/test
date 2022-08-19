package vn.edu.hcmuaf.fit.webdt.Mail;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class MailSend {
    private static MailSend instance;
    private String usernameBeingSend = "vnamapp167@gmail.com";
    private String passwordBeingSend = "birrugtsqnllgdsx";

    public MailSend() {

    }

    public static MailSend getInstance() {
        if (instance == null) {
            instance = new MailSend();
        }
        return instance;
    }

    public Session connect() {
        //SEND MAIL SMTP (phải có khi gửi)
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.ssl.trust", "*");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        return Session.getDefaultInstance( props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usernameBeingSend, passwordBeingSend);// email cua minh
            }
        });
    }

    public boolean sendMail(String sendTo, String subject, String textMessage) {
        Session session = connect();

        // compose message
        /**
         * Cấu trúc của một email: 1.To:địa chỉ email người nhận , có thể gửi cho nhiều
         * người .
         *
         * 2.Cc: Người nhận Cc thường thêm vào tin nhắn cho mục đích thông báo. Ví dụ,
         * nếu dự án ABC ảnh hưởng đến dự án của bạn, bạn có thể nhận Cc thư về dự án
         * ABC thậm chí khi không cần thiết cho bạn để phản hồi những tin nhắn này.
         *
         * 3.Bcc: Bcc là sao chép ẩn danh. Khi bạn một người nhận ẩn danh vào tin nhắn,
         * sẽ không ai có thể biết rằng họ đang nhận được một bản sao của tin nhắn nhưng
         * bạn và người đó.
         *
         * 4.Subject : tiêu đề của email.
         *
         * 5.Content : Nội dung thư. Nội dung này có thể bao gồm: văn bản, html, image,
         * …
         *
         * 6.Attachment : tập tin sẽ được gửi kèm theo email.
         *
         * 7.Ngoài ra còn có ReplyTo : email người nhận mặc định khi người dùng Nhấn
         * Reply
         */
        try {
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(usernameBeingSend, "Cellphone Shop NDN"));//tên mà mình muốn đặt khi gửi(nếu để không chắc là nó sẽ hiện mail)

//			chỗ sendTo ở dưới là email mình muốn gửi(trong trường hợp này là tự mình gửi cho mình)
            mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendTo));
            mimeMessage.setHeader("Content-Type", "text/plain; charset=UTF-8");
            mimeMessage.setSubject(subject);
            mimeMessage.setText(textMessage);

            // send message
            Transport.send(mimeMessage);

            return true;
        } catch (MessagingException | UnsupportedEncodingException e) {
//			throw new RuntimeException(e);
            return false;
        }
    }

    public static void main(String[] args) {
//        String sendTo ="vnamapp167@gmail.com";
//        String subject ="Xác nhận đăng ký tài khoảng!";
//        String textMessage = "Tin nhắn này là để xác nhận khách hàng vừa mới đăng ký tài khoảng trên shop của chúng tôi";
//
//        if(sendMail(sendTo, subject, textMessage)) {
//            System.out.println("Message sent successfully");
//        }else {
//            System.out.println("Message error!");
//        }
        System.out.println("Tin nhắn này là để xác nhận khách hàng vừa mới đăng ký tài khoảng trên shop của chúng tôi");
    }
}
