package com.ncs.green;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import criteria.Criteria;
import criteria.PageMaker;
import service.ChartService;
import service.GmemberService;
import service.MusicService;
import vo.ChartVO;
import vo.GmemberVO;
import vo.MusicVO;
import vo.MyListVO;

@Controller
public class GmusicController {

	@Autowired
	MusicService service;

	@Autowired
	GmemberService memberservice;

	@Autowired
	ChartService chartService;

	// 장바구니 현재는 최신음악에서 회원등급 c나 vip의 경우에 다운로드를 클릭시 작동하는 컨트롤러이다
	@RequestMapping(value = "/cartView")
	public ModelAndView cartView(HttpServletRequest request, ModelAndView mv) { // 서블릿에 transaction을 적용

		// 파라미터로 값을 받음
		String cartVal = request.getParameter("cartVal");
		System.out.println("************** getParameter cartVal => " + cartVal);
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("loginID");
		String code = request.getParameter("code");
		// 스트링 배열 "," 기준으로 쪼개 담음
		if (cartVal != null && cartVal.length() > 0) {
			String splitcartVal[] = cartVal.split(",");
			int intcartVal[] = new int[splitcartVal.length];

			for (int i = 0; i < splitcartVal.length; i++) {
				intcartVal[i] = Integer.parseInt(splitcartVal[i]);
			}
			// playlist처럼 값을 받아와서 list에 값을 넣어주는방식을 따라함
			List<MusicVO> list = new ArrayList<MusicVO>();
			// 중복을 막기위해 list2를 선언
			List<MusicVO> list2 = new ArrayList<MusicVO>();
			for (int i = 0; i < intcartVal.length; i++) {
				MusicVO vo = new MusicVO();
				vo.setSnum(intcartVal[i]);
				vo = service.selectOne(vo);
				list.add(vo);
			}

			// list에 contains함수를 이용 중복을 제거한뒤 list2에 add한다.
			for (int i = 0; i < intcartVal.length; i++) {
				if (!list2.contains(list.get(i))) {
					list2.add(list.get(i));
				}
			}

			mv.addObject("Banana", list2);
			// list2값넘겨주기

			// intcartVal의 크기 재설정
			intcartVal = new int[list2.size()];

			// list2의 snum을 배열안에 담기
			for (int i = 0; i < intcartVal.length; i++) {
				intcartVal[i] = list2.get(i).getSnum();

			}

			// 아이디에 해당하는 snum 값을 mylist에 담기
			List<MusicVO> myList = service.cartlist(id);
			int myCartVal[] = new int[myList.size()];
			for (int i = 0; i < myList.size(); i++) {
				myCartVal[i] = myList.get(i).getSnum();
			}
			// cart테이블에 내가 가진 곡을 비교하여 없는 값만 나타내기 위한 코드
			int count = 0;
			// 내가 가지고 있는 곡이라면 값이 0으로 대입되고 count된다
			for (int i = 0; i < intcartVal.length; i++) {
				for (int j = 0; j < myCartVal.length; j++) {
					if (intcartVal[i] == myCartVal[j]) {
						intcartVal[i] = 0;
						count++;
					}
				}
			}
			// 내가 가진 곡의 개수
			int myMusic = count;
			// 내가 선택한 곡의 개수(다운로드 클릭시)
			int allMusic = intcartVal.length;
			// 내가 결제해야할 곡의 개수
			int payMusic = intcartVal.length - count;

			mv.addObject("myMusic", myMusic);
			mv.addObject("allMusic", allMusic);
			mv.addObject("price", payMusic * 300);
			// 결제 버튼을 누를시 code값 pay가 들어온다면 실행한다
			GmemberVO vo = new GmemberVO();
			vo.setId(id);
			vo = memberservice.selectOne(vo);
			if ("vvip".equals(vo.getGrade())) {
				mv.addObject("price", 0);
				mv.addObject("myMusic", allMusic);
			}
			if ("pay".equals(code)) {
				if (!"vvip".equals(vo.getGrade())) {
					// intcartVal 배열에 있는 값중 0을 제외한 값을 insert한다 (위쪽부분에서 0은 내가 소유한 곡을 0으로 변환했음)
					for (int i = 0; i < intcartVal.length; i++) {
						if (intcartVal[i] != 0) {
							MyListVO vos = new MyListVO();
							// 해당하는 음악번호와 아이디 값을 넣어준다
							vos.setSnum(intcartVal[i]);
							vos.setId(id);
							service.myListInsert(vos);
							// cmd에 create unique index snum_id on mylist (snum, id);를 적용하고
							// service.myListInsert(vo);가 2번이루어질경우
							// 무결성에 위배되게된다.
							// 이러한경우 에러가 발생하여 아래 코드를 전부 실행 x
							// DB또한 롤백되어 결제또한 실행되지 않는다. (다운로드도 마찬가지)
						}
					}
					// 결제시 내가 가진 포인트가 결제금액과 비교했을때 0보다 작으면 결제가 안되도록 설정
					if (vo != null && vo.getPoint() - (payMusic * 300) > 0) {
						vo.setPoint(vo.getPoint() - (payMusic * 300));
						memberservice.pointChange(vo);
					}
				}
				// 결제후 포인트값을 새로고침해주기 위한 세션값 적용
				request.getSession().setAttribute("loginVO", vo);// 세션 통합 (비밀번호 제외)
				mv.addObject("aaa", 'T');
				mv.setViewName("jsonView");
				return mv;
			}

		}
		/* if(pay코드랑 같이오면 update) */
		request.getSession().setAttribute("cartValSession", cartVal);
		mv.setViewName("payment/cartPage");
		// cartPage는 playList와 비슷한 페이지라 할수있다
		return mv;

	}

