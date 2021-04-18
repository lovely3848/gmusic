package vo;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;

@Data
public class ChartVO {

	private int snum;
	private int count;
	
	@Autowired
	private MusicVO musicVO;
	

}
