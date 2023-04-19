package kh.finalproject.sims.user.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.user.model.service.UserBizService;
import kh.finalproject.sims.user.model.service.UserPlanService;
import kh.finalproject.sims.user.model.vo.BizVo;
import kh.finalproject.sims.user.model.vo.PlanVo;
import kh.finalproject.sims.user.model.vo.UserReviewVo;

@Controller
@RequestMapping("/plan")
public class UserPlanController {

	@Autowired
	private UserPlanService planService;
	@Autowired
	private UserBizService bizService;
	
	@GetMapping("/{planNo}")
	public ModelAndView viewPlanDetail(
			ModelAndView mv
			, HttpServletRequest req
			, @PathVariable int planNo
			) {
		
		// 최근 본 요금제 추가
		if(req.getUserPrincipal() != null) {
			Principal prin = req.getUserPrincipal();
			HashMap<String, Object> recentInfo = new HashMap<>();
			recentInfo.put("userId", prin.getName());
			recentInfo.put("planNo", planNo);
			planService.insertRecentInfo(recentInfo);
		}
		//
		
		PlanVo pvo = planService.getPlanByNo(planNo);
		BizVo bvo = bizService.getBizByName(pvo.getBizName());
		List<UserReviewVo> reviewList = bizService.getReviewListById(bvo.getBizId());
		
		mv.addObject("bizNets", bizService.getNetListByBizId(bvo.getBizId()));
		mv.addObject("cntReview", bizService.getCountReviewByBizId(bvo.getBizId()));
		
		mv.addObject("plan", pvo);
		mv.addObject("biz", bvo);
		mv.addObject("reviewList", reviewList);
		
		mv.setViewName("user/plan/detail");
		return mv;
	}
}
