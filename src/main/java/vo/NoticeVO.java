package vo;

import lombok.Data;

@Data
public class NoticeVO {
	private int seq;
	private String title;
	private String id;
	private String content;
	private String regdate;
	private int count;
	
	// ** CheckBox를 이용한 다중검색
	private String[] check;
}
