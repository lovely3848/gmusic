package service;

import java.util.List;

import criteria.Criteria;
import vo.NoticeVO;

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

}// interface
