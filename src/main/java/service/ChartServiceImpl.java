package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.Criteria;
import util.ChartDAO;
import vo.ChartVO;
import vo.MusicVO;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	ChartDAO dao;

	public List<MusicVO> selectdailyRank(Criteria cri) {
		return dao.selectdailyRank(cri);
	}

	public ChartVO dailyOne(ChartVO cvo) {
		// TODO Auto-generated method stub
		return dao.dailyOne(cvo);
	}

	public void dailyMusicCount(ChartVO cvo) {

		dao.dailyMusicCount(cvo);
	}

	public int rowCount(Criteria cri) {
		return dao.rowCount(cri);
	}

	public Object selectweeklyRank(Criteria cri) {
		return dao.selectweeklyRank(cri);
	}

	public Object selectmonthlyRank(Criteria cri) {
		return dao.selectmonthlyRank(cri);
	}

	@Override
	public ChartVO weeklyOne(ChartVO cvo) {
		// TODO Auto-generated method stub
		return dao.weeklyOne(cvo);
	}

	@Override
	public void weeklyMusicCount(ChartVO cvo) {
		dao.weeklyMusicCount(cvo);

	}

	@Override
	public ChartVO monthlyOne(ChartVO cvo) {
		return dao.monthlyOne(cvo);
	}

	@Override
	public void monthlyMusicCount(ChartVO cvo) {
		dao.monthlyMusicCount(cvo);

	}

}
