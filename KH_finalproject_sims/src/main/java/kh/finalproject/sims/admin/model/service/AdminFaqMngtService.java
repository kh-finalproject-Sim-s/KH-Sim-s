package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.common.page.Search;

// 자주묻는질문
public interface AdminFaqMngtService {
	
	// 목록보기
	public List<AdminFaqVo> selectFaqList() throws Exception;
	
	// 상세보기
	public AdminFaqVo selectFaqDetail(int faqNo) throws Exception;	
	
	// 작성하기
	public int insertFaqWrite(AdminFaqVo vo) throws Exception;
	
	// 수정하기
	public int selectFaqModify(AdminFaqVo vo) throws Exception;
	
	// 삭제하기
	public int deleteFaq(int faqNo) throws Exception;
	
	// 검색
	public List<AdminFaqVo> selectSearchFaqList(AdminFaqVo vo) throws Exception;
	
	// 페이징 search
	public Search getPage(int pNum, int cnt, String keyword, String searchType) throws Exception;
}
