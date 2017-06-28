package kr.or.plzdvl.comment.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.comment.vo.CommtVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("commtDao")
public class CommtDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 댓글등록
	public void insertCommt(CommtVO commtInfo) throws Exception{
		sqlSession.insert("commt.insertCommt", commtInfo);
	}
	
	// 댓글수정
	public int updateCommt(CommtVO commtInfo) throws Exception {
		return sqlSession.update("commt.updateCommt", commtInfo);
	}
	
	// 댓글의 댓글 등록
	public void insertCommtReply(CommtVO commtInfo) throws Exception {
		sqlSession.insert("commt.insertCommtReply", commtInfo);
	}
	
	// 댓글 리스트
	public List<CommtVO> getCommtList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("commt.commtList", params);
	}
	
	// 댓글 리스트 자료실
	public List<CommtVO> commtListreference(Map<String, String> params) throws Exception {
		return sqlSession.selectList("commt.commtListreference", params);
	}
	// 댓글 하나의 정보
	public CommtVO getCommtInfo(Map<String, String> params) throws Exception {
		return sqlSession.selectOne("commt.commtInfo", params);
	}
	
	// 가장 높은 순번 가져오기
	public String getcommtMaxturn(Map<String, String> params) throws Exception {
		return sqlSession.selectOne("commt.commtMaxturn", params);
	}
}
