package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.Criteria;
import vo.FaqVO;

@Repository
public class FaqDAO {

	@Autowired
	private SqlSession sqlSession; 

	// SqlSession (Interface) -> SqlSessionTemplate (servl...xml 에 Bean 등록)
	private static final String NS ="com.ncs.FaqMapper.";

	//SearchCriteria PageList
	public int searchRowCountF(Criteria cri) {
		return sqlSession.selectOne(NS+"searchRowCountF",cri);
	}  
	public List<FaqVO> searchFList(Criteria cri) {
		return sqlSession.selectList(NS+"searchFList",cri);
	}

	// ** Criteria PageList	
	public List<FaqVO> criFList(Criteria cri) {
		return sqlSession.selectList(NS+"pageList",cri);
	}

	// ** Page BoardList
	public int totalRowCount() {
		return sqlSession.selectOne(NS+"totalRowCount");
	}  

	// ** Check BoardList
	public List<FaqVO> checkselectList(FaqVO vo) {
		return sqlSession.selectList(NS+"checkselectList",vo);
	}	

	//추가 해야하는 부분.
	// ** selectOne detail
	public FaqVO selectOne(FaqVO vo) {
		return sqlSession.selectOne(NS+"selectOne",vo);
	} //selctOne

	// ** update
	public int update(FaqVO vo) {
		return sqlSession.update(NS+"update",vo);
	} //update

	// ** delete	
	public int delete(FaqVO vo) {
		return sqlSession.delete(NS+"delete",vo);
	}


} //class
