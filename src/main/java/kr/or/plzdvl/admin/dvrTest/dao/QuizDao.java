package kr.or.plzdvl.admin.dvrTest.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.admin.dvrTest.vo.QuizVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("quizDao")
public class QuizDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 문제등록
	public void insertQuiz(QuizVO quizInfo) throws Exception {
		sqlSession.insert("quiz.insertQuiz", quizInfo);
	}
	
	// 문제번호
	public int lastQuizNum() throws Exception {
		return sqlSession.selectOne("quiz.lastQuizNum");
	}
	
	// 문제리스트
	public List<QuizVO> quizList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("quiz.quizList", params);
	}
	
	// 문제 상세보기
	public QuizVO quizView(Map<String, String> params) throws Exception {
		return sqlSession.selectOne("quiz.quizView", params);
	}
	
	// 문제 삭제 
	public void quizDelete(Map<String, String> params ) throws Exception {
		sqlSession.delete("quiz.quizDelete", params);
	}
}
