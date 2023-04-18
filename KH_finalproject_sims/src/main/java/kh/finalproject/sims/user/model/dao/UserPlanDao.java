package kh.finalproject.sims.user.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.user.model.vo.LikeVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

@Repository
public class UserPlanDao {
	
	@Autowired
	private SqlSession session;
	
	public PlanVo getPlanByNo(int planNo) {
		return session.selectOne("plan.getPlanByNo", planNo);
	}

	public int insertLike(LikeVo lvo) {
		return session.insert("plan.insertLike", lvo);
	}

	public int deleteLike(int planNo, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("planNo", planNo);
		map.put("userId", userId);
		return session.delete("plan.deleteLike", map);
	}

	public LikeVo getLikeByPlanWithUser(int planNo, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("planNo", planNo);
		map.put("userId", userId);
		return session.selectOne("plan.getLikeByPlanWithUser", map);
	}


}
