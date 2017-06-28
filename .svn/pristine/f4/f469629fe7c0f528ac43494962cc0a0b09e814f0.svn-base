package kr.or.plzdvl.admin.dvrTest.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.dvrTest.vo.SolveVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("solveDao")
public class SolveDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 풀이등록
	public void insertSovle(SolveVO solveInfo) throws Exception{
		sqlSession.insert("solve.insertSovle", solveInfo);
	}
	
	// 풀이수정
	public int updateSolve(SolveVO solveInfo) throws Exception {
		return sqlSession.update("solve.updateSolve", solveInfo);
	}
	
	// 풀이 리스트에 이미 세션회원이 푼 기록이 있는지 검사할때 쓰인다.
	public SolveVO solveList(Map<String, String> params) throws Exception {
		return sqlSession.selectOne("solve.solveList", params);
	}
	
	// 풀이 리스트에서 OO회원이 푼 모든 과목의 기록을 가져올때 쓰인다.
	public List<SolveVO> solveMemList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("solve.solveMemList", params);
	}
}
