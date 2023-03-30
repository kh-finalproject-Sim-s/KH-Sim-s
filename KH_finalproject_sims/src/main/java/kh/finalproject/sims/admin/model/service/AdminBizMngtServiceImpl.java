package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminBizMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;

@Service
public class AdminBizMngtServiceImpl implements AdminBizMngtService{
	
	@Autowired
	private AdminBizMngtDao dao;

	//통신사 정보 리스트
	@Override
	public List<AdminBizMngtVo> selectApplyList(AdminBizMngtVo vo) {
		return dao.selectApplyList(vo);
	}

	//통신사의 신청정보 상세
	@Override
	public AdminBizMngtVo selectApplyDetail(String bizId) {
		return dao.selectApplyDetail(bizId);
	}

	//통신사의 상세 페이지로 이동
	@Override
	public AdminBizMngtVo selectBizDetail(String bizOwnerName) {
		return dao.selectBizDetail(bizOwnerName);
	}

	//통신사 요금제 개통 신청 리스트
	@Override
	public List<AdminBizMngtVo> selectBizPlanApplyList(AdminBizMngtVo vo) {
		return dao.selectBizPlanApplyList(vo);
	}
	

}
