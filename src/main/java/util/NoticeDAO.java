package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.Criteria;
import vo.BoardVO;
import vo.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	// SqlSession (Interface) -> SqlSessionTemplate (servl...xml 에 Bean 등록)
	private static final String NS = "com.ncs.NoticeMapper.";

//	** (Search) Criteria PageList
	public List<NoticeVO> searchNList(Criteria cri) {
		return sqlSession.selectList(NS + "searchNList", cri);
	}

	public int searchRowCountN(Criteria cri) {
		return sqlSession.selectOne(NS + "searchRowCountN", cri);
	}

	public List<NoticeVO> selectList() {
		return sqlSession.selectList(NS + "selectList");
	}

	public NoticeVO selectOne(NoticeVO vo) {
		return sqlSession.selectOne(NS + "selectOne", vo);
	} // selctOne

	// ** countUp(vo)
	public int countUp(NoticeVO vo) {
		return sqlSession.update(NS + "countUp", vo);
	} // countUp

	// ** insert (원글) : root(seq) step(0) 답글은 step(1이상)
	public int insert(NoticeVO vo) {
		return sqlSession.insert(NS + "insert", vo);
	} // insert

	// ** update
	public int update(NoticeVO vo) {
		return sqlSession.update(NS + "update", vo);
	} // update

	// ** delete
	public int delete(NoticeVO vo) {
		// 답글등록 후
		// => 원글 삭제 : 모든 후손들 같이 삭제
		// => 답글 삭제 : 현재글만 삭제
		// => 원글 or 답글 구분 : seq==root (원글)
		return sqlSession.delete(NS + "delete", vo);
	} // delete

}// BaordDAO
