package kr.or.plzdvl.notice.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.notice.vo.NoticeVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 공지사항 등록
	public void insertNotice(NoticeVO noticeInfo) throws Exception {
		sqlSession.insert("notice.insertNotice", noticeInfo);
	}
	
	// 공지사항 수정
	public int updateNoticeInfo(NoticeVO noticeInfo) throws Exception {
		return sqlSession.update("notice.updateNotice", noticeInfo);
	}
	// 공지사항 삭제
	public int deleteNoticeInfo(Map<String, String> params) throws Exception {
		return sqlSession.update("notice.deleteNotice", params);
	}
	
	// 공지사항 리스트
	public List<NoticeVO> getNoticeList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("notice.noticeList", params);
	}
	
	// 공지사항 상세보기
	public NoticeVO getNoticeInfo(Map<String, String> params) throws Exception {
		return (NoticeVO) sqlSession.selectOne("notice.noticeInfo", params);
	}
}
