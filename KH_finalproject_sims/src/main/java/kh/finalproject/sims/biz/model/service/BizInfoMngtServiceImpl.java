package kh.finalproject.sims.biz.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizInfoMngtDao;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
@Service
public class BizInfoMngtServiceImpl implements BizInfoMngtService{
	
	@Autowired
	private BizInfoMngtDao dao;

	@Override
	public List<BizInfoMngtVo> selectList() throws Exception {
		return dao.selectList();
	}
}