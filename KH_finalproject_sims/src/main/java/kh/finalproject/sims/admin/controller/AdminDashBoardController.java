package kh.finalproject.sims.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.finalproject.sims.admin.model.service.AdminDashBoardService;
import kh.finalproject.sims.admin.model.vo.AdminDashBoardVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminStatisticsVo;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

@RequestMapping("/admin")
@Controller
public class AdminDashBoardController {
	
	@Autowired
	AdminDashBoardService service;
	
	@GetMapping("/dashboard") 
		public ModelAndView selectDashBoard(ModelAndView mv) throws Exception {
		List<AdminReviewMngtVo> bizReviewList = service.selectDashboardBizReview(); // 리뷰 리스트
		List<AdminQnaMngtVo> qnaList = service.selectDashBoardQna(); // 질문/답변 리스트
		List<AdminReviewMngtVo> reviewReportList = service.selectDashBoardReviewReport(); // 신고 리스트
		
		int planOrderCount = service.selectDashBoardPlanOrderCount(); // 가입자 수
		int bizWriteCount = service.selectDashBoardBizWriteCount();	// 통신사 신청 수
		int bizTotalCount = service.selectDashBoardBizTotalCount(); // 통신사 총 등록 수
		
		mv.addObject("bizReviewList", bizReviewList);
		mv.addObject("qnaList", qnaList);
		mv.addObject("reviewReportList", reviewReportList);
		mv.addObject("planOrderCount", planOrderCount); // 가입자 수를 뷰에 전달
		mv.addObject("bizWriteCount", bizWriteCount); // 통신사 신청 수를 뷰에 전달
		mv.addObject("bizTotalCount", bizTotalCount); // 통신사 총 등록 수를 뷰에 전달 
		
		mv.setViewName("admin/dashboard");
		return mv;		
		}
	
	// 일별 가입자 수
	@ResponseBody
	@PostMapping("/dashBoardDailyTotalUserWriteCount") 
	public String selectDashBoardDailyTotalUserWriteCount (
			) throws Exception {
		List<AdminDashBoardVo> chartList = service.selectDashBoardDailyTotalUserWriteCount(); // 차트 리스트
		return new Gson().toJson(chartList);
	}
		
}





