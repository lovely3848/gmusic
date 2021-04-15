package service; 

import java.util.List;

import criteria.Criteria;
import vo.BoardVO;
import vo.FaqVO;
import vo.PageVO;

public interface BoardService {
	// Criteria
	public List<BoardVO> searchBList(Criteria cri);

	public int searchRowCount(Criteria cri);

	public BoardVO selectOne(BoardVO vo);

	public int countUp(BoardVO vo);

	public int insert(BoardVO vo); // 글등록

	public int update(BoardVO vo); // 글수정

	public int delete(BoardVO vo); // 글삭제

	public int replyInsert(BoardVO vo);// 답글등록

	// ** SearchCriteria PageList
	public int searchRowCountF(Criteria cri);

	public List<FaqVO> searchFList(Criteria cri);

// ** Criteria PageList
	public int totalRowCount();

	public List<FaqVO> criFList(Criteria cri);

// ** Page BoardList
	public PageVO<FaqVO> pageList(PageVO<FaqVO> vo);

// ** Check BoardList
	public List<FaqVO> checkselectList(FaqVO vo);
}// interface
