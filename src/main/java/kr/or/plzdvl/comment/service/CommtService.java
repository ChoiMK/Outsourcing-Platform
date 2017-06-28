package kr.or.plzdvl.comment.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.comment.vo.CommtVO;

public interface CommtService {
	
	// 댓글 등록
	public void insertCommt(CommtVO commtInfo) throws Exception;
	
	// 댓글 수정
	public int updateCommt(CommtVO commtInfo) throws Exception;
	
	// 댓글의 댓글 등록
	public void insertCommtReply(CommtVO commtInfo) throws Exception;
	
	// 댓글 리스트
	public List<CommtVO> getCommtList(Map<String, String> params) throws Exception;
	
	// 댓글 리스트 자료실
	public List<CommtVO> commtListreference(Map<String, String> params) throws Exception;
	
	// 댓글 하나의 정보
	public CommtVO getCommtInfo(Map<String, String> params) throws Exception;
		
	// 가장 높은 순번 가져오기
	public String getcommtMaxturn(Map<String, String> params) throws Exception;
	
}
