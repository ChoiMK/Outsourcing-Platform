package kr.or.plzdvl.dvrTest.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.dvrTest.vo.QuizOptVO;
import kr.or.plzdvl.dvrTest.vo.QuizVO;
import kr.or.plzdvl.dvrTest.vo.SolveVO;

public interface DvrTestService {

	// 문제 보기
	public List<QuizVO> getQuizInfo(Map<String, String> params) throws Exception;
	
	// 보기 보기
	public List<QuizOptVO> getQuizOptInfoList(Map<String, String> params) throws Exception;

	// 문제 풀기 완료
	public void insertAnswer(List<SolveVO> solveVoList) throws Exception;
	
}
