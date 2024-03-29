package kh.finalproject.sims.biz.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizApplyMngtDao;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.common.page.Paging;
import kh.finalproject.sims.common.page.Search;

@Service
public class BizApplyMngtServiceImpl implements BizApplyMngtService {

	@Autowired
	public BizApplyMngtDao dao;

	@Override
	public BizApplyVo selectApplyDetailUser(int orderNo) throws Exception {
		return dao.selectApplyDetailUser(orderNo);
	}

	@Override
	public BizApplyVo selectApplyDetailPlan(int orderNo)throws Exception {
		return dao.selectApplyDetailPlan(orderNo);
	}

	@Override
	public int updateApproveStatus(int orderNo, String bizid)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNo", orderNo);
		map.put("bizid", bizid);

		return dao.updateApproveStatus(map);
	}

	@Override
	public int updateHoldStatus(int orderNo, String bizid)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNo", orderNo);
		map.put("bizid", bizid);
		
		return dao.updateHoldStatus(map);
	}

	@Override
	public List<BizApplyVo> selectBizPlanApplyList(String bizid) throws Exception{
		return dao.selectBizPlanApplyList(bizid);
	}

	@Override
	public Paging getPage(String bizid, int pNum, int cnt) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);	
		map.put("bizid",bizid);
		
		int totalRowCount = dao.getApplyListCnt(bizid);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		
		List<BizApplyVo>data = dao.selectPage(map);
		Paging paging = new Paging(data, pNum, pageCount, cnt, 5);
		
		return paging;
	}

	//search
	@Override
	public Search getPage(String bizid, int pNum, int cnt, String searchType, String keyword) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);	
		map.put("bizid",bizid);
		map.put("searchType",searchType);
		map.put("keyword",keyword);
		
		Map<String, String> mapCnt = new HashMap<String, String>();
		mapCnt.put("bizid", bizid);
		mapCnt.put("searchType", searchType);
		mapCnt.put("keyword", keyword);
		
		int totalRowCount = dao.getSearchApplyListCount(mapCnt);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		
		List<BizApplyVo>data = dao.searchApplyList(map);
		Search search = new Search(data, pNum, pageCount, cnt, 5, searchType, keyword );
		return search;
	}

	@Override
	public int getSearchApplyListCount(String bizid, String searchType, String keyword) throws Exception {
		Map<String, String> mapCnt = new HashMap<String, String>();
		mapCnt.put("bizid", bizid);
		mapCnt.put("searchType", searchType);
		mapCnt.put("keyword", keyword);
		System.out.println("**********mapCnt : "+mapCnt);
		return dao.getSearchApplyListCount(mapCnt);
	}

	// 분류에 따른 목록
	@Override
	public Search getDevisionPage(String bizid, int pNum, int cnt, String searchType, String keyword, int orderStatus) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);	
		map.put("bizid",bizid);
		map.put("searchType",searchType);
		map.put("keyword",keyword);
		map.put("orderStatus",orderStatus);
		
		Map<String, Object> mapCnt = new HashMap<String, Object>();
		mapCnt.put("bizid", bizid);
		mapCnt.put("searchType", searchType);
		mapCnt.put("keyword", keyword);
		mapCnt.put("orderStatus",orderStatus);
		
		int totalRowCount = dao.getDevisionApplyListCount(mapCnt);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		
		List<BizApplyVo>data = dao.getDevisionPage(map);
		Search search = new Search(data, pNum, pageCount, cnt, 5, searchType, keyword );
		return search;
	}

	@Override
	public int getDevisionApplyListCount(String bizid, String searchType, String keyword, int orderStatus) throws Exception {
		Map<String, Object> mapCnt = new HashMap<String, Object>();
		mapCnt.put("bizid", bizid);
		mapCnt.put("searchType", searchType);
		mapCnt.put("keyword", keyword);
		mapCnt.put("orderStatus",orderStatus);
		System.out.println("**********mapCnt : "+mapCnt);
		return dao.getDevisionApplyListCount(mapCnt);
	}

	//검색,분류,기간 조회
	@Override
	public Search getDevisionPageByDateRange(String bizid, int pNum, int cnt, String searchType, String keyword,
			int orderStatus, String startDate, String endDate) throws Exception {
		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", (pNum - 1) * cnt + 1);
			map.put("end", pNum * cnt);	
			map.put("bizid",bizid);
			map.put("searchType",searchType);
			map.put("keyword",keyword);
			map.put("orderStatus",orderStatus);
			map.put("startDate", startDate);
			map.put("endDate", endDate);
			
			Map<String, Object> mapCnt = new HashMap<String, Object>();
			mapCnt.put("bizid", bizid);
			mapCnt.put("searchType", searchType);
			mapCnt.put("keyword", keyword);
			mapCnt.put("orderStatus",orderStatus);
			mapCnt.put("startDate", startDate);
			mapCnt.put("endDate", endDate);
			
			int totalRowCount = dao.getDevisionApplyListCountByDateRange(mapCnt);
			int mod = totalRowCount % cnt == 0 ? 0 : 1;
			int pageCount = (totalRowCount / cnt) + mod;
			
			List<BizApplyVo>data = dao.getDevisionPageByDateRange(map);
			Search search = new Search(data, pNum, pageCount, cnt, 5, searchType, keyword );
			return search;
	}

	@Override
	public int getDevisionApplyListCountByDateRange(String bizid, String searchType, String keyword, int orderStatus,
			String startDate, String endDate) throws Exception {

			Map<String, Object> mapCnt = new HashMap<String, Object>();
			mapCnt.put("bizid", bizid);
			mapCnt.put("searchType", searchType);
			mapCnt.put("keyword", keyword);
			mapCnt.put("orderStatus",orderStatus);
			mapCnt.put("startDate", startDate);
			mapCnt.put("endDate", endDate);
			System.out.println("**********mapCnt : "+mapCnt);
			return dao.getDevisionApplyListCountByDateRange(mapCnt);
	}
}
