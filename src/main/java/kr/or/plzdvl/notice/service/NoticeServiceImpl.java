package kr.or.plzdvl.notice.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.plzdvl.faq.controller.FaqController;
import kr.or.plzdvl.notice.dao.NoticeDao;
import kr.or.plzdvl.notice.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao dao;
	private static Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	public NoticeServiceImpl(){
		logger.debug("NoticeServiceImpl의 생성자");
	}

	@Override
	public void insertNotice(NoticeVO noticeInfo) throws Exception {
		dao.insertNotice(noticeInfo);
	}

	@Override
	public int updateNoticeInfo(NoticeVO noticeInfo) throws Exception {
		int updateCnt = 0;
		updateCnt = dao.updateNoticeInfo(noticeInfo);
		return updateCnt;
	}

	@Override
	public int deleteNoticeInfo(Map<String, String> params) throws Exception {
		int deleteCnt = 0;
		deleteCnt = dao.deleteNoticeInfo(params);
		return deleteCnt;
	}

	@Override
	public List<NoticeVO> getNoticeList(Map<String, String> params) throws Exception {
		List<NoticeVO> noticeList = null;
		noticeList = dao.getNoticeList(params);
		return noticeList;
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public NoticeVO getNoticeInfo(Map<String, String> params) throws Exception {
		NoticeVO noticeInfo = null;
		noticeInfo = dao.getNoticeInfo(params);
		return noticeInfo;
	}
	
	

}
