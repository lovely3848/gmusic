package vo;

import lombok.Data;

@Data
public class BoardVO {
	private int seq;
	private String title;
	private String id;
	private String content;
	private String regdate;
	private int count;
	private int root;
	private int step;
	
	// ** CheckBox를 이용한 다중검색
	private String[] check;
}
