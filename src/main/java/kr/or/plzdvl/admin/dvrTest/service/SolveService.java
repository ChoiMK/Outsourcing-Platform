package kr.or.plzdvl.admin.dvrTest.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.dvrTest.vo.SolveVO;

public interface SolveService {
	
	// 풀이등록
	public void insertSovle(SolveVO solveInfo) throws Exception;
		
	// 풀이수정
	public int updateSolve(SolveVO solveInfo) throws Exception;
	
	// 풀이리스트
	public SolveVO solveList(Map<String, String> params) throws Exception;
	
	// 풀이 리스트에서 OO회원이 푼 모든 과목의 기록을 가져올때 쓰인다.
	public List<SolveVO> solveMemList(Map<String, String> params) throws Exception;
		
}
