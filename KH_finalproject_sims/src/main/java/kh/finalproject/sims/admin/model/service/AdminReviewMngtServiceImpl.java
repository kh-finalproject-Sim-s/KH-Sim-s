package kh.finalproject.sims.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminReviewMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.common.page.Search;

@Service
// 리뷰
public class AdminReviewMngtServiceImpl implements AdminReviewMngtService{
	@Autowired
	AdminReviewMngtDao dao;
	
	// 목록
	@Override
	public List<AdminReviewMngtVo> selectReviewList() {
		return dao.selectReviewList();
	}
	
	// 검색
	@Override
	public List<AdminReviewMngtVo> selectSearchReviewList(AdminReviewMngtVo vo) {
		return dao.selectSearchReviewList(vo);
	}
	
	// 삭제
	@Override
	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}
	
	// 상세내용
	@Override
	public AdminReviewMngtVo selectReviewDetail(int reviewNo) {
		return dao.selectReviewDetail(reviewNo);
	}
	
	// 페이징 search
	@Override
	public Search getPage(int pNum, int cnt, String keyword, String searchType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		List<AdminReviewMngtVo> dataList = dao.searchReviewPageList(map); // 한 페이지의 글 목록
		
		int totalRowCount = dao.getSearchReviewListCnt(); // 글목록 총 개수를 알아야한다.
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod; // 그래야지만 총 페이지수를 구할수있으니깐!
		
		Search search = new Search(dataList, pNum, pageCount, cnt, 5, keyword, searchType); // 페이징 처리해달라고함.
		
		return search; // 반환받은 결과 리턴
	}



}
