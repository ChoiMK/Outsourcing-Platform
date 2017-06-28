package kr.or.plzdvl.alarm.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.alarm.vo.AlarmVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("alarmDao")
public class AlarmDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 알림등록(댓글)
	public void insertAlarmCommt(AlarmVO alarmInfo) throws Exception {
		sqlSession.insert("alarm.insertAlarmCommt", alarmInfo);
	}
	
	// 알림등록( 댓글을 제외한 알림 )
	public void insertAlarm(AlarmVO alarmInfo) throws Exception {
		sqlSession.insert("alarm.insertAlarm", alarmInfo);
	}
	
	// 알림확인 
	public int alarmCheck(Map<String, String> params) throws Exception {
		return sqlSession.update("alarm.alarmCheck", params);
	}
	
	public List<AlarmVO> alarmList(Map<String, String> params) throws Exception{
		return sqlSession.selectList("alarm.mem_alarmList",params);
	}
}
