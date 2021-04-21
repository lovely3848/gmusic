package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.Criteria;
import util.MusicDAO;
import vo.MusicVO;

@Service
public class MusicServiceimpl implements MusicService {

	@Autowired
	MusicDAO dao;

	public List<MusicVO> selectList() {
		return dao.selectList();
	} // selectList

	public MusicVO selectOne(MusicVO vo) {
		return dao.selectOne(vo);
	} // selectOne

	public void musicCount(MusicVO vo) {
		dao.musicCount(vo);
	}

	public List<MusicVO> musicList(Criteria cri) {
		return dao.musicList(cri);
	}

	public int totalRowCount() {
		return dao.totalRowCount();
	}

	public List<MusicVO> releasedateList(Criteria cri) {
		return dao.releasedateList(cri);
	}

	public int releasedateRowCount() {
		return dao.releasedateRowCount();
	}

	public int genreRowCount(MusicVO vo) {
		return dao.genreRowCount(vo);
	}

	public List<MusicVO> genreList(Criteria cri) {
		return dao.genreList(cri);
	} // genreList

	/*-------------------검색부분--------------------*/
	// ** SearchCriteria PageList

	public int searchRowCountSname(Criteria cri) {
		return dao.searchRowCountSname(cri);
	}



	public List<MusicVO> searchSnameList(Criteria cri) {
		return dao.searchSnameList(cri);
	}


//	public List<MusicVO> criSnameList(Criteria cri) {
//		return dao.criSnameList(cri);
//	}
//
//	public List<MusicVO> criSingerNameList(Criteria cri) {
//		return dao.criSingerNameList(cri);
//	}
//
//	public List<MusicVO> criLyricsList(Criteria cri) {
//		return dao.criLyricsList(cri);
//	}
}
