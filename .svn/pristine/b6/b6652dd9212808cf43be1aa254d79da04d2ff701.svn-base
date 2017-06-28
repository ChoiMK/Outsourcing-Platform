package kr.or.plzdvl.alarm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.plzdvl.alarm.dao.AlarmDao;
import kr.or.plzdvl.alarm.vo.AlarmVO;

@Service("alarmService")
public class alarmServiceImpl implements alarmService{

	@Autowired
	private AlarmDao dao;
	
	@Override
	public void insertAlarmCommt(AlarmVO alarmInfo) throws Exception {
		dao.insertAlarmCommt(alarmInfo);
	}

	@Override
	public void insertAlarm(AlarmVO alarmInfo) throws Exception {
		dao.insertAlarm(alarmInfo);
	}

	@Override
	public int alarmCheck(Map<String, String> params) throws Exception {
		int alarmCheck = 0;
		alarmCheck = dao.alarmCheck(params);
		return alarmCheck;
	}

	@Override
	public List<AlarmVO> alarmList(Map<String, String> params) throws Exception {
		return dao.alarmList(params);
	}

	
	
}
