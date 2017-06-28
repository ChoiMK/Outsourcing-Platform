package kr.or.plzdvl.count.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("countDao")
public class CountDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 등록된 프로젝트
	public int projectCount() throws Exception{
		return sqlSession.selectOne("count.projectCount");
	}
	
	// 등록된 프리랜서
	public int freelancerCount() throws Exception{
		return sqlSession.selectOne("count.freelancerCount");
	}
	
	// 등록된 포트폴리오
	public int portfolioCount() throws Exception{
		return sqlSession.selectOne("count.portfolioCount");
	}
}
