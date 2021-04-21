package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.Criteria;
import util.FaqDAO;
import vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	FaqDAO dao;

	// ** SearchCriteria PageList
	public int searchRowCountF(Criteria cri) {
		return dao.searchRowCountF(cri);
	}

	public List<FaqVO> searchFList(Criteria cri) {
		return dao.searchFList(cri);
	}

	// ** Criteria PageList
	public int totalRowCount() {
		return dao.totalRowCount();
	}

	public List<FaqVO> criFList(Criteria cri) {
		return dao.criFList(cri);
	}

	// ** Check BoardList
	public List<FaqVO> checkselectList(FaqVO vo) {
		return dao.checkselectList(vo);
	}

	@Override
	public FaqVO selectOne(FaqVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int update(FaqVO vo) {
		return dao.update(vo);
	} // update

	@Override
	public int delete(FaqVO vo) {
		return dao.delete(vo);
	} // delete
} // class
