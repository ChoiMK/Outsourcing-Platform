package kr.or.plzdvl.subject.dao;

import java.util.List;

import kr.or.plzdvl.dvrTest.vo.SubjectVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("subjectDao")
public class SubjectDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 과목 리스트
	public List<SubjectVO> subjectList() throws Exception {
		return sqlSession.selectList("subject.subjectList");
	}
}
