package com.ncs.green;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import criteria.Criteria;
import criteria.PageMaker;
import service.BoardService;
import service.FaqService;
import service.NoticeService;
import vo.BoardVO;
import vo.FaqVO;
import vo.NoticeVO;

@Controller
public class BoardController {
	@Autowired
	NoticeService noticeService;

	@Autowired
	FaqService FAQservice;

	@Autowired
	BoardService service;

	/** -----------------공지사항 시작--------------------- **/
	// notice 공지사항
	@RequestMapping(value = "/notice")
	public ModelAndView notice(ModelAndView mv, HttpServletRequest request, Criteria cri, PageMaker pageMaker) {

		cri.setSnoEno();
		mv.addObject("Banana", noticeService.searchNList(cri));

		// 3) PageMaker 처리
		pageMaker.setCri(cri);
		// pageMaker.setTotalRow(service.totalRowCount()); //ver01
		pageMaker.setTotalRow(noticeService.searchRowCountN(cri)); // ver02

		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("notice/noticepage");
		return mv;
	} // notice

	@RequestMapping(value = "/ndetail")
	public ModelAndView ndetail(HttpServletRequest request, ModelAndView mv, NoticeVO vo) {
		// ** 조회수 증가
		// => 조건 : 글쓴이의 ID 와 글보는이의 ID (logID) 가 다른 경우
		// 로그인 하지않은 경우도 포함.
		// => 처리 순서 : 증가 후 조회
		// => 증가
		// controller, Java 구문으로 : getCnt() -> setCnt(++getCnt()) -> board Update
		// DAO 에서 sql 구문으로 : board update -> cnt=cnt+1

		// 1. 증가조건 확인
		// => session 에서 logID get
		HttpSession session = request.getSession(false);
		String loginID = null; // 로그인 하지 않음
		if (session != null && session.getAttribute("loginID") != null) {// 로그인 했을시
			loginID = (String) session.getAttribute("loginID");
		}

		// => board , selectOne 으로 ID get
		vo = noticeService.selectOne(vo);
		if (vo != null) {
			// 2. 비교 & 증가
			// => 조건 처리
			mv.addObject("Apple", vo);
			if (!vo.getId().equals(loginID)) {
				vo.setCount(vo.getCount() + 1);
				noticeService.countUp(vo);
			}
			if ("U".equals(request.getParameter("jcode"))) {
				mv.setViewName("notice/noticeUpdateForm");
			} else {
				mv.setViewName("notice/noticeDetail");
			}
		} else {
			mv.addObject("message", "~~ 글번호에 해당하는글이 존재하지 않습니다 ~~");
			mv.setViewName("redirect:notice");
			/*
			 * url 로 전달되는 한글 message 처리 위한 encoding String message =
			 * URLEncoder.encode("~~ 해당하는 글이 없네용 ~~", "UTF-8");
			 * mv.setViewName("redirect:blist?message="+message); // sendRedirect => 메서드 헤더에
			 * throws UnsupportedEncodingException 해야함
			 */
		}
		// redirect 요청시 전달된 message 처리
		// => from mdetail
		/*
		 * if (request.getParameter("message") !=null )
		 * mv.addObject("message",request.getParameter("message"));
		 */
		return mv;
	} // ndetail

	@RequestMapping(value = "/ninsertf")
	public ModelAndView ninsertf(ModelAndView mv) {
		mv.setViewName("notice/noticeInsertForm");
		return mv;
	} // ninsertf

	@RequestMapping(value = "/ninsert")
	public ModelAndView ninsert(ModelAndView mv, NoticeVO vo, RedirectAttributes rttr) {

		if (noticeService.insert(vo) > 0) {
			// 성공 -> boardList
			rttr.addFlashAttribute("message", "~~ 글등록 성공 ~~");
			mv.setViewName("redirect:notice");
		} else {
			// 실패 -> insertForm
			rttr.addFlashAttribute("message", "~~ 글등록 실패 !!! 다시 하세요 ~~");
			mv.setViewName("notice/noticeInsertForm");
		}
		return mv;
	} // ninsert

	@RequestMapping(value = "/nupdate")
	public ModelAndView nupdate(ModelAndView mv, NoticeVO vo, RedirectAttributes rttr) {
		if (noticeService.update(vo) > 0) {
			rttr.addFlashAttribute("message", "글이 수정되었습니다.");
			mv.setViewName("redirect:ndetail?seq=" + vo.getSeq());
		} else {
			rttr.addFlashAttribute("message", "글 수정에 실패 하셨습니다.");
			mv.setViewName("redirect:ndetail?seq=" + vo.getSeq() + "&jcode=U"); // 컨트롤러를 통해 수정페이지로 다시가라
		}
		return mv;
	} // nupdate

