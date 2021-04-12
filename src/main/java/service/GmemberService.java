package service;

import java.util.List;

import vo.GmemberVO;

public interface GmemberService {

	public List<GmemberVO> selectList();
	public int insert(GmemberVO vo);
	
	//mypage 정보수정 및 회원탈퇴
	public int update(GmemberVO vo);
	public int delete(GmemberVO vo);
	
	//프로필에서 이미지 변경
	public int imageupdate(GmemberVO vo);
	
	//회원 정보 불러오기
	public GmemberVO selectOne(GmemberVO vo);
	
	// 회원 가입시 키값 저장
	public int updateAuthkey(GmemberVO vo);
	
	// 이메일 인증후 로그인 가능하게 바꾸는 값
	public int updateAuthkeyconfirm(GmemberVO vo);
	
	
	// id, email, phone 중복확인
	public int userDuplicationCheck(GmemberVO vo);

	
}
