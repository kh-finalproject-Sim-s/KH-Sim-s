package kh.finalproject.sims.biz.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizReviewMngtDao;
import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.common.page.Paging;

@Service
public class BizReviewMngtServiceImpl implements BizReviewMngtService {

	@Autowired
	private BizReviewMngtDao dao;
	
	@Override
	public int getReviewListCount(String bizid) throws Exception{
		return dao.getReviewListCount(bizid);
	}

	@Override
	public Paging getPage(String bizid, int pNum, int cnt)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);	
		map.put("bizid",bizid);
		
		int totalRowCount = dao.getReviewListCount(bizid);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		
		List<BizReviewMngtVo>data = dao.selectPage(map);
		Paging paging = new Paging(data, pNum, pageCount, cnt, 5);
		
		return paging;
	}

	@Override
	public int reportReview(BizReviewMngtVo vo)throws Exception {
		return dao.reportReview(vo);
	}

	@Override
	public int cancleReport(int reviewNo)throws Exception {
		return dao.cancleReport(reviewNo);
	}

	@Override
	public BizReviewMngtVo selectReviewDetail(int reviewNo)throws Exception {
		return dao.selectReviewDetail(reviewNo);
	}

	// 메인 통신사 페이지 리뷰
	@Override
	public List<BizReviewMngtVo> selectBizReviewList(String bizId)throws Exception {
		return dao.selectBizReviewList(bizId);
	}

	//신고처리상태에 따른 조회
	@Override
	public Paging selectByReportStatus(String bizid, int pNum, int cnt, int reportStatus)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);	
		map.put("bizid",bizid);
		map.put("reportStatus",reportStatus);
		
		int totalRowCount = dao.selectByReportStatusCnt(map);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		
		List<BizReviewMngtVo>data = dao.selectByReportStatus(map);
		Paging paging = new Paging(data, pNum, pageCount, cnt, 5);
		
		return paging;
	}

	@Override
	public int selectByReportStatusCnt(String bizid, int reportStatus) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bizid",bizid);
		map.put("reportStatus",reportStatus);
		
		return dao.selectByReportStatusCnt(map);
	}


}
