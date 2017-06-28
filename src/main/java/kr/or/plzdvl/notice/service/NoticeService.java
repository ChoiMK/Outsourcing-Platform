package kr.or.plzdvl.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.notice.vo.NoticeVO;

public interface NoticeService {
	// 공지사항 등록
	public void insertNotice(NoticeVO noticeInfo) throws Exception;
	// 공지사항 수정
	public int updateNoticeInfo(NoticeVO noticeInfo) throws Exception;
	// 공지사항 삭제
	public int deleteNoticeInfo(Map<String, String> params) throws Exception;
	// 공지사항 리스트
	public List<NoticeVO> getNoticeList(Map<String, String> params) throws Exception;
	// 공지사항 상세보기
	public NoticeVO getNoticeInfo(Map<String, String> params) throws Exception;
}
