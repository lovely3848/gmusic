package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.Criteria;
import util.BoardDAO;
import vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;

	@Override
	public List<BoardVO> searchBList(Criteria cri) {
		return dao.searchBList(cri);
	}// searchBList

	@Override
	public int searchRowCount(Criteria cri) {
		return dao.searchRowCount(cri);
	}// searchRowCount

	@Override
	public BoardVO selectOne(BoardVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int countUp(BoardVO vo) {
		return dao.countUp(vo);
	}

	@Override
	public int insert(BoardVO vo) {
		return dao.insert(vo);
	} // insert

	@Override
	public int update(BoardVO vo) {
		return dao.update(vo);
	} // update

	@Override
	public int delete(BoardVO vo) {
		return dao.delete(vo);
	} // delete

	@Override
	public int replyInsert(BoardVO vo) {
		return dao.replyInsert(vo);
	} // replyInsert

}
