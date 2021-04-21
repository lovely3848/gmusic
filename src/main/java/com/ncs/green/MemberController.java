package com.ncs.green;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.GmemberService;
import service.MailSendService;
import vo.GmemberVO;

@Controller
public class MemberController {

	@Autowired
	GmemberService service;

	@Autowired
	PasswordEncoder passwordEncoder;

	// 메일 보내는거
	@Autowired
	private MailSendService mss;

// -----------------------------이용약관 및 회원가입 ---------------------------------------
	@RequestMapping(value = "/checkterm")
	public ModelAndView checkterm(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("member/checkterm");
		return mv;

	}

	@RequestMapping(value = "/memberjoinp")
	public ModelAndView memberjoinp(ModelAndView mv) {
		// mv.setViewName("member/joinForm2"); // ui구현 Test
		mv.setViewName("member/memberjoinp");
		return mv;
	} // memberjoinp

	@RequestMapping(value = "/memberloginpage") // 헤더 로그인 부분 페이징이동
	public ModelAndView memberjoinpage(ModelAndView mv) {
		// mv.setViewName("member/joinForm2"); // ui구현 Test
		mv.setViewName("member/memberloginpage");
		return mv;
	} // memberjoinpage

	@RequestMapping(value = "/memberjoin")
	public ModelAndView memberjoin(HttpServletRequest request, ModelAndView mv, GmemberVO vo) throws IOException {

		// ** Uploadfile (Image) 처리
		// => MultipartFile 타입의 uploadfilef 의 정보에서 화일명을 get,
		// => upload된 image 를 서버의 정해진 폴더 (물리적위치)에 저장 하고, -> file1
		// => 이 위치에 대한 정보를 table에 저장 (vo에 set) -> file2

		// ** 실제화일을 보관할 물리적 위치 찾기
		// 1) 현재 작업중인 이클립스 기준 (배포전, ver01)
		// => D:/jaepil/MyWork/Spring02/src/main/webapp/resources/uploadImage
		// 2) 배포후에는 서버 내에서의 위치가 됨.
		// => getRealPath: D:\jaepil\IDESet\apache-tomcat-9.0.41\webapps\Spring03\
		// 필요한 위치:
		// D:/jaepil/IDESet/apache-tomcat-9.0.41/webapps/Spring03/resources/uploadImage

		// ** 경로
		String realPath = request.getRealPath("/");
		System.out.println("realPath_ver01 :" + realPath);
		// realPath_ver01->
		// D:\jaepil\MyWork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Spring02\
		// 실습1) ver01
		// realPath =
		// "D:/jaepil/MyWork/Spring03/src/main/webapp/resources/uploadImage/";

		// 실습2) ver02 (배포환경 or 개발환경)
		if (realPath.contains(".eclipse.")) {
			realPath = "C:/NamCheolWoo/gproject/src/main/webapp/resources/uploadImage/";
		} else {
			realPath += "resources/uploadImage/";
		}

		// ** 폴더 만들기 (File 클래스활용)
		// => 저장 경로에 폴더가 없는 경우 만들어 준다
		File f1 = new File(realPath); // 매개변수로 지정된 정보에 대한 File 객체 생성
		System.out.println(" 생성직후 f1=> " + f1);
		if (!f1.exists())
			f1.mkdir();
		// realPath 디렉터리가 존재하는지 검사 (uploadImage 폴더 존재 확인)
		// => 존재하지 않으면 디렉토리 생성

		// ** MultipartFile
		// => 업로드한 파일에 대한 모든 정보를 가지고 있으며 이의 처리를 위한 메서드를 제공한다.
		// String getOriginalFilename(), void transferTo(File destFile),
		// boolean isEmpty()
		MultipartFile uploadfilef = null;
		// => 기본 Image 설정
		String file1, file2 = "resources/uploadImage/basicman1.jpg";
		// 전송된 Image 가 있는지 확인
		uploadfilef = vo.getUploadfilef();
		System.out.println("vo.getUploadfilef() => " + vo.getUploadfilef());
		if (uploadfilef != null && !uploadfilef.isEmpty()) {
			file1 = realPath + uploadfilef.getOriginalFilename();
			// 드라이브에 저장되는 실제 경로와 화일명
			uploadfilef.transferTo(new File(file1)); // file 붙여넣기
			file2 = "resources/uploadImage/" + uploadfilef.getOriginalFilename();
		}
		vo.setUploadfile(file2);
		// *******************************************
		System.out.println("vo.getId() => " + vo.getId());

		// ** Transaction Test
		/*
		 * 1. dependency 확인 <!-- AspectJ --> <dependency> <groupId>org.aspectj</groupId>
		 * <artifactId>aspectjrt</artifactId> <version>${org.aspectj-version}</version>
		 * </dependency> <!-- AspectJ Weaver --> <dependency>
		 * <groupId>org.aspectj</groupId> <artifactId>aspectjweaver</artifactId>
		 * <version>${org.aspectj-version}</version> </dependency>
		 * 
		 * 2. servlet-context.xml AOP 설정
		 *
		 * 3. Rollback Test 3.1) Aop xml 적용전 => insert1 은 입력되고, insert2 에서 500 오류 발생
		 * 3.2) Aop xml 적용후 => insert2 에서 오류발생시 모두 Rollback 되어 insert1, insert2 모두 입력 안됨
		 */
		// 3.1) Transaction 적용전 : 동일자료 2번 insert
		// => 첫번째는 입력완료 되고, 두번째 자료입력시 Key중복 오류발생
		// 3.2) Transaction 적용후 : 동일자료 2번 insert
		// => 첫번째는 입력완료 되고, 두번째 자료입력시 Key중복 오류발생 하지만,
		// rollback 되어 둘다 입력 안됨

		// ** Exception Test : DuplicateKeyException , SQLException
		// cnt = service.insert(vo);

		// ** PasswordEncoder 적용
		// => 다이제스트 생성 & vo에 set
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));

		// ** 이메일 통합 처리
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email3 = request.getParameter("email3");

		if (email2 != null && email2.length() > 0) {
			vo.setEmail(email1 + "@" + email2);
		} else {
			vo.setEmail(email1 + "@" + email3);
		}

		// ** 휴대폰 통합 처리
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");

		vo.setPhone(phone1 + phone2 + phone3);

		int cnt = service.insert(vo);
		if (cnt > 0) {

			// *** 이메일 인증 관련 코드
			// https://moonong.tistory.com/45 참고
			// https://blog.naver.com/vnemftnsska2/221413314636 참고

			// 임의의 authKey 생성 & 이메일 발송
			String authKey = mss.sendAuthMail(vo.getEmail(), vo.getId());
			vo.setAuthkey(authKey);

			// DB에 authKey 업데이트
			service.updateAuthkey(vo);

			// 가입성공 -> 로그인 유도 메시지 출력 : loginForm.jsp
			mv.addObject("message", " 회원 가입 성공 !!! 이메일 인증 완료 후 로그인하세요 ~~");
			mv.setViewName("member/memberloginpage");
		} else {
			// 가입실패 -> 재가입 유도 메시지 출력 : joinForm.jsp
			mv.addObject("message", " 회원 가입 실패 !!! 다시 하세요 ~~");
			mv.setViewName("member/memberjoinp");
		}
		return mv;
	} // memberjoin

	// *** 이메일 인증 확인 링크를 눌렀을때 실행
	@RequestMapping(value = "/memberjoinconfirm")
	public ModelAndView memberjoinconfirm(ModelAndView mv, HttpServletRequest request, GmemberVO vo) {
		String authKey = vo.getAuthkey();

		// Id가 DB에 있는지 확인
		vo = service.selectOne(vo);
		if (vo != null) { // 일치하는 아이디가 있음
			// 받은 authKey 값과 DB의 저장된 키값이 일치할경우 Authkey의 값을 1로 업데이트
			if (vo.getAuthkey().equals(authKey)) {

				// 같으면 authStatus의 값을 1로 업데이트
				service.updateAuthkeyconfirm(vo);

				mv.addObject("message", "이메일 인증이 완료 되었습니다. 로그인 해주세요");
				mv.setViewName("member/memberloginpage");
			} else {
				// 인증키 불일치 오류
				mv.addObject("message", "이메일 인증키가 같지 않습니다. 인증을 다시 해주세요");
				mv.setViewName("member/memberloginpage");
			}
		} else { // email 오류
			mv.addObject("message", "~~ email 오류 !! 다시 하세요 ~~");
			mv.setViewName("member/memberloginpage");
		}
		return mv;
	}

	// *** Id, Email, phone ajax 중복확인
	@RequestMapping(value = "/userCheck")
	@ResponseBody
	public int userCheck(GmemberVO vo) {

		return service.userDuplicationCheck(vo);
	}

