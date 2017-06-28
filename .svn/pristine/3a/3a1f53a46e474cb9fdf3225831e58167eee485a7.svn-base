package kr.or.plzdvl.alarm.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.alarm.vo.AlarmVO;

public interface alarmService {

	// 알림등록(댓글)
	public void insertAlarmCommt(AlarmVO alarmInfo) throws Exception;
		
	// 알림등록( 댓글을 제외한 알림 )
	public void insertAlarm(AlarmVO alarmInfo) throws Exception;
		
	// 알림확인 
	public int alarmCheck(Map<String, String> params) throws Exception;
	
	// 알림리스트
	public List<AlarmVO> alarmList(Map<String, String> params) throws Exception;
	
}
