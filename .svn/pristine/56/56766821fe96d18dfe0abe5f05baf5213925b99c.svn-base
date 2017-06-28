package kr.or.plzdvl.project.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import kr.or.plzdvl.alarm.service.alarmService;
import kr.or.plzdvl.alarm.vo.AlarmVO;
import kr.or.plzdvl.comment.service.CommtService;
import kr.or.plzdvl.comment.vo.CommtVO;
import kr.or.plzdvl.fileitem.vo.FileitemVO;
import kr.or.plzdvl.meetingschedule.vo.MeetingVO;
import kr.or.plzdvl.member.service.MemberService;
import kr.or.plzdvl.member.vo.MemberVO;
import kr.or.plzdvl.project.service.ProjectService;
import kr.or.plzdvl.project.vo.ProjectVO;
import kr.or.plzdvl.tecinfo.service.TechnologyService;
import kr.or.plzdvl.tecinfo.vo.TechnologyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/project/")
public class ProjectController {
	
	@Autowired
	private TechnologyService serviceTech;
	@Autowired
	private ProjectService service;
	@Autowired
	private CommtService commtservice;
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private alarmService alarmservice;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("projectList")
	public ModelAndView projectList(String pro_dtn, ModelAndView andView, HashMap<String, String> params) throws Exception{
		params.put("pro_dtn", pro_dtn);
		List<ProjectVO> projectList = service.getProjectList(params);
		String message = "projectList";
		andView.setViewName("project/projectList");
		andView.addObject("projectList", projectList);
		andView.addObject("message", message);
		return andView;
	}
	
	@RequestMapping("projectForm")
	public ModelAndView projectForm(ModelAndView andView, String estmem_id) throws Exception{
		List<TechnologyVO> technologyList = serviceTech.technologyList();
		if(estmem_id != null){
			andView.addObject("estmem_id", estmem_id);
		}
		andView.addObject("technologyList",technologyList);
		andView.setViewName("project/projectForm");
		return andView;
	}
	
