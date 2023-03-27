package kh.finalproject.sims.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import kh.finalproject.sims.admin.model.service.AdminUserMngtService;

import kh.finalproject.sims.admin.model.vo.AdminUserMngtVo;


@RequestMapping("/adminUser") //admin으로 변경해주세요.
@Controller
public class AdminUserMngtController {
	
	@Autowired
	private AdminUserMngtService service;
	
	//관리자의 사용자 관리 리스트로 이동
	@RequestMapping(value="/userList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectUserList(ModelAndView mv, AdminUserMngtVo vo) {
		mv.addObject("userList", service.selectUserList(vo));
		mv.setViewName("admin/user/userList");
		return mv;
	}
	
	//

}