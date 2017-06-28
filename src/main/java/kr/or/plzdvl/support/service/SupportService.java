package kr.or.plzdvl.support.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.support.vo.SupportVO;

public interface SupportService {
	// 지원등록
	public void insertSupport(SupportVO supportVO) throws Exception;
		
	// 지원자 리스트
	public List<SupportVO> getSupportList(Map<String, String> params) throws Exception;
		
	// 지원자 수 
	public int supportCount(Map<String, String> params) throws Exception;
	
	// 지원삭제
	public void deleteSupportMember(SupportVO supportInfo) throws Exception;
	
	// 지원 정보
	public SupportVO supportInfo(Map<String, String> params) throws Exception;
}
