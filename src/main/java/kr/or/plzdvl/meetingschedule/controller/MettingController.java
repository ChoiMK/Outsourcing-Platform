package kr.or.plzdvl.meetingschedule.controller;

import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.plzdvl.alarm.service.alarmService;
import kr.or.plzdvl.alarm.vo.AlarmVO;
import kr.or.plzdvl.meetingschedule.service.MettingService;
import kr.or.plzdvl.meetingschedule.vo.MeetingVO;
import kr.or.plzdvl.member.service.MemberService;
import kr.or.plzdvl.member.vo.MemberFileVO;
import kr.or.plzdvl.member.vo.MemberVO;

@Controller
public class MettingController {
	@Autowired
	private MettingService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private alarmService alarmservice;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("mettingCalendar")
	public ModelAndView calendar(ModelAndView andView, Map<String,String> params) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_id", memberInfo.getMem_id());
		List<MeetingVO> mettingList = service.mettingList(params);
		andView.addObject("mettingList", mettingList);
		
		andView.setViewName("mypage/mettingCalendar");
		return andView;
	}
	
	@RequestMapping("mettingInsert")
	public ModelAndView mettingInsert(ModelAndView andView, MeetingVO meetingInfo, Map<String,String> params) throws Exception{
		String me_free_nmArr[]= meetingInfo.getMe_free_nm().split(","); // 프리랜서 아이디  
		String  me_cnt_nmArr[]= meetingInfo.getMe_cnt_nm().split(","); // 클라이언트 아이디
		String me_mem_idArr[] = meetingInfo.getMe_mem_id().split(",");  // 회원아이디
		String me_dateArr[]= meetingInfo.getMe_date().split(",");	// 미팅날자
		//메일 설정
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		// 클라이언트에게 보낼 메세지
		String alarmMessage = "";
		//이메일을 보낼 클라이언트의 회원의 정보
		params.put("mem_id", me_cnt_nmArr[0]);
		MemberVO memberCntInfo = memberService.getMemberInfo(params);
		// 프리랜서에게 보낼 메세지
		AlarmVO cntalarmInfo = new AlarmVO();
		
		for(int i=0 ; i<me_free_nmArr.length ; i++)
        {
			alarmMessage += "지원자 : "+me_free_nmArr[i]+"  미팅일자 : "+me_dateArr[i]+"\r\n";
			String me_free_nm = me_free_nmArr[i];
			int idx = me_free_nm.indexOf("(");
			String fixfree_id = me_free_nm.substring(0, idx);
			params.put("fixfree_id", fixfree_id);
			String fixcnt_id = me_cnt_nmArr[i];
			params.put("fixcnt_id", fixcnt_id);
			String fixmem_id = me_mem_idArr[i];
			params.put("fixmem_id", fixmem_id);
			String fix_date = me_dateArr[i];
			params.put("fix_date", fix_date);
			
			service.insertMetting(params);
			
			cntalarmInfo.setAl_tit("새로운 미팅이 등록되었습니다. 확인하여주세요");
			cntalarmInfo.setMem_id(fixfree_id);
			cntalarmInfo.setPro_num("meet");
			cntalarmInfo.setAl_url("/mettingCalendar.do");
			alarmservice.insertAlarm(cntalarmInfo);
			params.put("mem_id", fixfree_id);
			MemberVO memberfreeInfo = memberService.getMemberInfo(params);
			
			messageHelper.setTo(memberfreeInfo.getMem_mail());       //회원의 email로 전송
			messageHelper.setText("클라이언트: "+fixcnt_id+"("+memberCntInfo.getMem_nm()+")"+"님과 새로운 미팅이 등록되었습니다.");//메일 본문
			messageHelper.setFrom("alsrb3346@gmail.com"); //보내는사람
			messageHelper.setSubject("제발개발에서 알려드립니다.");         // 메일제목은 생략이 가능하다
			mailSender.send(message);
        }
		alarmMessage += "미팅 날짜를 꼭 확인하고 숙지해주시기 바랍니다.";
		
		//알람등록
		cntalarmInfo.setAl_tit(alarmMessage.replace("\r\n", "<br>"));
		cntalarmInfo.setMem_id(me_cnt_nmArr[0]);
		cntalarmInfo.setPro_num("meet");
		cntalarmInfo.setAl_url("/mettingCalendar.do");
		alarmservice.insertAlarm(cntalarmInfo);
		
		messageHelper.setTo(memberCntInfo.getMem_mail());       //회원의 email로 전송
		messageHelper.setText(alarmMessage);//메일 본문
		messageHelper.setFrom("alsrb3346@gmail.com"); //보내는사람
		messageHelper.setSubject("제발개발에서 알려드립니다.");            // 메일제목은 생략이 가능하다
		mailSender.send(message);
		
		andView.setViewName("redirect:/mettingCalendar.do");
		return andView;
	}
	
	@RequestMapping("mettingRelay")
	public ModelAndView mettingRelay(Map<String,String> params, ModelAndView andView, AlarmVO freeAlarm, String roomCode, String free_id, String cnt_id) throws Exception{
		params.put("mem_id", cnt_id);
		MemberVO cntInfo = memberService.getMemberInfo(params);
		
		String message = cntInfo.getMem_id()+"("+cntInfo.getMem_nm()+") "+" 님께서 화상요청하셨습니다.<br>"
						+"감사합니다.";
		
		freeAlarm.setAl_tit(message);
		freeAlarm.setMem_id(free_id);
		freeAlarm.setPro_num("meet");
		freeAlarm.setAl_url("videChat.do?roomCode="+roomCode);
		alarmservice.insertAlarm(freeAlarm);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
}
