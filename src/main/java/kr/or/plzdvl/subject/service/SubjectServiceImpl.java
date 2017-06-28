package kr.or.plzdvl.subject.service;

import java.util.List;

import kr.or.plzdvl.dvrTest.vo.SubjectVO;
import kr.or.plzdvl.subject.dao.SubjectDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("subjectService")
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	private SubjectDao dao;
	
	@Override
	public List<SubjectVO> subjectList() throws Exception {
		List<SubjectVO> subjectList = dao.subjectList();
		return subjectList;
	}
	
}
