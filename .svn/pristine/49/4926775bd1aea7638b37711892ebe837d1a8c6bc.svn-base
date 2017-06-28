package kr.or.plzdvl.tecinfo.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.tecinfo.dao.TechnologyDao;
import kr.or.plzdvl.tecinfo.vo.TechnologyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("technologyService")
public class TechnologyServiceImpl implements TechnologyService {

	@Autowired
	private TechnologyDao dao;
	
	@Override
	public List<TechnologyVO> technologyList()
			throws Exception {
		List<TechnologyVO> technologyList = null;
		technologyList = dao.TechnologyList();
		return technologyList;
	}

}
