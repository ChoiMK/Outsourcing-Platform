package kr.or.plzdvl.support.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import kr.or.plzdvl.alarm.service.alarmService;
import kr.or.plzdvl.alarm.vo.AlarmVO;
import kr.or.plzdvl.member.service.MemberService;
import kr.or.plzdvl.member.vo.MemberVO;
import kr.or.plzdvl.project.service.ProjectService;
import kr.or.plzdvl.project.vo.ProjectVO;
import kr.or.plzdvl.support.service.SupportService;
import kr.or.plzdvl.support.vo.SupportVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SupportController {
	@Autowired
	private SupportService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private alarmService alarmService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memservice;
	
	@RequestMapping("/insertSuppert")
	public ModelAndView insertSuppert(AlarmVO alarmInfo, ModelAndView andView, Map<String, String> params,
			String pro_num, SupportVO supportInfo) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String messageTit = "";
		String messageCon = "";
		String messageType = "";
		String alarmMessage = memberInfo.getMem_id()+"("+memberInfo.getMem_nm()+") 님께서 프로젝트에 지원하셨습니다.";
		
		//현재 지원한 회원
		params.put("mem_id", memberInfo.getMem_id());
		params.put("pro_num", pro_num);
		supportInfo.setMem_id(memberInfo.getMem_id());
		supportInfo.setPro_num(pro_num);
		supportInfo.setMem_nm(memberInfo.getMem_nm());
		
		// 프로젝트를 작성한 회원
		ProjectVO projectInfo = projectService.getProjectInfo(params);
		String pro_wrt_mem = projectInfo.getMem_id();
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", pro_wrt_mem);
		 MemberVO estmember = memservice.getMemberInfo(param);
		// 같은 프로젝트에 처음지원 한 경우
		SupportVO memInfo = service.supportInfo(params);
		if(memInfo == null){
			service.insertSupport(supportInfo);
			messageTit = "프로젝트 지원 성공";
			messageCon = "회원님의 마이페이지에서 확인 가능합니다.";
			messageType = "success";
			
			alarmInfo.setAl_tit(alarmMessage);
			alarmInfo.setMem_id(pro_wrt_mem);
			alarmInfo.setPro_num(pro_num);
			alarmInfo.setAl_url("project/projectView.do?pro_num="+pro_num);
			alarmService.insertAlarm(alarmInfo);
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setTo(estmember.getMem_mail());       //회원의 email로 전송
			messageHelper.setText("프로젝트 명 : "+projectInfo.getPro_tit()+"\n"+memberInfo.getMem_id()+"("+memberInfo.getMem_nm()+") 님께서 프로젝트에 지원하셨습니다.");//메일 본문
			messageHelper.setFrom("alsrb3346@gmail.com"); //보내는사람
			messageHelper.setSubject("제발개발에서 알려드립니다.");            // 메일제목은 생략이 가능하다
			mailSender.send(message);
		}// 이미 지원한 경우에
		else{
			messageTit = "프로젝트 지원 실패";
			messageCon = "이미 지원된 프로젝트 입니다. 확인 부탁드립니다. ";
			messageType = "error";
		}
		
		
		
		
		andView.addObject("messageTit", messageTit);
		andView.addObject("messageCon", messageCon);
		andView.addObject("messageType", messageType);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("/supportCnt")
	public ModelAndView supportCnt(String pro_num , ModelAndView andView, Map<String,String> params)throws Exception{
		params.put("pro_num", pro_num);
		int suppotCnt = service.supportCount(params);
		
		andView.addObject("suppotCnt", suppotCnt);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("/supportList")
	public ModelAndView supportList(String pro_num , ModelAndView andView, Map<String,String> params)throws Exception{
		params.put("pro_num", pro_num);
		List<SupportVO> supportList = service.getSupportList(params);
		andView.addObject("supportList", supportList);
		andView.setViewName("jsonConvertView");
		return andView;
	}

}
