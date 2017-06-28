package kr.or.plzdvl.faq.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.faq.vo.FaqVO;

public interface FaqService {
	// FAQ 등록
	public void insertFaq(FaqVO faqInfo) throws Exception;
	// FAQ 수정
	public int updateFaqInfo(FaqVO faqInfo) throws Exception;
	// FAQ 삭제
	public int deleteFaqInfo(Map<String, String> params) throws Exception;
	// FAQ 리스트
	public List<FaqVO> getFaqList(Map<String, String> params) throws Exception;
	// FAQ 상세보기
	public FaqVO getFaqInfo(Map<String, String> params) throws Exception;
}