	@RequestMapping(value = "/musicCount")
	public void musicCount(HttpServletRequest request, ModelAndView mv, MusicVO vo, ChartVO cvo) {

		vo = service.selectOne(vo); // vo값 불러오기
		vo.setCount(vo.getCount() + 1); // count + 1
		service.musicCount(vo);
		// 일간 count +
		cvo = chartService.dailyOne(cvo); // vo값 불러오기
		cvo.setCount(cvo.getCount() + 1);
		chartService.dailyMusicCount(cvo);

		cvo = chartService.weeklyOne(cvo); // vo값 불러오기
		cvo.setCount(cvo.getCount() + 1);
		chartService.weeklyMusicCount(cvo);

		cvo = chartService.monthlyOne(cvo); // vo값 불러오기
		cvo.setCount(cvo.getCount() + 1);
		chartService.monthlyMusicCount(cvo);
	}

	// ** 최신음악
	@RequestMapping(value = "/musiclist")
	public ModelAndView musiclist(HttpServletRequest request, ModelAndView mv, Criteria cri, PageMaker pageMaker) {
		if ("section1_2".equals(request.getParameter("pagingCode"))
				|| "section1_3".equals(request.getParameter("pagingCode"))) {
			cri.setRowPerPage(4);
		} else {
			cri.setRowPerPage(20);
		}
		cri.setSnoEno();

		List<MusicVO> list = service.releasedateList(cri);
		if (list != null) {
			mv.addObject("Banana", list);
		}
		pageMaker.setCri(cri); // 계산된 cri를 페이지 메이커의 필드변수에 담아줌
		pageMaker.setTotalRow(service.releasedateRowCount()); // 장르 곡목록의 수

		mv.addObject("pageMaker", pageMaker);
		if ("section1_2".equals(request.getParameter("pagingCode"))) {
			mv.setViewName("musicview/ajaxMusicList");
		} else if ("section1_3".equals(request.getParameter("pagingCode"))) {
			mv.setViewName("musicview/ajaxMusicVideo");
		} else {
			mv.setViewName("musicview/musiclist");
		}

		return mv;
	}// musiclist

	/*-------------------------음악 추가 업데이트 삭제-------------------------*/

	// ** 음악추가
	@RequestMapping(value = "/musicinsertf")
	public ModelAndView musicinsertf(ModelAndView mv) {
		mv.setViewName("musicview/musicInsertForm");
		return mv;
	}// musicinsertf

