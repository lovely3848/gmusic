package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.Criteria;
import util.ChartDAO;
import vo.ChartVO;
import vo.MusicVO;
import vo.PageVO;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	ChartDAO dao;
	
	

	public List<MusicVO> selectdailyRank(Criteria cri) {
		return dao.selectdailyRank(cri);
	} 

	public ChartVO dailytOne(ChartVO cvo) {
		// TODO Auto-generated method stub
		return dao.dailytOne(cvo);
	}

	public void dailyMusicCount(ChartVO cvo) {
		
		dao.dailyMusicCount(cvo);
	}

	@Override
	public int rowCount(Criteria cri) {
		return dao.rowCount(cri);
	}
	
}
