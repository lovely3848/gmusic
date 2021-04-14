package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.Criteria;
import util.FaqDAO;
import util.NoticeDAO;
import vo.BoardVO;
import vo.FaqVO;
import vo.NoticeVO;
import vo.PageVO;
@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeDAO dao;
	
	@Autowired
	FaqDAO Fdao;
	
	@Override
	public List<NoticeVO> searchNList(Criteria cri) {
		return dao.searchNList(cri);
	}//searchBList
	@Override
	public int searchRowCountN(Criteria cri) {
		return dao.searchRowCountN(cri);
	}//searchRowCount
	@Override
	public List<NoticeVO> selectList() {
		return dao.selectList();
	}
	@Override
	public NoticeVO selectOne(NoticeVO vo) {
		return dao.selectOne(vo);
	}
	@Override
	public int countUp(NoticeVO vo) {
		return dao.countUp(vo);
	}
	@Override
	public int insert(NoticeVO vo) {
		return dao.insert(vo);
	} //insert
	@Override
	public int update(NoticeVO vo) {
		return dao.update(vo);
	} //update
	@Override
	public int delete(NoticeVO vo) {
		return dao.delete(vo);
	} //delete
	@Override
	public int replyInsert(NoticeVO vo) {
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