// login 부분---------------------------------------------------------
	@RequestMapping(value = "/loginp")
	public ModelAndView loginp(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("member/memberloginp");
		return mv;
	}

	@RequestMapping(value = "/mlogin")
	public ModelAndView mlogin(HttpServletRequest request, ModelAndView mv, GmemberVO vo, RedirectAttributes rttr) {

		String password = vo.getPassword();
		vo = service.selectOne(vo);
		if (vo != null) {
			if (passwordEncoder.matches(password, vo.getPassword())) {
				// 메일 인증을 마친 사람만 로그인 가능 getAuthstatus = 0 인증안됨 / getAuthstatus = 1 인증됨
				if (vo.getAuthkey().equals("Y")) {

					request.getSession().setAttribute("loginID", vo.getId());
					request.getSession().setAttribute("loginGRADE", vo.getGrade());
					request.getSession().setAttribute("loginPW", password);
					request.getSession().setAttribute("userPickGenre1", vo.getGenre1()); // 섹션 1_1부분을 위해 추가
					System.out.println("마이장르 확인용 => "+vo.getGenre1());
//					mv.addObject("message", "로그인 성공!");
					rttr.addFlashAttribute("message", "로그인 성공!");
					mv.setViewName("redirect:home");
					/* mv.setViewName("member/loginsuccess"); */
				} else {
					rttr.addFlashAttribute("message", "이메일 인증후 로그인할 수 있습니다");
					mv.setViewName("redirect:home");
				}
			} else {
				// Password 오류
				mv.addObject("message", "~~ Password 오류 !! 다시 하세요 ~~");
				mv.setViewName("member/memberloginpage");
			}
		} else { // ID 오류
			mv.addObject("message", "~~ ID 오류 !! 다시 하세요 ~~");
			mv.setViewName("member/memberloginpage");
		}
		return mv;
	} // mlogin

	@RequestMapping(value = "/mlogout")
	public ModelAndView mlogout(HttpServletRequest request, ModelAndView mv, RedirectAttributes rttr) {

		HttpSession session = request.getSession(false);
		String message = null;
		if (session != null && session.getAttribute("loginID") != null) {
			session.invalidate();
			message = "~~ 로그아웃 성공 ~~";
		} else {
			message = "~~ 로그인 하지 않았습니다 ~~";
		}
		rttr.addFlashAttribute("message", message);
		mv.setViewName("redirect:home");
		return mv;
	} // mlogout
		// login 부분---------------------------------------------------------
