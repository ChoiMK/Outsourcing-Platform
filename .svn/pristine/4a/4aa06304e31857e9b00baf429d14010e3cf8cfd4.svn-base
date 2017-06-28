package kr.or.plzdvl.tecinfo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.plzdvl.tecinfo.dao.TecinfoDao;
import kr.or.plzdvl.tecinfo.vo.TecinfoVO;

@Service("tecinfoService")
public class TecinfoServiceImpl implements TecinfoService{

	@Autowired
	private TecinfoDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertTecinfo(TecinfoVO tecinfo) throws Exception {
		dao.insertTecinfo(tecinfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateTecinfo(TecinfoVO tecinfo) throws Exception {
		int tecinfoCnt = 0;
		tecinfoCnt = dao.updateTecinfo(tecinfo);
		return tecinfoCnt;
	}

	@Override
	public List<TecinfoVO> getTecInfoList(Map<String, String> params) throws Exception {
		List<TecinfoVO> tecinfoList = null;
		tecinfoList = dao.getTecInfoList(params);
		return tecinfoList;
	}

	@Override
	public void deleteTecinfo(TecinfoVO tecinfo) throws Exception {
		dao.deleteTecinfo(tecinfo);
	}

}
