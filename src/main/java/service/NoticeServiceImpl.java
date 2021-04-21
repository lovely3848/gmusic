package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.Criteria;
import util.NoticeDAO;
import vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO dao;

	@Override
	public List<NoticeVO> searchNList(Criteria cri) {
		return dao.searchNList(cri);
	}// searchBList

	@Override
	public int searchRowCountN(Criteria cri) {
		return dao.searchRowCountN(cri);
	}// searchRowCount

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
	} // insert

	@Override
	public int update(NoticeVO vo) {
		return dao.update(vo);
	} // update

	@Override
	public int delete(NoticeVO vo) {
		return dao.delete(vo);
	} // delete

}