//------------------------------------ 마이페이지 -----------------------------------

	@RequestMapping(value = "/mypage")
	public ModelAndView mypage(HttpServletRequest request, ModelAndView mv, GmemberVO vo) {
		vo = service.selectOne(vo);
		mv.addObject("vo", vo);
		mv.setViewName("member/mypage"); // 마이페이지 이동 set
		return mv;
	}// mypage로 이동

	@RequestMapping(value = "/myinfopage")
	public ModelAndView myinfopage(HttpServletRequest request, ModelAndView mv, RedirectAttributes rttr, GmemberVO vo) {
		request.getSession().setAttribute("loginID", vo.getId()); // 세션 아이디값을 보냄

		vo = service.selectOne(vo); // id값에 대한 vo을 확인
		mv.addObject("vo", vo); // 값을 불러오기 위한 vo값을 jsp에 전송
		mv.setViewName("member/myinfopage");
		return mv;
	}// 내 정보 띄우기.

	@RequestMapping(value = "/memberfiximage")
	public ModelAndView memberfiximage(HttpServletRequest request, ModelAndView mv, RedirectAttributes rttr,
			GmemberVO vo) throws IllegalStateException, IOException {
		// ** 경로
		String realPath = request.getRealPath("/");
		if (realPath.contains(".eclipse.")) {
			realPath = "C:/NamCheolWoo/gproject/src/main/webapp/resources/uploadImage/";
		} else {
			realPath += "resources/uploadImage/";
		}

		MultipartFile uploadfilef = null;
		// => 기본 Image 설정
		String file1, file2;
		// 전송된 Image 가 있는지 확인
		uploadfilef = vo.getUploadfilef();
		if (uploadfilef != null && !uploadfilef.isEmpty()) { // newImage 선택
			file1 = realPath + uploadfilef.getOriginalFilename();
			// 드라이브에 저장되는 실제 경로와 화일명
			uploadfilef.transferTo(new File(file1)); // file 붙여넣기
			file2 = "resources/uploadImage/" + uploadfilef.getOriginalFilename();
			vo.setUploadfile(file2);
		}
		if (service.imageupdate(vo) > 0) {
			rttr.addFlashAttribute("message", "업데이트 성공");
			mv.setViewName("member/mypage");

		} else {
			rttr.addFlashAttribute("message", "업데이트 실패");
			mv.setViewName("member/mypage");
		}

		return mv;
	}// 프로필 이미지 업데이트

	@RequestMapping(value = "/myinfochangep")
	public ModelAndView myinfochangep(ModelAndView mv, HttpServletRequest request, GmemberVO vo)
			throws UnsupportedEncodingException {
		vo = service.selectOne(vo);// 값 넘겨주어야 해당 id값이 나옴
		mv.addObject("vo", vo);
		mv.setViewName("member/myinfochangep");
		return mv;
	}// 내 정보 수정 페이지

	@RequestMapping(value = "/myinfochange")
	public ModelAndView myinfochange(ModelAndView mv, HttpServletRequest request, GmemberVO vo, RedirectAttributes rttr)
			throws UnsupportedEncodingException {
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		if (service.update(vo) > 0) {
			rttr.addFlashAttribute("message", "업데이트 성공");
			mv.setViewName("member/mypage");
			request.getSession().setAttribute("userPickGenre1", vo.getGenre1()); // 섹션 1_1부분을 위해 추가
		} else {
			rttr.addFlashAttribute("message", "업데이트 실패");
			mv.setViewName("member/myinfochangp");
		}
		return mv;
	}// 내 정보 수정 (update)

	@RequestMapping(value = "/memberdelete")
	public ModelAndView memberdelete(ModelAndView mv, HttpServletRequest request, GmemberVO vo, RedirectAttributes rttr)
			throws UnsupportedEncodingException {
		System.out.println("넘어오나?");
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("loginID") != null) {
			// 삭제준비
			vo.setId((String) session.getAttribute("loginID"));
			// 삭제오류 Test -> Detail
			// vo.setId("testtest");
			// 삭제처리
			if (service.delete(vo) > 0) { // 삭제성공 -> session삭제, List
				session.invalidate(); // session삭제
				mv.addObject("message", "정상적으로 삭제되었습니다");
				mv.setViewName("redirect:home"); // sendRedirect
			} else { // 삭제오류 -> Detail
				mv.addObject("message", "삭제가 실패하였습니다");
				mv.setViewName("member/mypage");
			}
		} else {
			mv.addObject("message", "삭제할 정보가 없습니다");
			mv.setViewName("member/mypage");
		}
		return mv;
	}

	// ----------------------------------마이페이지------------------------------------

}
