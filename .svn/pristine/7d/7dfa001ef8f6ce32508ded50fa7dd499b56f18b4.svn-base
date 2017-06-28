package kr.or.plzdvl.dvrTest.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.dvrTest.vo.QuizOptVO;
import kr.or.plzdvl.dvrTest.vo.QuizVO;
import kr.or.plzdvl.dvrTest.vo.SolveVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dvrTestDao")
public class DvrTestDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 문제 상세보기
	public List<QuizVO> getQuizInfo(Map<String, String> params) throws Exception {
		return sqlSession.selectList("dvrTest.quizInfo", params);
	}
	
	// 보기 상세보기
	public List<QuizOptVO> getQuizOptInfoList(Map<String, String> params) throws Exception{
		return sqlSession.selectList("dvrTest.quizOptInfo", params);
	}
	
	//선택한 보기 등록
	public void insertAnswer(SolveVO solveVo) throws Exception{
		sqlSession.insert("dvrTest.insertAnswer", solveVo);
	}
}
