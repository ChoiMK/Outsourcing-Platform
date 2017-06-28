package kr.or.plzdvl.meetingschedule.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.meetingschedule.controller.MettingController;
import kr.or.plzdvl.meetingschedule.vo.MeetingVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mettingDao")
public class MettingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static Logger logger = LoggerFactory.getLogger(MettingController.class);
	
	public MettingDao(){
		logger.debug("MettingDao의 생성자");
	}
	
	// 미팅일자 등록
	public void insertMetting(Map<String, String> params) throws Exception {
		sqlSession.insert("metting.insertMetting", params);
	}
	
	// 미팅리스트 출력
		public List<MeetingVO> mettingList(Map<String, String> params) throws Exception {
			 return sqlSession.selectList("metting.meetingList", params);
		}

}
