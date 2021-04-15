package vo;

import lombok.Data;

@Data
public class MusicVO {
	private int snum;
	private String sname;
	private String stitle;
	private String singername;
	private String releasedate;
	private String genre;
	private String lyrics;
	private int country;
	private String musicurl;
	private String downloadfile;
	private String image;
	private int count;
	private String rnum; // 음악 차트 page에 따른 numbering을 1~10반복하지 않게 하기위한 rnum (sql 참조)
}
