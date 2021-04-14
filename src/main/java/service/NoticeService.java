package service;

import java.util.List;

import criteria.Criteria;
import vo.BoardVO;
import vo.FaqVO;
import vo.NoticeVO;
import vo.PageVO;

public interface NoticeService {
	// Criteria
	public List<NoticeVO> searchNList(Criteria cri);

	public int searchRowCountN(Criteria cri);

	public List<NoticeVO> selectList();
	
	public NoticeVO selectOne(NoticeVO vo);

	public int countUp(NoticeVO vo);

	public int insert(NoticeVO vo); // 글등록

	public int update(NoticeVO vo); // 글수정

	public int delete(NoticeVO vo); // 글삭제

	public int replyInsert(NoticeVO vo);// 답글등록

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
