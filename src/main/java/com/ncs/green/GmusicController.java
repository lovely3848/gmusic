package com.ncs.green;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.MusicService;
import vo.MusicVO;

@Controller
public class GmusicController {

	@Autowired
	MusicService service;

	@RequestMapping(value = "/musicCount")
	public void musicCount(HttpServletRequest request, ModelAndView mv, MusicVO vo) {
		vo = service.selectOne(vo);
		vo.setCount(vo.getCount() + 1);
		service.musicCount(vo);

	}

	// musiclist 최신음악 페이지
	@RequestMapping(value = "/musiclist")
	public ModelAndView musiclist(ModelAndView mv) {

		List<MusicVO> list = service.selectList();

		if (list != null) {
			mv.addObject("Banana", list);
		}
		mv.setViewName("musicview/musiclist");
		return mv;
	} // musiclist

	// playlist 뮤직 플레이 리스트
	@RequestMapping(value = "/playlist")
	public ModelAndView playlist(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		// 파라미터로 값을 받음
		String snumVal = request.getParameter("snumVal");
		request.getSession().setAttribute("snumValSession", snumVal);

		MusicVO vo = new MusicVO();

		// 스트링 배열 "," 기준으로 쪼개 담음
		String splitsnumVal[] = snumVal.split(",");

		// sql snum 형식이 int 이기 때문에 int 배열에 다시 담음
		int intsnumVal[] = new int[splitsnumVal.length];

		for (int i = 0; i < splitsnumVal.length; i++) {
			intsnumVal[i] = Integer.parseInt(splitsnumVal[i]);
		}

		List<MusicVO> list = new ArrayList<MusicVO>();
		for (int i = 0; i < intsnumVal.length; i++) {
			vo.setSnum(intsnumVal[i]);
			list.add(service.selectOne(vo));
		}
		if (list != null) {
			if ("U".equals(request.getParameter("jcode"))) {
				// 셔플 함수 참고
				// https://zetawiki.com/wiki/%ED%95%A8%EC%88%98_shuffle()
				Collections.shuffle(list);
			}
			mv.addObject("Banana", list);
			mv.setViewName("musicview/playlist");
		}

		return mv;
	} // playlist

	// ** Image DownLoad
	@RequestMapping(value = "/dnload")
	public ModelAndView dnload(ModelAndView mv, @RequestParam("dnfile") String dnfile) {
		dnfile = "D:/jaepil/MyWork/gproject/src/main/webapp/" + dnfile;
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
}
