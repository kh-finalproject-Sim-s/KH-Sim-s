package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.xml.SqlXmlValue;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminDashBoardVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

@Repository
public class AdminDashBoardDao {
	@Autowired
	SqlSession sqlSesson;
	
	// 리뷰 리스트
	public List<AdminReviewMngtVo> selectDashboardBizReview() {
		return sqlSesson.selectList("admin.selectDashboardBizReview");
	}
	
	// 질문/답변 리스트
	public List<AdminQnaMngtVo> selectDashBoardQna() {
		return sqlSesson.selectList("admin.selectDashBoardQna");
	}
	
	// 신고 리스트
	public List<AdminReviewMngtVo> selectDashBoardReviewReport() {
		return sqlSesson.selectList("admin.selectDashBoardReviewReport");
	}
	
	// 가입자 수
	public int selectDashBoardPlanOrderCount() {
		return sqlSesson.selectOne("admin.selectDashBoardPlanOrderCount");
	}
	
	// 통신사 신청 수
	public int selectDashBoardBizWriteCount() {
		return sqlSesson.selectOne("admin.selectDashBoardBizWriteCount");
	}
	
	// 통신사 총 등록 수
	public int selectDashBoardBizTotalCount() {
		return sqlSesson.selectOne("admin.selectDashBoardBizTotalCount");
	}
	
	// 요금제별 가입신청 수
	public List<AdminDashBoardVo> selectDashBoardPlanOrderChart() {
		return sqlSesson.selectList("admin.selectDashBoardPlanOrderChart");
	}
}