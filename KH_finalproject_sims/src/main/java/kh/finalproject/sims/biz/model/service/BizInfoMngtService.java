package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.biz.model.vo.BizInfoMngServiceVo;

public interface BizInfoMngtService {
	
	//public List<BizInfoMngtVo> selectList() throws Exception;

	public BizInfoMngtVo selectBizInfoDetail(String bizid)throws Exception;
	public List<BizInfoMngServiceVo> selectListService(String bizid)throws Exception;
	public int modifyNetService(List<BizInfoMngServiceVo> netServiceList)throws Exception;
	public int modifyBizInfo(BizInfoMngtVo vo)throws Exception;
	public String getBeforeBizName(String bizid)throws Exception;
	public int updatePlanTable(String beforeBizName, String bizName)throws Exception;
	
	// 메인 통신사 정보
	public BizInfoMngtVo selectMainBizInfo(String bizId)throws Exception;
	
	public int insertServicList(String bizid)throws Exception;
}
