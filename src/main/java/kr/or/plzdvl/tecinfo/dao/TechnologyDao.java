package kr.or.plzdvl.tecinfo.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.plzdvl.tecinfo.vo.TechnologyVO;

@Repository("technologyDao")
public class TechnologyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 기술정보 리스트
	public List<TechnologyVO> TechnologyList() throws Exception {
		return sqlSession.selectList("technology.technologyList");
	}
}
