package kr.or.plzdvl.reference.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.reference.vo.ReferenceVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("referenceDao")
public class ReferenceDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 자료실 등록
	public void insertReference(ReferenceVO referenceInfo) throws Exception {
		sqlSession.insert("reference.insertReference", referenceInfo);
	}
	
	// 자료실 수정
	public int updateReference(ReferenceVO referenceInfo) throws Exception {
		return sqlSession.update("reference.updateReference", referenceInfo);
	}
	
	// 자료실 삭제
	public int deleteReference(Map<String, String> params ) throws Exception {
		return sqlSession.update("reference.deleteReference", params);
	}
	
	// 자료실 리스트
	public List<ReferenceVO> getReferenceList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("reference.referenceList", params);
	}
	
	// 자료실 상세보기 & 조회수 증가
	public ReferenceVO getReferenceInfo(Map<String, String> params) throws Exception {
		sqlSession.update("reference.hitReference", params);
		return (ReferenceVO) sqlSession.selectOne("reference.referenceInfo", params);
	}
	
	// 좋아요 수 증가
	public int goodReference(Map<String, String> params) throws Exception {
		return sqlSession.update("reference.goodReference", params);
	}
	
}
