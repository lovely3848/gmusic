package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.Criteria;
import vo.GmemberVO;

@Repository
public class GmemberDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String NS = "com.ncs.GmemberMapper.";

	public List<GmemberVO> selectList() {
		return sqlSession.selectList(NS + "selectList");
	}

	public int insert(GmemberVO vo) {
		return sqlSession.insert(NS + "insert", vo);
	}

	public int update(GmemberVO vo) {
		return sqlSession.update(NS + "update", vo);
	}

	// 추가부분///////////////
	public GmemberVO selectOne(GmemberVO vo) {
		return sqlSession.selectOne(NS + "selectOne", vo);

	}

	public int imageupdate(GmemberVO vo) {// 프로필 이미지 업데이트
		return sqlSession.update(NS + "imageupdate", vo);
	}

	public int delete(GmemberVO vo) {// 회원 탈퇴
		return sqlSession.delete(NS + "delete", vo);
	}
	// 회원 가입시 키값 저장
	public int updateAuthkey(GmemberVO vo) {
		return sqlSession.update(NS + "updateAuthkey", vo);
	}
	
	
	// 이메일 인증후 로그인 가능하게 바꾸는 값
	public int updateAuthkeyconfirm(GmemberVO vo) {
		return sqlSession.update(NS + "updateAuthkeyconfirm", vo);
	}
	
	// id, email, phone 중복확인
	public int userDuplicationCheck(GmemberVO vo) {
		return sqlSession.selectOne(NS + "userDuplicationCheck", vo);
	}
	//포인트변경
	public int pointChange(GmemberVO vo) {
		return sqlSession.update(NS + "memberpointchange", vo);
	}
	//등급변경
	public int gradeChange(GmemberVO vo) {
		return sqlSession.update(NS + "membergradechange", vo);
	}
	//페이징
	public List<GmemberVO> searchMemberList(Criteria cri) {
		return sqlSession.selectList(NS + "searchMemberList", cri);
	}

	public int searchRowCount(Criteria cri) {
		return sqlSession.selectOne(NS+"searchRowCount",cri);
	}
	//페이징
	// 아이디 찾기
	public GmemberVO searchIDCheck(GmemberVO vo) {
		return sqlSession.selectOne(NS+"searchIDCheck",vo);
	}
	
}
