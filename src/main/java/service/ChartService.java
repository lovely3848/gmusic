package service;

import java.util.List;

import criteria.Criteria;
import vo.ChartVO;
import vo.MusicVO;
import vo.PageVO;

public interface ChartService {

	public List<MusicVO> selectdailyRank(Criteria cri);
	public ChartVO dailytOne(ChartVO cvo);
	public void dailyMusicCount(ChartVO cvo);
	public int rowCount(Criteria cri);
	
	
}
