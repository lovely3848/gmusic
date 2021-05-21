package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.Criteria;
import vo.MusicVO;
import vo.MyListVO;

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
	// 추가 수정 삭제

	public int insert(MusicVO vo) {
		return sqlSession.insert(NS + "insert", vo);
	} // insert

	public int update(MusicVO vo) {
		return sqlSession.update(NS + "update", vo);
	} // update

	public int delete(MusicVO vo) {
		return sqlSession.delete(NS + "delete", vo);
	} // delete

	public List<MusicVO> cartlist(String id) {
		return sqlSession.selectList(NS + "cartlist", id);
	}

	public MusicVO cartselectOne(MusicVO vo) {
		return sqlSession.selectOne(NS + "cartselectOne", vo);
	}

	public int myListInsert(MyListVO vo) {
		return sqlSession.insert(NS + "myListInsert", vo);
	}

} // class