	@RequestMapping(value = "/musicinsert")
	public ModelAndView musicinsert(HttpServletRequest request, ModelAndView mv, MusicVO vo, RedirectAttributes rttr)
			throws IOException {
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
		String downloadPath = request.getRealPath("/");
		String imagePath = request.getRealPath("/");
		System.out.println("realPath_ver01 :" + downloadPath);
		// realPath_ver01->
		// D:\jaepil\MyWork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\gproject\
		// 실습1) ver01
		// realPath =
		// "D:/jaepil/MyWork/gproject/src/main/webapp/resources/albumimage/";

		// 실습2) ver02 (배포환경 or 개발환경)
		if (downloadPath.contains(".eclipse.")) {
			downloadPath = "D:/jaepil/MyWork/gproject/src/main/webapp/resources/music/" + vo.getGenre() + "/";
		} else {
			downloadPath += "resources/music/" + vo.getGenre() + "/";
		}
		System.out.println("downloadPath :" + downloadPath);

		if (imagePath.contains(".eclipse.")) {
			imagePath = "D:/jaepil/MyWork/gproject/src/main/webapp/resources/albumimage/" + vo.getGenre() + "/";
		} else {
			imagePath += "resources/albumimage/" + vo.getGenre() + "/";
		}
		System.out.println("imagePath :" + imagePath);

		// ** 폴더 만들기 (File 클래스활용)
		// => 저장 경로에 폴더가 없는 경우 만들어 준다
		File f1 = new File(downloadPath); // 매개변수로 지정된 정보에 대한 File 객체 생성
		System.out.println(" 생성직후 f1=> " + f1);
		if (!f1.exists())
			f1.mkdir();

		File f2 = new File(imagePath); // 매개변수로 지정된 정보에 대한 File 객체 생성
		System.out.println(" 생성직후 f2=> " + f2);
		if (!f2.exists())
			f2.mkdir();
		// realPath 디렉터리가 존재하는지 검사 (uploadImage 폴더 존재 확인)
		// => 존재하지 않으면 디렉토리 생성

		// ** MultipartFile
		// => 업로드한 파일에 대한 모든 정보를 가지고 있으며 이의 처리를 위한 메서드를 제공한다.
		// String getOriginalFilename(), void transferTo(File destFile),
		// boolean isEmpty()
		MultipartFile downloadfilef = null;
		MultipartFile imagefilef = null;
		// => 기본 Image 설정
		String musicfile1, musicfile2 = null;
		String imagefile1, imagefile2 = null;

		// 전송된 음악 파일이 있는지 확인
		downloadfilef = vo.getDownloadfilef();
		System.out.println("vo.getDownloadfilef() => " + vo.getDownloadfilef());
		if (downloadfilef != null && !downloadfilef.isEmpty()) {
			musicfile1 = downloadPath + downloadfilef.getOriginalFilename();
			// 드라이브에 저장되는 실제 경로와 화일명
			downloadfilef.transferTo(new File(musicfile1)); // file 붙여넣기
			musicfile2 = "resources/music/" + vo.getGenre() + "/" + downloadfilef.getOriginalFilename();
		}
		vo.setDownloadfile(musicfile2);
		System.out.println("vo.getDownloadfile() => " + vo.getDownloadfile());

		// 전송된 사진 파일이 있는지 확인
		imagefilef = vo.getImagefilef();
		System.out.println("vo.getImagefilef() => " + vo.getImagefilef());
		if (imagefilef != null && !imagefilef.isEmpty()) {
			imagefile1 = imagePath + imagefilef.getOriginalFilename();
			// 드라이브에 저장되는 실제 경로와 화일명
			imagefilef.transferTo(new File(imagefile1)); // file 붙여넣기
			imagefile2 = "resources/albumimage/" + vo.getGenre() + "/" + imagefilef.getOriginalFilename();
		}
		vo.setImage(imagefile2);
		System.out.println("vo.getImage() => " + vo.getImage());

		// ** 유튜브링크 처리
		String musicurl = "https://www.youtube.com/embed/" + vo.getMusicurl();
		System.out.println("musicurl => " + musicurl);
		vo.setMusicurl(musicurl);

		int cnt = service.insert(vo);
		if (cnt > 0) {

			rttr.addFlashAttribute("message", "~~ 음악등록 성공 ~~");
			mv.setViewName("redirect:musiclist");
		} else {
			rttr.addFlashAttribute("message", "~~ 음악등록 실패 !!! 다시 하세요 ~~");
			mv.setViewName("musicview/musicInsertForm");
		}
		return mv;
	}// musicinsert

