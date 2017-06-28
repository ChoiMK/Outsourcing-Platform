package kr.or.plzdvl.admin.dvrTest.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.admin.dvrTest.dao.SolveDao;
import kr.or.plzdvl.dvrTest.vo.SolveVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("solveService")
public class SolveServiceImpl implements SolveService {
	
	@Autowired
	private SolveDao dao;

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertSovle(SolveVO solveInfo) throws Exception {
		dao.insertSovle(solveInfo);
		
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateSolve(SolveVO solveInfo) throws Exception {
		int updateSolve = dao.updateSolve(solveInfo);
		return updateSolve;
	}

	@Override
	public SolveVO solveList(Map<String, String> params) throws Exception {
		SolveVO solveList = dao.solveList(params);
		return solveList;
	}

	@Override
	public List<SolveVO> solveMemList(Map<String, String> params) throws Exception {
		List<SolveVO> solveList = dao.solveMemList(params);
		return solveList;
	}
	
	
}
