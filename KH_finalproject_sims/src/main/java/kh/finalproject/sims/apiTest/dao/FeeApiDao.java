package kh.finalproject.sims.apiTest.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FeeApiDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert(Map<String, Object> map) {
		return sqlSession.insert("plan.insertPlanData", map);
	}
}
