package service;

import java.util.List;

import criteria.Criteria;
import vo.FaqVO;
import vo.PageVO;

public interface FaqService {
	
	// ** SearchCriteria PageList
		public int searchRowCountF(Criteria cri) ;
		public List<FaqVO> searchFList(Criteria cri) ;
	
	
	// ** Criteria PageList
	public int totalRowCount() ;
	public List<FaqVO> criFList(Criteria cri) ;
	
	// ** Page BoardList
	public PageVO<FaqVO> pageList(PageVO<FaqVO> vo);
	
	// ** Check BoardList
	public List<FaqVO> checkselectList(FaqVO vo);
	
	//추가
	public FaqVO selectOne(FaqVO vo);
	public int update(FaqVO vo); //글수정
	public int delete(FaqVO vo); //글삭제
	
} //class
