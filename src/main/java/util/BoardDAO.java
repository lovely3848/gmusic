package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.Criteria;
import vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	// SqlSession (Interface) -> SqlSessionTemplate (servl...xml 에 Bean 등록)
	private static final String NS ="com.ncs.BoardMapper.";

//	** (Search) Criteria PageList
	public List<BoardVO> searchBList(Criteria cri){
		return sqlSession.selectList(NS+"searchBList",cri);
	}
	public int searchRowCount(Criteria cri) {
		return sqlSession.selectOne(NS+"searchRowCount",cri);
	}
	
	// ** selectOne detail
		public BoardVO selectOne(BoardVO vo) {
			return sqlSession.selectOne(NS+"selectOne",vo);
		} //selctOne
		
		// ** countUp(vo)	
		public int countUp(BoardVO vo) {
			return sqlSession.update(NS+"countUp",vo);
		} //countUp
		
		// ** insert (원글) : root(seq) step(0) 답글은 step(1이상)
		public int insert(BoardVO vo) {
			return sqlSession.insert(NS+"insert",vo);
		} //insert

	// ** reply insert
	// => 답글 등록과 step증가	
		public int replyInsert(BoardVO vo) {
			// step증가 후 입력
			// 조건 => root 동일하고 step 이 vo 의 step 과 같거나 큰경우
			System.out.println("** stepUpdate 결과 => "+
						sqlSession.update(NS+"stepUpdate",vo));
			return sqlSession.insert(NS+"replyInsert",vo);
		} //replyInsert
		
	// ** update
		public int update(BoardVO vo) {
			return sqlSession.update(NS+"update",vo);
		} //update
		
	// ** delete	
		public int delete(BoardVO vo) {
			// 답글등록 후 
			// => 원글 삭제 : 모든 후손들 같이 삭제
			// => 답글 삭제 : 현재글만 삭제
			// => 원글 or 답글 구분 : seq==root (원글)
			return sqlSession.delete(NS+"delete",vo);
		} //delete
	
}//BaordDAO
