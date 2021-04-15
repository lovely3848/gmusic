package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.Criteria;
import util.BoardDAO;
import util.FaqDAO;
import vo.BoardVO;
import vo.FaqVO;
import vo.PageVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO dao;
	
	@Autowired
	FaqDAO Fdao;
	
	@Override
	public List<BoardVO> searchBList(Criteria cri) {
		return dao.searchBList(cri);
	}//searchBList
	@Override
	public int searchRowCount(Criteria cri) {
		return dao.searchRowCount(cri);
	}//searchRowCount
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
	} //insert
	@Override
	public int update(BoardVO vo) {
		return dao.update(vo);
	} //update
	@Override
	public int delete(BoardVO vo) {
		return dao.delete(vo);
	} //delete
	@Override
	public int replyInsert(BoardVO vo) {
		return dao.replyInsert(vo);
	} //replyInsert
	
	

	// ** SearchCriteria PageList
	public int searchRowCountF(Criteria cri) {
		return Fdao.searchRowCountF(cri);
	}
	public List<FaqVO> searchFList(Criteria cri) {
			return Fdao.searchFList(cri);
	}
	
	// ** Criteria PageList
	public int totalRowCount() {
		return Fdao.totalRowCount();
	}
	public List<FaqVO> criFList(Criteria cri) {
		return Fdao.criBList(cri);
	}

	// ** Page BoardList
	// => totalRowCount set, 출력할 board row set 
	public PageVO<FaqVO> pageList(PageVO<FaqVO> vo) {
		vo.setTotalRowCount(Fdao.totalRowCount());
		vo.setList(Fdao.pageList(vo));
		return vo; 
	}

	// ** Check BoardList
	public List<FaqVO> checkselectList(FaqVO vo) {
		return Fdao.checkselectList(vo);
	}
	
}
