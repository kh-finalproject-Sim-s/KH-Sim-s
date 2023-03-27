package kh.finalproject.sims.biz.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizApplyMngtDao;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;

@Service
public class BizApplyMngtServiceImpl implements BizApplyMngtService {

	@Autowired
	public BizApplyMngtDao dao;

	@Override
	public BizApplyVo selectApplyDetailUser() {
		return dao.selectApplyDetailUser();
	}

	@Override
	public BizApplyVo selectApplyDetailPlan() {
		return dao.selectApplyDetailPlan();
	}
}