	@RequestMapping(value = "/musicupdatef")
	public ModelAndView musicupdatef(ModelAndView mv, MusicVO vo, RedirectAttributes rttr) {
		vo = service.selectOne(vo);
		if (vo != null) {
			mv.addObject("Apple", vo);
			mv.setViewName("musicview/musicUpdateForm");
		} else {
			mv.addObject("message", "~~ 번호에 해당하는 곡이 존재하지 않습니다 ~~");
			mv.setViewName("redirect:musiclist");
		}
		return mv;
	} // musicupdatef

	@RequestMapping(value = "/musicupdate")
	public ModelAndView musicupdate(HttpServletRequest request, ModelAndView mv, MusicVO vo, RedirectAttributes rttr)
			throws IOException {
		String downloadPath = request.getRealPath("/");
		String imagePath = request.getRealPath("/");
		System.out.println("realPath_ver01 :" + downloadPath);

		if (downloadPath.contains(".eclipse.")) {
			downloadPath = "D:/jaepil/MyWork/gproject/src/main/webapp/resources/music/" + vo.getGenre() + "/";
		} else {
			downloadPath += "resources/music/" + vo.getGenre() + "/";
		}
		System.out.println("downloadPath :" + downloadPath);

		if (imagePath.contains(".eclipse.")) {
			imagePath = "D:/jaepil/MyWork/gproject/src/main/webapp/resources/albumimage/" + vo.getGenre() + "/";
		} else {
			imagePath += "resources/albumimage/" + vo.getGenre() + "/";
		}
		System.out.println("imagePath :" + imagePath);

		// ** 폴더 만들기 (File 클래스활용)
		// => 저장 경로에 폴더가 없는 경우 만들어 준다
		File f1 = new File(downloadPath); // 매개변수로 지정된 정보에 대한 File 객체 생성
		System.out.println(" 생성직후 f1=> " + f1);
		if (!f1.exists())
			f1.mkdir();

		File f2 = new File(imagePath); // 매개변수로 지정된 정보에 대한 File 객체 생성
		System.out.println(" 생성직후 f2=> " + f2);
		if (!f2.exists())
			f2.mkdir();
		// realPath 디렉터리가 존재하는지 검사 (uploadImage 폴더 존재 확인)
		// => 존재하지 않으면 디렉토리 생성

		// ** MultipartFile
		// => 업로드한 파일에 대한 모든 정보를 가지고 있으며 이의 처리를 위한 메서드를 제공한다.
		// String getOriginalFilename(), void transferTo(File destFile),
		// boolean isEmpty()
		MultipartFile downloadfilef = null;
		MultipartFile imagefilef = null;
		// => 기본 Image 설정
		String musicfile1, musicfile2 = null;
		String imagefile1, imagefile2 = null;

		// 전송된 음악 파일이 있는지 확인
		downloadfilef = vo.getDownloadfilef();
		System.out.println("vo.getDownloadfilef() => " + vo.getDownloadfilef());
		if (downloadfilef != null && !downloadfilef.isEmpty()) {
			musicfile1 = downloadPath + downloadfilef.getOriginalFilename();
			// 드라이브에 저장되는 실제 경로와 화일명
			downloadfilef.transferTo(new File(musicfile1)); // file 붙여넣기
			musicfile2 = "resources/music/" + vo.getGenre() + "/" + downloadfilef.getOriginalFilename();
		}
		vo.setDownloadfile(musicfile2);
		System.out.println("vo.getDownloadfile() => " + vo.getDownloadfile());

		// 전송된 사진 파일이 있는지 확인
		imagefilef = vo.getImagefilef();
		System.out.println("vo.getImagefilef() => " + vo.getImagefilef());
		if (imagefilef != null && !imagefilef.isEmpty()) {
			imagefile1 = imagePath + imagefilef.getOriginalFilename();
			// 드라이브에 저장되는 실제 경로와 화일명
			imagefilef.transferTo(new File(imagefile1)); // file 붙여넣기
			imagefile2 = "resources/albumimage/" + vo.getGenre() + "/" + imagefilef.getOriginalFilename();
		}
		vo.setImage(imagefile2);
		System.out.println("vo.getImage() => " + vo.getImage());

		// ** 유튜브링크 처리
		String musicurl = "https://www.youtube.com/embed/" + vo.getMusicurl();
		System.out.println("musicurl => " + musicurl);
		vo.setMusicurl(musicurl);

		if (service.update(vo) > 0) {
			rttr.addFlashAttribute("message", vo.getSnum() + "번 곡이 수정되었습니다.");
			mv.setViewName("redirect:musiclist");
		} else {
			rttr.addFlashAttribute("message", "수정에 실패 하셨습니다.");
			mv.setViewName("redirect:musicupdatef?snum=" + vo.getSnum()); // 컨트롤러를 통해 수정페이지로 다시가라
		}
		return mv;
	} // musicupdate

