package kr.or.plzdvl.meetingschedule.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.meetingschedule.controller.MettingController;
import kr.or.plzdvl.meetingschedule.dao.MettingDao;
import kr.or.plzdvl.meetingschedule.vo.MeetingVO;
import kr.or.plzdvl.member.dao.MemberDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("mettingService")
public class MettingServiceImpl implements MettingService{

	@Autowired
	private MettingDao dao;
	private static Logger logger = LoggerFactory.getLogger(MettingController.class);
	
	public MettingServiceImpl() {
		logger.debug("MettingServiceImpl의 생성자");
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertMetting(Map<String, String> params) throws Exception {
		dao.insertMetting(params);
	}

	@Override
	public List<MeetingVO> mettingList(Map<String, String> params)
			throws Exception {
		return dao.mettingList(params);
	}

}
