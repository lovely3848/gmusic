package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.Criteria;
import vo.MusicVO;

// ** Board CRUD 구현
@Repository
public class MusicDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String NS = "com.ncs.MusicMapper.";

	// ** selectList
	public List<MusicVO> selectList() {
		return sqlSession.selectList(NS + "selectList");
	} // selectList

	// ** selctOne
	public MusicVO selectOne(MusicVO vo) {
		return sqlSession.selectOne(NS + "selectOne", vo);
	} // selctOne

	public void musicCount(MusicVO vo) {
		sqlSession.update(NS + "musicCount", vo);
	}

	// ** musicList
	public List<MusicVO> musicList(Criteria cri) {
		return sqlSession.selectList(NS + "musicList", cri);
	} // musicList

	public int totalRowCount() {
		return sqlSession.selectOne(NS + "totalRowCount");
	}

	public List<MusicVO> releasedateList(Criteria cri) {
		return sqlSession.selectList(NS + "releasedateList", cri);
	} // genreList

	public int releasedateRowCount() {
		return sqlSession.selectOne(NS + "releasedateRowCount");
	}

	// ** genreList
	public List<MusicVO> genreList(Criteria cri) {
		return sqlSession.selectList(NS + "genreList", cri);
	} // genreList

	public int genreRowCount(MusicVO vo) {
		return sqlSession.selectOne(NS + "genreRowCount", vo);
	}

	/*-------------검색부분 추가--------------*/
	// SearchCriteria PageList
	public int searchRowCountSname(Criteria cri) {
		return sqlSession.selectOne(NS + "searchRowCountSname", cri);
	}


	public List<MusicVO> searchSnameList(Criteria cri) {
		return sqlSession.selectList(NS + "searchSnameList", cri);
	}

//	// ** Criteria PageList
//	public List<MusicVO> criSnameList(Criteria cri) {
//		return sqlSession.selectList(NS + "pageSnameList", cri);
//	}
//
//	public List<MusicVO> criSingerNameList(Criteria cri) {
//		return sqlSession.selectList(NS + "pageSnameList", cri);
//	}
//
//	public List<MusicVO> criLyricsList(Criteria cri) {
//		return sqlSession.selectList(NS + "pageSnameList", cri);
//	}
} // class
