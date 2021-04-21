package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GmemberVO {
	
	private String id;
	private String password;
	private String sex;
	private String email;
	private String phone;
	private String birthday;
	private String rid;
	private String genre1;
	private String grade;
	private int autopay;
	private String uploadfile;
	private MultipartFile uploadfilef;
	private String authkey;
	
}
