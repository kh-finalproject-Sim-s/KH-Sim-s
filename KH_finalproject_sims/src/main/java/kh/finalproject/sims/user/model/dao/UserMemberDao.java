package kh.finalproject.sims.user.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Repository
public class UserMemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int selectIdCheck(String id) {
		return sqlSession.selectOne("member.selectIdCheck", id);
	}

	public int signUpMember(MemberVo memVo) {
		return sqlSession.insert("member.signUpMember", memVo);
	}

	public int signUpUser(UserMemberVo userVo) {
		return sqlSession.insert("member.signUpUser", userVo);
	}

	public int signUpBiz(BizInfoMngtVo bizVo) {
		return sqlSession.insert("member.signUpBiz", bizVo);
	}

	public String selectFindId(UserMemberVo userVo) {
		return sqlSession.selectOne("member.selectFindUserId", userVo);
	}

	public String selectFindId(BizInfoMngtVo bizVo) {
		return sqlSession.selectOne("member.selectFindBizId", bizVo);
	}

	public int selectFindPw(UserMemberVo userVo) {
		return sqlSession.selectOne("member.selectFindUserPw", userVo);
	}

	public int selectFindPw(BizInfoMngtVo bizVo) {
		return sqlSession.selectOne("member.selectFindBizPw", bizVo);
	}

	public int changePw(MemberVo memVo) {
		return sqlSession.update("member.changePw", memVo);
	}

	public int checkEna(String userId) {
		return sqlSession.selectOne("member.checkEna", userId);
	}
	
	public int updateEnable(String id) {
		return sqlSession.update("member.updateEnable", id);
	}

	public void kakaoInsert(MemberVo memberVo) {
		sqlSession.insert("member.signUpMember", memberVo);
	}
	
	public void kakaoInsertUserMember(UserMemberVo userMemberVo) {
		sqlSession.insert("member.kakaoInsertUserMember", userMemberVo);
	}

	public MemberVo kakaoSelect(String snsId) {
		return sqlSession.selectOne("member.kakaoSelect", snsId);
	}

	public String findAuthBy(String userid) {
		return sqlSession.selectOne("member.findAuthBy", userid);
	}

	public MemberVo findByUserId(String snsId) {
		return sqlSession.selectOne("member.findByUserId", snsId);
	}
	
}
