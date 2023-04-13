package kh.finalproject.sims.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.user.model.dao.UserMyPageDao;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Service
public class UserMyPageServiceImpl implements UserMyPageService {

	@Autowired
	private UserMyPageDao dao;
		
	// 계정 탈퇴
	@Override
	public int updateDisable(String id) {
		return dao.updateDisable(id);
	}

	// 유저 정보 가져오기
	@Override
	public UserMemberVo selectMyPageInfo(String id) {
		return dao.selectMyPageInfo(id);
	}

	// 유저 정보 수정
	@Override
	@Transactional
	public void updateMyPageModify(MemberVo memVo, UserMemberVo userVo) {
		int result = dao.changePw(memVo);
		if(result == 1) {
			dao.updateMyPageModify(userVo);
		}
	}

	// 공지사항 리스트
	@Override
	public List<AdminNoticeMngtVo> selectNoticeList() {
		return dao.selectNoticeList();
	}

	// 공지사항 내용
	@Override
	public AdminNoticeMngtVo selectNoticeDetail(int number) {
		return dao.selectNoticeDetail(number);
	}

	// 리뷰 작성할 가입한 요금제 리스트
	@Override
	public List<BizApplyVo> selectReviewList(String userId) {
		return dao.selectReviewList(userId);
	}
	
}
