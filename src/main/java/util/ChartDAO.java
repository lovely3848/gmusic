package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.Criteria;
import vo.ChartVO;
import vo.MusicVO;
import vo.PageVO;

@Repository
public class ChartDAO {

	@Autowired
	private SqlSession sqlSession; 

	private static final String NS = "com.ncs.ChartMapper.";

	public List<MusicVO> selectdailyRank(Criteria cri) {
		return sqlSession.selectList(NS + "selectdailyRank", cri);
	}

	public ChartVO dailytOne(ChartVO cvo) {
		return sqlSession.selectOne(NS + "dailytOne", cvo);
	}

	public void dailyMusicCount(ChartVO cvo) {
		sqlSession.update(NS + "dailyMusicCount", cvo);
	}

	public int rowCount(Criteria cri) {
		return sqlSession.selectOne(NS + "rowCount", cri);
	}

}
