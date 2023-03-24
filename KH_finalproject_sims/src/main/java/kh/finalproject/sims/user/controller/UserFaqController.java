package kh.finalproject.sims.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.user.model.service.UserFaqService;

@RequestMapping("/faq")
@Controller
public class UserFaqController {
	
	@Autowired
	UserFaqService service;
	
	// 질문 목록
	@GetMapping("/faqlist")
	public ModelAndView selectFaqList(ModelAndView mv) {
		mv.addObject("faqlist", service.selectFaqList());
		mv.addObject("qnalist", service.selectQnaList());
		mv.setViewName("user/faqlist");
		
		return mv;
	}
	
	// 자주묻는질문 상세보기
	@GetMapping("/faqread/{faqNo}")
	public ModelAndView readFaq(
			ModelAndView mv, 
			@PathVariable int faqNo
			) {
		mv.addObject("faqcontents", service.selectFaqDetail(faqNo));
		mv.setViewName("user/faqread");
		return mv;
	}
	
	// 문의게시판 질문 상세보기
	@GetMapping("/qnaread/{aqNo}")
	public ModelAndView readQna(
			ModelAndView mv,
			@PathVariable int aqNo
			) {
		service.viewCount(aqNo);
		mv.addObject("qnaquestion", service.selectQnaDetail(aqNo));
		mv.addObject("qnaanswer", service.selectAnsList(aqNo));
		mv.setViewName("user/qnaread");
		return mv;
	}
	
	
}