	@RequestMapping(value = "/musicdelete")
	public ModelAndView musicdelete(ModelAndView mv, MusicVO vo, RedirectAttributes rttr) {
		if (service.delete(vo) > 0) {
			rttr.addFlashAttribute("message", vo.getSnum() + "번 곡이 삭제 되었습니다.");
			mv.setViewName("redirect:musiclist");
		} else {
			rttr.addFlashAttribute("message", "삭제가 올바르게 되지 않았습니다.");
			mv.setViewName("redirect:musiclist");
		}
		return mv;
	} // musicdelete

	/*-------------------------음악 추가 업데이트 삭제-------------------------*/

	// ** 장르음악
	@RequestMapping(value = "/genrelist")
	public ModelAndView genrelist(HttpServletRequest request, ModelAndView mv, Criteria cri, PageMaker pageMaker,
			MusicVO vo) {
		System.out.println("***********Test " + vo.getGenre()); // vo엔 자동으로 장르만 들어와있음.

		if ("section1_1".equals(request.getParameter("pagingCode"))) {
			cri.setRowPerPage(4);
		} else {
			cri.setRowPerPage(10); // 한 페이지당 20곡씩 출력
		}
		cri.setSnoEno();
		cri.setGenre(vo.getGenre());

		List<MusicVO> list = service.genreList(cri); // 장르에 해당하는 곡목록이 들어옴
		if (list != null) {
			mv.addObject("Banana", list);
		}
		pageMaker.setCri(cri); // 계산된 cri를 페이지 메이커의 필드변수에 담아줌
		pageMaker.setTotalRow(service.genreRowCount(vo)); // 장르 곡목록의 수

		mv.addObject("pageMaker", pageMaker);
		mv.addObject("musicGenre", vo.getGenre());
		if ("section1_1".equals(request.getParameter("pagingCode"))) {
			mv.setViewName("musicview/ajaxGenreList");
		} else {
			mv.setViewName("musicview/genrelist");
		}
		return mv;
	}// genrelist

	@RequestMapping(value = "/playlist")
	public ModelAndView playlist(HttpServletRequest request, ModelAndView mv) {
		// 파라미터로 값을 받음
		String snumVal = request.getParameter("snumVal");

		System.out.println("************** getParameter snumVal => " + snumVal);

		// 스트링 배열 "," 기준으로 쪼개 담음
		if (snumVal != null && snumVal.length() > 0) {
			String splitsnumVal[] = snumVal.split(",");

			if ("U".equals(request.getParameter("jcode"))) {
				// 셔플 함수 참고
				// https://zetawiki.com/wiki/%ED%95%A8%EC%88%98_shuffle()
				List<String> list = Arrays.asList(splitsnumVal);
				Collections.shuffle(list);
				snumVal = "";
				for (int i = 0; i < splitsnumVal.length; i++) {
					System.out.println(list.get(i));
					splitsnumVal[i] = list.get(i);

					snumVal += list.get(i) + ",";
				}
			}

			// sql snum 형식이 int 이기 때문에 int 배열에 다시 담음
			int intsnumVal[] = new int[splitsnumVal.length];

			for (int i = 0; i < splitsnumVal.length; i++) {
				intsnumVal[i] = Integer.parseInt(splitsnumVal[i]);
			}

			List<MusicVO> list = new ArrayList<MusicVO>();
			for (int i = 0; i < intsnumVal.length; i++) {
				MusicVO vo = new MusicVO();
				vo.setSnum(intsnumVal[i]);
				vo = service.selectOne(vo);
				if (vo.getLyrics() != null && vo.getLyrics().length() > 0) {
					vo.setLyrics(vo.getLyrics().replace("\"", "&quot;"));
				}
				list.add(vo);
			}

			mv.addObject("Banana", list);
		}
		request.getSession().setAttribute("snumValSession", snumVal);
		mv.setViewName("musicview/playlist");
		return mv;
	} // playlist

