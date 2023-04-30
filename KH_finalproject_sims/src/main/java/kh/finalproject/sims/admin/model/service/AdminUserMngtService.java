package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminUserMngtVo;
import kh.finalproject.sims.common.page.Search;

public interface AdminUserMngtService {
	
	//관리자의 사용자 관리 리스트
	public Search selectUserList(int pNum, int cnt, String searchUserId, String searchUserName, String searchRadioVal) throws Exception;

	//관리자의 사용자 관리 상세정보/수정페이지 호출
	public AdminUserMngtVo selectUserDetail(String userId);

	//관리자의 사용자 관리 수정 
	public int saveUserModify(AdminUserMngtVo vo);

	/*
	 * //리뷰에 나올 가입한 요금제 개수 public int selectOrderListCount(String userId);
	 */

	
	//가입한 요금제 개수
	public int selectMyPlanListCountAdmin(String userId);
	  
	//최근 본 요금제 개수 
	/* public int selectRecentListCount(String userId); */
	  
	//찜한 요금제 개수 
	/* public int selectLikeListCount(String userId); */
	 
	
	

}