	@RequestMapping(value = "/ndelete")
	public ModelAndView ndelete(ModelAndView mv, NoticeVO vo, RedirectAttributes rttr) {
		if (noticeService.delete(vo) > 0) {
			rttr.addFlashAttribute("message", "글이 삭제 되었습니다.");
			mv.setViewName("redirect:notice");
		} else {
			rttr.addFlashAttribute("message", "글 삭제가 올바르게 되지 않았습니다.");
			mv.setViewName("redirect:ndetail?seq=" + vo.getSeq());
		}
		return mv;
	} // ndelete

	/** --------------------공지사항 끝-------------------- **/

	/** --------------------faq 시작-------------------- **/

	@RequestMapping(value = "/faq")
	public ModelAndView faq(ModelAndView mv, Criteria cri, PageMaker pageMaker) {

		cri.setRowPerPage(7);
		cri.setSnoEno();
		mv.addObject("Banana", FAQservice.searchFList(cri));

		// 3) PageMaker 처리
		pageMaker.setCri(cri);
		pageMaker.setTotalRow(FAQservice.searchRowCountF(cri)); // ver02

		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("faq/faqpage");
		return mv;
	} // faqpage

	/******************** 추가한부분 ******************/
	@RequestMapping(value = "/fdetail")
	public ModelAndView fdetail(HttpServletRequest request, ModelAndView mv, FaqVO vo) {
		// 수정 페이지로
		vo = FAQservice.selectOne(vo);
		if (vo != null) {
			// 2. 비교 & 증가
			// => 조건 처리
			mv.addObject("Apple", vo);
			if ("U".equals(request.getParameter("jcode"))) {
				mv.setViewName("faq/faqupdateForm");
			} else {
				mv.setViewName("redirect:home"); // 확인용으로 홈으로 보냄 원래는 faqpage로 보낼생각
			}
		} else {
			mv.addObject("message", "~~ 글번호에 해당하는글이 존재하지 않습니다 ~~");
			mv.setViewName("redirect:faq");
		}
		return mv;
	}

	@RequestMapping(value = "/fupdate")
	public ModelAndView fupdate(HttpServletRequest request, ModelAndView mv, FaqVO vo) {

		if (FAQservice.update(vo) > 0) {
			mv.addObject("message", "~~ 글수정 성공 ~~");
		} else {
			mv.addObject("message", "~~ 글수정 실패 ~~");
		}
		// redirect 의 경우 mv에 addObject 값은 파라미터로 연결되어 전송
		// => 받는쪽에서는 request.getParameter("message") 로 처리가능

		mv.setViewName("redirect:faq");
		return mv;
	} // fupdate

	@RequestMapping(value = "/fdelete")
	public ModelAndView bdelete(ModelAndView mv, FaqVO vo) {

		if (FAQservice.delete(vo) > 0) {
			// 성공 -> boardList
			mv.addObject("message", "~~ 글삭제 성공 ~~");
			mv.setViewName("redirect:home");
		} else {
			// 실패 -> bdetail
			mv.addObject("message", "~~ 글삭제 실패 ~~");
			mv.setViewName("redirect:faq");
		}
		return mv;
	} // fdelete

	/** --------------------faq 끝-------------------- **/

	/** --------------------qna 시작-------------------- **/

	// ** Criteria PageList ver01_Ver02
	@RequestMapping(value = "/qna")
	public ModelAndView qna(ModelAndView mv, Criteria cri, PageMaker pageMaker) {

		// SearchType에 '---'인 keyword클리어
		// if("n".equals(cri.getSearchType())) {cri.setKeyword("");}
		// jsp에서 처리함이 바람직함

		// 1) currPage 이용해서 sno,eno 계산
		cri.setSnoEno();
		// 2) Service 처리
		// mv.addObject("Banana",service.criBList(cri)); //ver01
		// ** ver02 : 검색조건(searchType, keyword)에 따른 검색
		// => service 추가 : (searchBList(cri) , searchRowCount() )
		mv.addObject("Banana", service.searchBList(cri)); // ver02
		// 3) PageMaker 처리
		pageMaker.setCri(cri);
//				pageMaker.setTotalRow(service.totalRowCount()); // ver01
		pageMaker.setTotalRow(service.searchRowCount(cri)); // ver02

		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("counselling/qnaboard");

		return mv;
	}// qna

