package kr.or.plzdvl.tecinfo.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.tecinfo.vo.TecinfoVO;

public interface TecinfoService {

	// 기술정보 등록
	public void insertTecinfo(TecinfoVO tecinfo) throws Exception;
	
	// 기술정보 수정
	public int updateTecinfo(TecinfoVO tecinfo) throws Exception;
	
	// 기술정보 리스트
	public List<TecinfoVO> getTecInfoList(Map<String, String> params) throws Exception;
	
	// 기술정보 삭제
	public void deleteTecinfo(TecinfoVO tecinfo) throws Exception;
}
