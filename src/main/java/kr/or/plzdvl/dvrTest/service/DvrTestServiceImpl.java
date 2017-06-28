package kr.or.plzdvl.dvrTest.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.dvrTest.dao.DvrTestDao;
import kr.or.plzdvl.dvrTest.vo.QuizOptVO;
import kr.or.plzdvl.dvrTest.vo.QuizVO;
import kr.or.plzdvl.dvrTest.vo.SolveVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("dvrTestService")
public class DvrTestServiceImpl implements DvrTestService{

	@Autowired
	private DvrTestDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public List<QuizVO> getQuizInfo(Map<String, String> params) throws Exception {
		List<QuizVO> quizList = null;
		quizList = dao.getQuizInfo(params);
		return quizList;
	}

	@Override
	public List<QuizOptVO> getQuizOptInfoList(Map<String, String> params)
			throws Exception {
		List<QuizOptVO> quizOptInfoList = null;
		quizOptInfoList = dao.getQuizOptInfoList(params);
		
		return quizOptInfoList;
	}

	@Override
	public void insertAnswer(List<SolveVO> solveVoList) throws Exception {		
		
		for(int i = 0; i < solveVoList.size(); i++){
			SolveVO solveVo = solveVoList.get(i);					
			dao.insertAnswer(solveVo);
		}
		
	}

}
