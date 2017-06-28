package kr.or.plzdvl.tecinfo.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.tecinfo.vo.TechnologyVO;

public interface TechnologyService {
	
	// 기술정보 리스트
		public List<TechnologyVO> technologyList() throws Exception;

}