	// ** 가사 보기
	@RequestMapping(value = "/lyricsview")
	public ModelAndView lyricsview(HttpServletRequest request, ModelAndView mv, MusicVO vo) {

		vo = service.selectOne(vo);
		if (vo != null) {
			mv.addObject("Apple", vo);
		} else {
			mv.addObject("message", "~~ 해당 곡이 존재하지 않습니다 ~~");
		}
		mv.setViewName("musicview/lyrics");

		return mv;

	} // lyricsview

	// ** Image DownLoad
	@RequestMapping(value = "/dnload")
	public ModelAndView dnload(ModelAndView mv, @RequestParam("dnfile") String dnfile) {
		dnfile = "C:/NamCheolWoo/gproject/src/main/webapp/" + dnfile;
		System.out.println("** dnfile => " + dnfile);
		File file = new File(dnfile);

		mv.addObject("downloadFile", file);
		mv.setViewName("download");

		// 일반적인 경우 views/download.jsp 를 찾음, 그러나 이 경우에는 아님

		// viewresolver bean 체크하기 기본적으로 viewresolver
		// => servlet-context.xzml 에 설정하는 view 클래스 (DownloadView.java) 의
		// id 와 동일 해야함.
		return mv;

		/*
		 * 위 50~51 행은 아래처럼 작성할 수도 있다. return new ModelAndView("download",
		 * "downloadFile", file);
		 * 
		 * => 생성자 참고 public ModelAndView(View view, String modelName, Object
		 * modelObject) { this.view = view; addObject(modelName, modelObject); }
		 */
	} // dnload

	/*--------------------------------------------------검색--------------------------------------------*/
	@RequestMapping(value = "/mSearch") // 통합검색
	public ModelAndView mSearch(ModelAndView mv, Criteria cri, PageMaker pageMaker) {
		System.out.println("들어오는 서치타입은? ********* >>>" + cri.getSearchType());
		System.out.println("들어오는 키워드은? ********* >>>" + cri.getKeyword());
		cri.setSnoEno();

		mv.addObject("searchType", cri.getSearchType());
		mv.addObject("UserKeyword", cri.getKeyword().replace("\"", "&quot;"));
		cri.setKeyword(cri.getKeyword().replace(" ", ""));

		if ("all".equals(cri.getSearchType())) {

			cri.setSearchType("sname");
			List<MusicVO> list1 = service.searchSnameList(cri);
			mv.addObject("Aanana", list1);
			mv.addObject("Aanana2", service.searchRowCountSname(cri));

			cri.setSearchType("singername");
			List<MusicVO> list2 = service.searchSnameList(cri);
			mv.addObject("Banana", list2);
			mv.addObject("Banana2", service.searchRowCountSname(cri));

			cri.setSearchType("lyrics");
			List<MusicVO> list3 = service.searchSnameList(cri);
			mv.addObject("Canana", list3);
			mv.addObject("Canana2", service.searchRowCountSname(cri));
			cri.setSearchType("all");
		} else {
			mv.addObject("Apple", service.searchSnameList(cri));
			mv.addObject("Apple2", service.searchRowCountSname(cri));
		}

		pageMaker.setCri(cri);
		pageMaker.setTotalRow(service.searchRowCountSname(cri));

		mv.addObject("pageMaker", pageMaker);

		if ("all".equals(cri.getSearchType())) {
			mv.setViewName("musicview/musicSearch");
		} else {
			mv.setViewName("musicview/searchDetail");
		}

		return mv;
	} // mSearch

	/*------------------------------------------------------------------------------------------*/

}
