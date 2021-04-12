package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.GmemberDAO;
import vo.GmemberVO;

@Service
public class GmemberServiceImpl implements GmemberService {

	@Autowired
	GmemberDAO dao;

	public List<GmemberVO> selectList() {
		return dao.selectList();
	}

	public int insert(GmemberVO vo) {
		return dao.insert(vo);
	}

	public int update(GmemberVO vo) {
		return dao.update(vo);
	}

	// 추가부분./////////////////
	public GmemberVO selectOne(GmemberVO vo) {
		return dao.selectOne(vo);
	}

	public int imageupdate(GmemberVO vo) {
		return dao.imageupdate(vo);
	}

	public int delete(GmemberVO vo) {
		return dao.delete(vo);
	}
		
	// 회원 가입시 키값 저장
	public int updateAuthkey(GmemberVO vo) {
		return dao.updateAuthkey(vo);
	}

	// 이메일 인증후 로그인 가능하게 바꾸는 값
	public int updateAuthkeyconfirm(GmemberVO vo) {
		return dao.updateAuthkeyconfirm(vo);
	}

	// id, email, phone 중복확인
	public int userDuplicationCheck(GmemberVO vo) {
		return dao.userDuplicationCheck(vo);
	}



}
