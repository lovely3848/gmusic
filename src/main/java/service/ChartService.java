package service;

import java.util.List;

import criteria.Criteria;
import vo.ChartVO;
import vo.MusicVO;

public interface ChartService {

	public List<MusicVO> selectdailyRank(Criteria cri);
	public ChartVO dailyOne(ChartVO cvo);
	public void dailyMusicCount(ChartVO cvo);
	public int rowCount(Criteria cri);
	public Object selectweeklyRank(Criteria cri);
	public Object selectmonthlyRank(Criteria cri);
	public ChartVO weeklyOne(ChartVO cvo);
	public void weeklyMusicCount(ChartVO cvo);
	public ChartVO monthlyOne(ChartVO cvo);
	public void monthlyMusicCount(ChartVO cvo);
	
	
}
