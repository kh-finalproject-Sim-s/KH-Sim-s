package kh.finalproject.sims.user.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalproject.sims.common.page.Search;
import kh.finalproject.sims.user.model.dao.UserFaqDao;
import kh.finalproject.sims.user.model.vo.UserAnsVo;
import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;
import kh.finalproject.sims.user.model.vo.UserRplVo;

@Service
public class UserFaqServiceImpl implements UserFaqService {
	
	@Autowired
	UserFaqDao dao;
	
	// 자주묻는질문 목록/조회
	@Override
	public List<UserFaqVo> selectFaqList() throws Exception {
		return dao.selectFaqList();
	}
	
	@Override
	public UserFaqVo selectFaqDetail(int faqNo) throws Exception {
		return dao.selectFaqDetail(faqNo);
	}
	

	// 질문 조회/작성/삭제/수정
	@Override
	public UserQnaVo selectQnaDetail(int aqNo) throws Exception {
		return dao.selectQnaDetail(aqNo);
	}

	@Override
	public void insertQna(UserQnaVo vo) throws Exception {
		dao.insertQna(vo);
	}

	@Override
	public int deleteQna(int aqNo) throws Exception {
		dao.deleteQnaByAns(aqNo);
		return dao.deleteQna(aqNo);
	}

	@Override
	public int updateQna(UserQnaVo vo) throws Exception {
		return dao.updateQna(vo);
	}
	
	// 답변 목록/조회/작성/삭제/수정
	@Override
	public List<UserAnsVo> selectAnsList(int aqNo) throws Exception {
		return dao.selectAnsList(aqNo);
	}
	
	@Override
	public UserAnsVo getAnsByNo(int aaNo) throws Exception {
		return dao.getAnsByNo(aaNo);
	}

	@Override
	@Transactional
	public int insertAnswer(int aqNo, UserAnsVo vo) throws Exception {
		return dao.insertAnswer(aqNo, vo);
	}
	
	@Override
	@Transactional
	public int deleteAns(int aaNo) throws Exception {
		return dao.deleteAns(aaNo);
	}

	@Override
	@Transactional
	public boolean updateAns(UserAnsVo vo) throws Exception {
		int count = dao.updateAns(vo);
		return count > 0;
	}
	
	// 댓글 조회/작성/삭제/수정
	@Override
	public UserRplVo getRplByNo(int rplNo) throws Exception {
		return dao.getRplByNo(rplNo);
	}
	@Override
	@Transactional
	public int insertReply(int aaNo, UserRplVo vo) throws Exception {
		return dao.insertReply(aaNo, vo);
	}
	@Override
	@Transactional
	public boolean deleteRpl(int rplNo) throws Exception {
		return dao.deleteRpl(rplNo) > 0;
	}
	@Override
	@Transactional
	public int updateRpl(UserRplVo vo) throws Exception {
		return dao.updateRpl(vo);
	}

	// 아이디로 조회한 질문/답변 목록
	@Override
	public List<UserQnaVo> selectMyQnaList(String username) throws Exception {
		return dao.selectMyQnaList(username);
	}

	@Override
	public List<UserAnsVo> selectMyAnsList(String username) throws Exception {
		return dao.selectMyAnsList(username);
	}
	
	// 조회수 증가
	@Override
	public void viewCount(int aqNo) throws Exception {
		dao.viewCount(aqNo);
	}

	// 답변수 -1/+1
	@Override
	@Transactional
	public boolean deAnswers(int aqNo) throws Exception {
		return dao.deAnswers(aqNo) > 0;
	}
	
	@Override
	@Transactional
	public boolean upAnswers(int aqNo) throws Exception {
	    int count = dao.upAnswers(aqNo);
	    return count > 0;
	}

	@Override
	public Search getPage(int pNum, int cnt, String searchType, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);	
		map.put("searchType",searchType);
		map.put("keyword",keyword);

		Map<String, String> mapCnt = new HashMap<String, String>();
		mapCnt.put("searchType", searchType);
		mapCnt.put("keyword", keyword);

		int totalRowCount = dao.getSearchListCount(mapCnt);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;

		List<UserQnaVo>data = dao.searchList(map);
		Search search = new Search(data, pNum, pageCount, cnt, 5, searchType, keyword );
		return search;
	}

	@Override
	public int getSearchListCount(String searchType, String keyword) throws Exception {
		Map<String, String> mapCnt = new HashMap<String, String>();
		mapCnt.put("searchType", searchType);
		mapCnt.put("keyword", keyword);
		System.out.println("*********mapCnt: " + mapCnt);
		return dao.getSearchListCount(mapCnt);
	}

}
