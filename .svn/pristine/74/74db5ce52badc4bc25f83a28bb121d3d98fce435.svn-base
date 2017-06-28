package kr.or.plzdvl.admin.dvrTest.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.admin.dvrTest.dao.QuizDao;
import kr.or.plzdvl.admin.dvrTest.dao.Quiz_optDao;
import kr.or.plzdvl.admin.dvrTest.vo.QuizVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("quizService")
public class QuizServiceImpl implements QuizService {

	@Autowired
	private QuizDao dao;
	@Autowired
	private Quiz_optDao optDao;
	
	@Override
	public void insertQuiz(QuizVO quizInfo) throws Exception {
		dao.insertQuiz(quizInfo);
	}

	@Override
	public int lastQuizNum() throws Exception {
		int lastNum = dao.lastQuizNum();
		return lastNum;
	}

	@Override
	public List<QuizVO> quizList(Map<String, String> params) throws Exception {
		List<QuizVO> quizList = dao.quizList(params);
		return quizList;
	}

	@Override
	public QuizVO quizView(Map<String, String> params) throws Exception {
		QuizVO quizView = dao.quizView(params);
		return quizView;
	}

	@Override
	public void quizDelete(Map<String, String> params) throws Exception {
		dao.quizDelete(params);
		optDao.optDelete(params);
	}
}