	@RequestMapping(value = "/bdetail")
	public ModelAndView bdetail(HttpServletRequest request, ModelAndView mv, BoardVO vo) {
		// ** 조회수 증가
		// => 조건 : 글쓴이의 ID 와 글보는이의 ID (logID) 가 다른 경우
		// 로그인 하지않은 경우도 포함.
		// => 처리 순서 : 증가 후 조회
		// => 증가
		// controller, Java 구문으로 : getCnt() -> setCnt(++getCnt()) -> board Update
		// DAO 에서 sql 구문으로 : board update -> cnt=cnt+1

		// 1. 증가조건 확인
		// => session 에서 logID get
		HttpSession session = request.getSession(false);
		String loginID = null; // 로그인 하지 않음
		if (session != null && session.getAttribute("loginID") != null) {// 로그인 했을시
			loginID = (String) session.getAttribute("loginID");
		}

		// => board , selectOne 으로 ID get
		vo = service.selectOne(vo);
		if (vo != null) {
			// 2. 비교 & 증가
			// => 조건 처리
			mv.addObject("Apple", vo);
			if (!vo.getId().equals(loginID)) {
				vo.setCount(vo.getCount() + 1);
				service.countUp(vo);
			}
			if ("U".equals(request.getParameter("jcode"))) {
				mv.setViewName("counselling/boardUpdateForm");
			} else {
				mv.setViewName("counselling/boardDetail");
			}
		} else {
			mv.addObject("message", "~~ 글번호에 해당하는글이 존재하지 않습니다 ~~");
			mv.setViewName("redirect:qna");
			/*
			 * url 로 전달되는 한글 message 처리 위한 encoding String message =
			 * URLEncoder.encode("~~ 해당하는 글이 없네용 ~~", "UTF-8");
			 * mv.setViewName("redirect:blist?message="+message); // sendRedirect => 메서드 헤더에
			 * throws UnsupportedEncodingException 해야함
			 */
		}
		// redirect 요청시 전달된 message 처리
		// => from mdetail
		/*
		 * if (request.getParameter("message") !=null )
		 * mv.addObject("message",request.getParameter("message"));
		 */
		return mv;
	}

	@RequestMapping(value = "/binsertf")
	public ModelAndView binsertf(ModelAndView mv) {
		mv.setViewName("counselling/boardInsertForm");
		return mv;
	} // binsertf

	@RequestMapping(value = "/binsert")
	public ModelAndView binsert(ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {

		if (service.insert(vo) > 0) {
			// 성공 -> boardList
			rttr.addFlashAttribute("message", "~~ 글등록 성공 ~~");
			mv.setViewName("redirect:qna");
		} else {
			// 실패 -> insertForm
			rttr.addFlashAttribute("message", "~~ 글등록 실패 !!! 다시 하세요 ~~");
			mv.setViewName("counselling/boardInsertForm");
		}
		return mv;
	} // binsert

	// ** 답글등록
	// 1) rinsertForm 출력
	@RequestMapping(value = "/replyinsertf")
	public ModelAndView replyinsertf(ModelAndView mv, BoardVO vo) {
		mv.setViewName("counselling/replyForm");
		return mv;
	} // replyinsertf

	// 2) 답글 저장
	@RequestMapping(value = "/replyinsert")
	public ModelAndView replyinsert(ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {
		// vo 에 담겨있는 Value
		// => id, title, content 저장을위해 필요한 값
		// => root, step, indent 는 부모글(원글)의 value
		// -> 답글의 root 는 원글 root 와 동일
		// -> 답글의 step 은 원글 step+1
		// 기존 답글의 step의 값이 위에서 계산된 step 보다 같거나 큰경우에는
		// 모두 1씩 증가해야함. (sql 에서 처리)

		vo.setStep(vo.getStep() + 1);

		if (service.replyInsert(vo) > 0) {
			// 성공 -> boardList
			rttr.addFlashAttribute("message", "~~ 답글 등록 성공 ~~");
			mv.setViewName("redirect:qna");
		} else {
			// 실패 -> replyForm
			rttr.addFlashAttribute("message", "~~ 답글 등록 실패 !!! 다시 하세요 ~~");
			mv.setViewName("counselling/replyForm");
		}
		return mv;
	} // replyinsert

	@RequestMapping(value = "/boardupdate")
	public ModelAndView boardupdate(ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {
		if (service.update(vo) > 0) {
			rttr.addFlashAttribute("message", "글이 수정되었습니다.");
			mv.setViewName("redirect:bdetail?seq=" + vo.getSeq());
		} else {
			rttr.addFlashAttribute("message", "글 수정에 실패 하셨습니다.");
			mv.setViewName("redirect:bdetail?seq=" + vo.getSeq() + "&jcode=U"); // 컨트롤러를 통해 수정페이지로 다시가라
		}
		return mv;
	} // boardupdate

	@RequestMapping(value = "/boarddelete")
	public ModelAndView boarddelete(ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {
		if (service.delete(vo) > 0) {
			rttr.addFlashAttribute("message", "글이 삭제 되었습니다.");
			mv.setViewName("redirect:qna");
		} else {
			rttr.addFlashAttribute("message", "글 삭제가 올바르게 되지 않았습니다.");
			mv.setViewName("redirect:bdetail?seq=" + vo.getSeq());
		}
		return mv;
	} // boarddelete

	/** --------------------qna 끝-------------------- **/
}
