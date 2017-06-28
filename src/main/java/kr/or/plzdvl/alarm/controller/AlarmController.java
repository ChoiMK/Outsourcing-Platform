package kr.or.plzdvl.alarm.controller;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.alarm.service.alarmService;
import kr.or.plzdvl.alarm.vo.AlarmVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/alarm/")
public class AlarmController {
	@Autowired
	private alarmService service;
	
	@RequestMapping("alarmNotList")
	public ModelAndView alarmNotList(ModelAndView andView, Map<String, String> params, String mem_id) throws Exception{
		String al_chk_wht = "N";
		params.put("al_chk_wht", al_chk_wht);
		params.put("mem_id", mem_id);
		List<AlarmVO> alarmList = service.alarmList(params);
		andView.addObject("alarmList", alarmList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("alarmAllList")
	public ModelAndView alarmAllList(ModelAndView andView, Map<String, String> params, String mem_id) throws Exception{
		params.put("mem_id", mem_id);
		List<AlarmVO> alarmList = service.alarmList(params);
		andView.addObject("alarmList", alarmList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("alarmUpdate")
	public ModelAndView alarmUpdate(ModelAndView andView, Map<String, String> params, String al_num ) throws Exception{
		params.put("al_num", al_num);
		service.alarmCheck(params);
		andView.setViewName("jsonConvertView");
		return andView;
	}

}