	@RequestMapping("projectUpdate")
	public ModelAndView projectUpdate(String est_req, ModelAndView andView,String pro_gress_con,
			String pro_cod_wht,String pro_st_date, String pro_sup_mem_id, String pro_num, Map<String,String> params
			, MeetingVO meetInfo) throws Exception{
		params.put("pro_num", pro_num);
		ProjectVO projectInfo = service.getProjectInfo(params);
		// 현제 클라이언트 회원 ID
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		// 클라이언트 알람 VO
		AlarmVO cntAlarm = new AlarmVO();
		if(projectInfo.getPro_sup_mem_id() == null){
			 projectInfo.setPro_sup_mem_id(pro_sup_mem_id);
		}
		// 메일을 보내기위한
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		// 지원자 아이디들을 배열로 저장
		String[] prosupMem = projectInfo.getPro_sup_mem_id().split(",");
			
		if(est_req != null){			// 견적 요청 회원이 있으면
			projectInfo.setPro_est_inq_wht(est_req);
		}
		if(pro_cod_wht != null){			// 상태여부가 있으면
			projectInfo.setPro_cod_wht(pro_cod_wht);
			// 클라이언트에게 보내질 알람
			String cntMessage = "프로젝트 명 : "+projectInfo.getPro_tit()+"\n"+"프로젝트의 상태가 "+pro_cod_wht+"(으)로 변경되었습니다.";
			cntAlarm.setAl_tit(cntMessage.replace("\n", "<br>"));
			cntAlarm.setMem_id(memberInfo.getMem_id());
			cntAlarm.setPro_num(pro_num);
			cntAlarm.setAl_url("project/projectView.do?pro_num="+pro_num);
			alarmservice.insertAlarm(cntAlarm);
			// 클라이언트에게 보내는 메일
			messageHelper.setTo(memberInfo.getMem_mail());       //회원의 email로 전송
			messageHelper.setText("프로젝트 명 : "+projectInfo.getPro_tit()+"\n"+"프로젝트의 상태가 "+pro_cod_wht+"(으)로 변경되었습니다.".replace("\n", "<br>"));//메일 본문
			messageHelper.setFrom("alsrb3346@gmail.com"); //보내는사람
			messageHelper.setSubject("제발개발에서 알려드립니다.");            // 메일제목은 생략이 가능하다
			mailSender.send(message);
			
			for(int i=0; i<prosupMem.length; i++){
				String me_free_id = prosupMem[i].trim();
				int idx = me_free_id.indexOf("(");
				String fixfree_id = me_free_id.substring(0, idx);
				//프리랜서 들에게 보내질 알람
				String freeMessage = "프로젝트 명 : "+projectInfo.getPro_tit()+"\n"+"프로젝트의 상태가 "+pro_cod_wht+"(으)로 변경되었습니다.";
				cntAlarm.setAl_tit(freeMessage.replace("\n", "<br>"));
				cntAlarm.setMem_id(fixfree_id);
				cntAlarm.setPro_num(pro_num);
				cntAlarm.setAl_url("project/projectView.do?pro_num="+pro_num);
				alarmservice.insertAlarm(cntAlarm);
				// 프리랜서의 정보를 가져옴
				params.put("mem_id", fixfree_id);
				MemberVO freeInfo = memberservice.getMemberInfo(params);
				// 프리랜서들에게 보내는 메일
				messageHelper.setTo(freeInfo.getMem_mail());       //회원의 email로 전송
				messageHelper.setText("프로젝트 명 : "+projectInfo.getPro_tit()+"\n"+"프로젝트의 상태가 "+pro_cod_wht+"(으)로 변경되었습니다.");//메일 본문
				messageHelper.setFrom("alsrb3346@gmail.com"); //보내는사람
				messageHelper.setSubject("제발개발에서 알려드립니다.");            // 메일제목은 생략이 가능하다
				mailSender.send(message);
			}
		}
		if(pro_sup_mem_id != null){			// 지원자가 있으면
		projectInfo.setPro_sup_mem_id(pro_sup_mem_id);
		}
		if(pro_gress_con != null){    		// 프로젝트 버튼 상태가 있으면
		projectInfo.setPro_gress_con(pro_gress_con);
		}
		if(pro_st_date != null){
			projectInfo.setPro_st_date(pro_st_date);
		}
		service.updateProJectInfo(projectInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("insertProjectInfo")
	public ModelAndView insertProject(ModelAndView andView,
			ProjectVO projectInfo) throws Exception{
		
		service.insertProJect_N(projectInfo);
		andView.setViewName("redirect:/project/projectList.do");
		return andView;
	}
	
	@RequestMapping("insertProjectEst")
	public ModelAndView insertProjectEst(ModelAndView andView,
			ProjectVO projectInfo, String estmem_id, AlarmVO alarmInfo, Map<String,String> params) throws Exception{
		params.put("mem_id", estmem_id);
		MemberVO estmember = memberservice.getMemberInfo(params);
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String alarmMessage = memberInfo.getMem_id()+"("+memberInfo.getMem_nm()+") 님께서 프로젝트 견적문의를 요청하셨습니다.";
		
		projectInfo.setPro_est_req_mem_id(estmem_id);
		service.insertProJect_Y(projectInfo);
		
		String pro_num = projectInfo.getPro_num();
		
		alarmInfo.setAl_tit(alarmMessage);
		alarmInfo.setMem_id(estmem_id);
		alarmInfo.setPro_num(pro_num);
		alarmInfo.setAl_url("project/projectView.do?pro_num="+pro_num);
		alarmservice.insertAlarm(alarmInfo);
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		messageHelper.setTo(estmember.getMem_mail());       //회원의 email로 전송
		messageHelper.setText("프로젝트 명 : "+projectInfo.getPro_tit()+"\n"+memberInfo.getMem_id()+"("+memberInfo.getMem_nm()+") 님께서 프로젝트 견적문의를 요청하셨습니다.");//메일 본문
		messageHelper.setFrom("alsrb3346@gmail.com"); //보내는사람
		messageHelper.setSubject("제발개발에서 알려드립니다.");            // 메일제목은 생략이 가능하다
		
		mailSender.send(message);
		
		andView.setViewName("redirect:/freelancer/freelancerList.do");
		return andView;
	}
	
	@RequestMapping("projectView")
	public ModelAndView projectView(String pro_num, ModelAndView andView, Map<String,String> params) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_id", memberInfo.getMem_id());
		FileitemVO memfile = memberservice.getFileItemInfo(params);
		if(memfile != null){
		String mem_profile = memfile.getFile_save_nm();
		andView.addObject("mem_profile", mem_profile);
		}
		
		params.put("pro_num", pro_num);
		String message = "projectView";
		int d_day = service.d_daySelect(params);
		ProjectVO projectInfo = service.getProjectInfo(params);
		List<CommtVO> commtList = commtservice.getCommtList(params);
		andView.addObject("commtList", commtList);
		andView.addObject("projectInfo", projectInfo);
		andView.addObject("d_day", d_day);
		andView.setViewName("project/projectView");
		andView.addObject("message", message);
		return andView;
	}
	
	@RequestMapping("delajaxproject")
	public ModelAndView delajaxproject(String pro_num, ModelAndView andView, Map<String,String> params) throws Exception{
		params.put("pro_num", pro_num);
		service.deleteProJectInfo(params);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
	@RequestMapping("projectInfo")
	public ModelAndView projectInfo(ModelAndView andView, String pro_num, Map<String,String> params) throws Exception{
		params.put("pro_num", pro_num);
		ProjectVO projectInfo = service.getProjectInfo(params);
		andView.addObject("projectInfo", projectInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("delproject")
	public ModelAndView delproject(String pro_num, ModelAndView andView, Map<String,String> params) throws Exception{
		params.put("pro_num", pro_num);
		service.deleteProJectInfo(params);
		andView.setViewName("redirect:/project/projectList.do");
		return andView;
	}
	
	// 상태를 눌렀을때 다시 로드되어야 할 프로젝트 리스트를 출력한다.
		@RequestMapping("projectreload")
		public ModelAndView mypageProject(ModelAndView andView, Map<String, String> params, String pro_cod_wht) throws Exception{
			if(pro_cod_wht.equals("전체")){
				pro_cod_wht ="";
			}
			MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
			params.put("pro_cod_wht", pro_cod_wht);
			
			// 프리랜서라면 견적문의 요청한 것은 프로젝트 리스트에 보이지않는다.
			if( memberInfo.getMem_type()=="F"){
				String est_req = "N";
				params.put("est_req", est_req);
			}
			params.put("mem_id", memberInfo.getMem_id());
			List<ProjectVO> projectList = service.clientProjectList(params);
			
			andView.addObject("projectList", projectList);
			andView.setViewName("jsonConvertView");
			return andView;
		}
	
	
	@RequestMapping("/DdayCnt")
	public ModelAndView DdayCnt(String pro_num , ModelAndView andView, Map<String,String> params)throws Exception{
		params.put("pro_num", pro_num);
		int DdayCnt = service.d_daySelect(params);
		
		andView.addObject("DdayCnt", DdayCnt);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
	
}



