package kr.or.plzdvl.faq.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.faq.vo.FaqVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("faqDao")
public class FaqDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// FAQ 등록
	public void insertFaq(FaqVO faqInfo) throws Exception {
		sqlSession.insert("faq.insertFAQ", faqInfo);
	}
	
	// FAQ 수정
	public int updateFaqInfo(FaqVO faqInfo) throws Exception {
		return sqlSession.update("faq.updateFAQ", faqInfo);
	}
	// FAQ 삭제
	public int deleteFaqInfo(Map<String, String> params) throws Exception {
		return sqlSession.update("faq.deleteFAQ", params);
	}
	
	// FAQ 리스트
	public List<FaqVO> getFaqList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("faq.faqList", params);
	}
	
	// FAQ 상세보기
	public FaqVO getFaqInfo(Map<String, String> params) throws Exception {
		return ( FaqVO ) sqlSession.selectOne("faq.faqInfo", params);
	}
}
