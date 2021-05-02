
package service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service("mss")
public class MailSendService {
    @Autowired
    private JavaMailSenderImpl mailSender;
	private int size;

    //인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String email, String id) {
        //6자리 난수 인증번호 생성
        String authKey = getKey(6);

        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("[GMUSIC]이메일 인증 메일입니다.");
            sendMail.setText(new StringBuffer().append("<table><tr><td><h2 style='color: #0b3f9a;'>GMUSiC</h2></td></tr>")
            .append("<tr><td><h4>안녕하세요! "+id+"님</h4></td></tr>")
            .append("<tr><td><br></td></tr>")
            .append("<tr><td>본 메일은 이메일 인증을 확인하기 위한 메일입니다.</td></tr>")
            .append("<tr><td>아래 이메일 인증 버튼을 클릭해주세요.</td></tr>")
            .append("<tr><td><br></td></tr>")
            .append("<tr><td><a id='atag' href='http://localhost:8080/green/memberjoinconfirm?email=")
            .append(email)
            .append("&id=")
            .append(id)
            .append("&authkey=")
            .append(authKey)
            .append("' target='_blenk'>"
            		+ "<span style='display:inline-block; background-color:#0b3f9a; border-radius:5px; color:#fff; "
            		+ "font-size:12px; text-decoration:none; text-align:center; padding:16px 44px; "
            		+ "line-height:12px; width:200px; box-sizing:border-box; vertical-align:middle; '>이메일 인증</span></a></td></tr></table>")
            .toString());
            sendMail.setFrom("gmusicprojectmail@gmail.com", "GMUSIC");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

          return authKey;
          
         
    }
    //인증메일 보내기
    public void sendAuthMail(String email, String id ,String password) {
    	//6자리 난수 인증번호 생성
    	// 컨트롤러에서 난수 코드 가져올것
  //  	String authKey = getKey(6);
    	
    	//인증메일 보내기
    	try {
    		MailUtils sendMail = new MailUtils(mailSender);
    		sendMail.setSubject("[GMUSIC]이메일 인증 메일입니다.");
    		sendMail.setText(new StringBuffer().append("<table><tr><td><h2 style='color: #0b3f9a;'>GMUSiC</h2></td></tr>")
    				.append("<tr><td><h4>안녕하세요! "+id+"님</h4></td></tr>")
    				.append("<tr><td><br></td></tr>")
    				.append("<tr><td>회원님의 임시 비밀번호입니다. "+password+" </td></tr></table>")
    				.toString());
    		sendMail.setFrom("gmusicprojectmail@gmail.com", "GMUSIC");
    		sendMail.setTo(email);
    		sendMail.send();
    	} catch (MessagingException e) {
    		e.printStackTrace();
    	} catch (UnsupportedEncodingException e) {
    		e.printStackTrace();
    	}
    }
    
}
