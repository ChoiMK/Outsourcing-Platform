package kr.or.plzdvl.admin.dvrTest.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.admin.dvrTest.vo.QuizVO;

public interface QuizService {
	
	// 문제등록
	public void insertQuiz(QuizVO quizInfo) throws Exception;
	
	// 문제번호
	public int lastQuizNum() throws Exception;
	
	// 문제리스트
	public List<QuizVO> quizList(Map<String, String> params) throws Exception;
	
	// 문제 상세보기
	public QuizVO quizView(Map<String, String> params) throws Exception;
	
	// 문제 삭제 
	public void quizDelete(Map<String, String> params) throws Exception;

}
