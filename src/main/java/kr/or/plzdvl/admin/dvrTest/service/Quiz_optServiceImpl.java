package kr.or.plzdvl.admin.dvrTest.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.admin.dvrTest.dao.Quiz_optDao;
import kr.or.plzdvl.admin.dvrTest.vo.Quiz_optVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("quiz_optService")
public class Quiz_optServiceImpl implements  Quiz_optService{

	@Autowired
	private Quiz_optDao dao;
	
	@Override
	public void insertQuizOpt(Quiz_optVO optInfo) throws Exception {
		dao.insertQuizOpt(optInfo);
	}

	@Override
	public List<Quiz_optVO> optList() throws Exception {
		List<Quiz_optVO> optList = dao.optList();
		return optList;
	}

	@Override
	public List<Quiz_optVO> optInfo(Map<String, String> params)
			throws Exception {
		List<Quiz_optVO> optInfo = dao.optInfo(params);
		return optInfo;
	}

}
