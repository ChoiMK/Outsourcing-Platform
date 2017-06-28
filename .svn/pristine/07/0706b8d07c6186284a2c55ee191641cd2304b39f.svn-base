package kr.or.plzdvl.admin.dvrTest.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.admin.dvrTest.vo.Quiz_optVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("quiz_optDao")
public class Quiz_optDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 보기 등록
	public void insertQuizOpt(Quiz_optVO optInfo) throws Exception{
		sqlSession.insert("quiz_opt.insertQuizOpt", optInfo);
	}
	
	// 보기 리스트
	public List<Quiz_optVO> optList() throws Exception {
		return sqlSession.selectList("quiz_opt.optList");
	}
	
	// 보기 상세보기
	public List<Quiz_optVO> optInfo(Map<String, String> params) throws Exception {
		return sqlSession.selectList("quiz_opt.optInfo", params);
	}
	
	// 보기 삭제
	public void optDelete(Map<String, String> params ) throws Exception {
		sqlSession.delete("quiz_opt.optDelete", params);
	}
}
