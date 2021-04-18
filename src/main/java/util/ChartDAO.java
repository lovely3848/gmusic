package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.Criteria;
import vo.ChartVO;
import vo.MusicVO;

@Repository
public class ChartDAO {

	@Autowired
	private SqlSession sqlSession; 

	private static final String NS = "com.ncs.ChartMapper.";

	public List<MusicVO> selectdailyRank(Criteria cri) {
		return sqlSession.selectList(NS + "selectdailyRank", cri);
	}

	public ChartVO dailyOne(ChartVO cvo) {
		return sqlSession.selectOne(NS + "dailyOne", cvo);
	}

	public void dailyMusicCount(ChartVO cvo) {
		sqlSession.update(NS + "dailyMusicCount", cvo);
	}

	public int rowCount(Criteria cri) {
		return sqlSession.selectOne(NS + "rowCount", cri);
	}

	public Object selectweeklyRank(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS + "selectweeklyRank", cri);
	}

	public Object selectmonthlyRank(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS + "selectmonthlyRank", cri);
	}

	public ChartVO weeklyOne(ChartVO cvo) {
		return sqlSession.selectOne(NS + "weeklyOne", cvo);
	}

	public void weeklyMusicCount(ChartVO cvo) {
		sqlSession.update(NS + "weeklyMusicCount", cvo);
		
	}

	public ChartVO monthlyOne(ChartVO cvo) {
		return sqlSession.selectOne(NS + "monthlyOne", cvo);
	}

	public void monthlyMusicCount(ChartVO cvo) {
		sqlSession.update(NS + "monthlyMusicCount", cvo);
		
	}

}
