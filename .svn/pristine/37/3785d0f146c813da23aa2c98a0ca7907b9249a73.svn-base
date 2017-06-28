package kr.or.plzdvl.reference.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.reference.vo.ReferenceVO;

public interface ReferenceService {
	
	// 자료실 등록
	public void insertReference(ReferenceVO referenceInfo) throws Exception;
	
	// 수정
	public int updateReference(ReferenceVO referenceInfo) throws Exception;
	
	// 삭제
	public int deleteReference(Map<String, String> params ) throws Exception;
	
	// 리스트
	public List<ReferenceVO> getReferenceList(Map<String, String> params) throws Exception;
	
	// 상세보기 & 상세보기
	public ReferenceVO getReferenceInfo(Map<String, String> params) throws Exception;
	
	// 좋아요 수 증가
	public int goodReference(Map<String, String> params) throws Exception;
}
