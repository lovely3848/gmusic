package com.ncs.green;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import criteria.Criteria;
import criteria.PageMaker;
import service.ChartService;
import service.MusicService;
import vo.MusicVO;

@Controller
public class HomeController {

	@Autowired
	MusicService service;

	@Autowired
	ChartService chartService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);

		// redirect 로 전달된 message 처리
		if (request.getParameter("message") != null)
			request.setAttribute("message", request.getParameter("message"));

		/*
		 * List<MusicVO> list = service.selectList(); if ( list != null) {
		 * mv.addObject("Banana", list); }else { mv.addObject("message","music Test"); }
		 * mv.setViewName("/home"); // forward
		 */
		return "home";
	} // home

	// *** Ajax Test
	@RequestMapping(value = "/atestf")
	public ModelAndView atestf(ModelAndView mv) {
		mv.setViewName("ajaxTest/axTestForm");
		return mv;
	}

	@RequestMapping(value = "/topmenu")
	public ModelAndView topmenu(ModelAndView mv) {
		mv.setViewName("nav/topmenu");
		return mv;
	}

	// *** Exception Test
	@RequestMapping(value = "/etest")
	public ModelAndView etest(ModelAndView mv) {
		// ** ArithmeticException
		// => Exception 적용 X
		// => web.xml 적용
		// => Spring 의 "exceptionResolver" 적용
		// int i =100/0 ; // by Zero

		double d = 100.0 % 0.0;
		// 실수형 연산에서는 Exception 발생 않음 : NaN, Infinity
		System.out.println("** ArithmeticException Test => " + d);

		// ** IllegalArgumentException
		String s = "123";
		int i = 100;
		i += Integer.parseInt(s);
		System.out.println("** IllegalArgumentException Test => " + i);

		// ** NullPointerException
		s = null;
		// if (s.equals("test")) {
		// 예방 코드
		if ("test".equals(s)) {
			System.out.println("** NullPointerException Test => " + s);
		} else
			System.out.println("** NullPointerException Test => 예방");

		// ** defaultErrorView Test
		String[] city = { "서울", "성남", "용인" };
		System.out.println("** defaultErrorView Test => " + city[3]);
		// java.lang.ArrayIndexOutOfBoundsException : xml 에 정의하지 않음
		mv.setViewName("home");
		return mv;
	}

	@RequestMapping(value = "/termsp")
	public ModelAndView termsp(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("footer/termsp");
		return mv;
	}

	@RequestMapping(value = "/introcompany")
	public ModelAndView introcompany(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("footer/introcompany");
		return mv;
	}

	@RequestMapping(value = "/privacy")
	public ModelAndView privacy(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("footer/privacy");
		return mv;
	}

	@RequestMapping(value = "/youth")
	public ModelAndView youth(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("footer/youth");
		return mv;
	}

	@RequestMapping(value = "/chart")
	public ModelAndView chart(ModelAndView mv, HttpServletRequest request, Criteria cri, PageMaker pageMaker,
			MusicVO vo) {

		String part = request.getParameter("part"); // 단순 페이징 스위치용입니다 topmaue에서 값을 넘겨 구분하도록 만든겁니다
		// daily chart => 값이 daily week chart => week month chart =
		String ajax = request.getParameter("ajax");
		cri.setSnoEno();
		if (part != null && part != "") {
			mv.addObject("Banana", chartService.selectdailyRank(cri));
			if (part.equals("WEEKLY")) {
				mv.addObject("Banana", chartService.selectweeklyRank(cri));
			}
			if (part.equals("MONTHLY")) {
				mv.addObject("Banana", chartService.selectmonthlyRank(cri));
			}
			mv.setViewName("chart/chartPage");
			// 여기는 chart page로 이동하는곳입니다.
		} else if (ajax != null && ajax != "") {
			mv.addObject("Banana", chartService.selectdailyRank(cri));
			mv.addObject("message", "DAILY");
			if (ajax.equals("WEEKLYAJAX")) {
				mv.addObject("Banana", chartService.selectweeklyRank(cri));
				mv.addObject("message", "WEEKLY");
			}
			if (ajax.equals("MONTHLYAJAX")) {
				mv.addObject("Banana", chartService.selectmonthlyRank(cri));
				mv.addObject("message", "MONTHLY");
			}
			mv.setViewName("chart/chart");
			// 여기는 home 실행시 ajax로 띄우는 곳입니다.
		}
		pageMaker.setCri(cri);
		pageMaker.setTotalRow(chartService.rowCount(cri));
		mv.addObject("pageMaker", pageMaker);
		mv.addObject("part", part);
		return mv;
	}// 차트 컨트롤러입니다.

} // class
