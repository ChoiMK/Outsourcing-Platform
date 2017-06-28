package kr.or.plzdvl.support.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.plzdvl.support.vo.SupportVO;

@Repository("supportDao")
public class SupportDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 지원 등록
	public void insertSupport(SupportVO supportVO) throws Exception {
		sqlSession.insert("support.insertSupport", supportVO);
	}

	// 지원자 리스트
	public List<SupportVO> getSupportList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("support.supportList", params);
	}

	// 지원자 수
	public int supportCount(Map<String, String> params) throws Exception {
		return (int) sqlSession.selectOne("support.supportCount", params);
	}
	
	// 지원삭제
	public void deleteSupportMember(SupportVO supportInfo) throws Exception {
		sqlSession.delete("support.deleteSupportMember", supportInfo);
	}
	
	// 지원정보
	public SupportVO supportInfo(Map<String, String> params) throws Exception {
		return sqlSession.selectOne("support.supportInfo", params);
	}
}
