package kr.or.plzdvl.comment.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.plzdvl.alarm.service.alarmService;
import kr.or.plzdvl.alarm.vo.AlarmVO;
import kr.or.plzdvl.comment.service.CommtService;
import kr.or.plzdvl.comment.vo.CommtVO;
import kr.or.plzdvl.fileitem.vo.FileitemVO;
import kr.or.plzdvl.member.service.MemberService;
import kr.or.plzdvl.member.vo.MemberVO;
import kr.or.plzdvl.project.service.ProjectService;
import kr.or.plzdvl.project.vo.ProjectVO;
import kr.or.plzdvl.reference.service.ReferenceService;
import kr.or.plzdvl.reference.vo.ReferenceVO;

@Controller
public class CommentController {
	@Autowired
	private CommtService service;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private HttpSession session;
	@Autowired
	private alarmService alarmservice;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private ReferenceService referenceService;
	@Autowired
	private CommtService commtService;
	
	@RequestMapping("/insertcommt")
	public ModelAndView insertcommt(ModelAndView andView, String pro_num, String re_num, CommtVO commtInfo, Map<String, String> params)throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_id", memberInfo.getMem_id());
		FileitemVO memfile = memberservice.getFileItemInfo(params);
		
		if( re_num == null) {
			params.put("pro_num", pro_num);
			commtInfo.setCom_loc(pro_num);
		}
		if ( pro_num == null ) {
			params.put("re_num", re_num);
			commtInfo.setCom_loc(re_num);
		}
		
		commtInfo.setMem_nm(memberInfo.getMem_nm());
		commtInfo.setMem_id(memberInfo.getMem_id());
		if(memfile!=null){ // 파일이 있으면
		commtInfo.setMem_profile(memfile.getFile_save_nm());
		}
		// 댓글 인설트
		service.insertCommt(commtInfo);
		
		
		
		if( re_num == null) {
			AlarmVO alarmInfo = new AlarmVO();
			ProjectVO projectInfo = projectService.getProjectInfo(params);
			alarmInfo.setAl_tit(memberInfo.getMem_id()+"("+memberInfo.getMem_nm()+") 님이 프로젝트에 댓글을 등록하셨습니다.");
			alarmInfo.setMem_id(projectInfo.getMem_id());
			alarmInfo.setPro_num(pro_num);
			alarmInfo.setAl_url("project/projectView.do?pro_num="+pro_num);
			// 자신이 댓글을 입력한것을 제외
			if(!projectInfo.getMem_id().equals(memberInfo.getMem_id())){
				alarmservice.insertAlarm(alarmInfo);
			}
			List<CommtVO> commtList = service.getCommtList(params);
			andView.addObject("commtList", commtList);
			
		}
		if ( pro_num == null ) {
			AlarmVO alarmInfo = new AlarmVO();
			ReferenceVO referenceInfo = referenceService.getReferenceInfo(params);
			alarmInfo.setAl_tit(memberInfo.getMem_id()+"("+memberInfo.getMem_nm()+") 님이 게시물에 댓글을 등록하셨습니다.");
			alarmInfo.setMem_id(referenceInfo.getMem_id());
			alarmInfo.setPro_num(re_num);
			alarmInfo.setAl_url("reference/referenceView.do?re_num="+re_num);
			// 자신이 댓글을 입력한것을 제외
			if(!memberInfo.getMem_id().equals(referenceInfo.getMem_id())){
				alarmservice.insertAlarm(alarmInfo);
			}
			List<CommtVO> commtList = service.commtListreference(params);
			andView.addObject("commtList", commtList);
			
		}
		
		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("/insertreplycommt")
	public ModelAndView insertreplycommt(ModelAndView andView, String com_num,
			String re_num, String pro_num, CommtVO commtInfo,
			Map<String, String> params) throws Exception {
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_id", memberInfo.getMem_id());
		FileitemVO memfile = memberservice.getFileItemInfo(params);

		params.put("com_num", com_num);

		if (re_num == null) {
			params.put("pro_num", pro_num);
		}
		if (pro_num == null) {
			params.put("re_num", re_num);
		}
		// 가장 높은 순번
		String maxnum = service.getcommtMaxturn(params);
		String maxnumdex = String.valueOf(Integer.parseInt(maxnum) + 1);
		
		commtInfo.setMem_nm(memberInfo.getMem_nm());

		if (re_num == null) {
			commtInfo.setCom_loc(pro_num);
		}
		if (pro_num == null) {
			commtInfo.setCom_loc(re_num);
		}
		commtInfo.setMem_id(memberInfo.getMem_id());
		commtInfo.setCom_gr_num(com_num);
		commtInfo.setCom_turn(maxnumdex);
		commtInfo.setCom_dep("1");
		if (memfile != null) {
			commtInfo.setMem_profile(memfile.getFile_save_nm());
		}

		service.insertCommtReply(commtInfo);
		// 부모의 댓글
		CommtVO parentInfo = commtService.getCommtInfo(params); 
		if (re_num == null) {
			
			AlarmVO alarmInfo = new AlarmVO();
			ProjectVO projectInfo = projectService.getProjectInfo(params);
			alarmInfo.setAl_tit(memberInfo.getMem_id()+"("+memberInfo.getMem_nm()+") 님이 프로젝트에 댓글을 등록하셨습니다.");
			alarmInfo.setMem_id(projectInfo.getMem_id());
			alarmInfo.setPro_num(pro_num);
			alarmInfo.setAl_url("project/projectView.do?pro_num="+pro_num);
			// 자신이 댓글을 입력한것을 제외
			if(!projectInfo.getMem_id().equals(memberInfo.getMem_id())){
				alarmservice.insertAlarm(alarmInfo);
			}
			alarmInfo.setAl_tit(memberInfo.getMem_id()+"("+memberInfo.getMem_nm()+") 님이 회원님의 글에 댓글을 등록하셨습니다.");
			alarmInfo.setMem_id(parentInfo.getMem_id());
			// 자신이 댓글을 입력한것을 제외
			if(!parentInfo.getMem_id().equals(projectInfo.getMem_id())){
				alarmservice.insertAlarm(alarmInfo);
			}
			List<CommtVO> commtList = service.getCommtList(params);
			andView.addObject("commtList", commtList);
		}
		if (pro_num == null) {
			AlarmVO alarmInfo = new AlarmVO();
			ReferenceVO referenceInfo = referenceService.getReferenceInfo(params);
			alarmInfo.setAl_tit(memberInfo.getMem_id()+"("+memberInfo.getMem_nm()+") 님이 게시물에 댓글을 등록하셨습니다.");
			alarmInfo.setMem_id(referenceInfo.getMem_id());
			alarmInfo.setPro_num(re_num);
			alarmInfo.setAl_url("reference/referenceView.do?re_num="+re_num);
			// 자신이 댓글을 입력한것을 제외
			if(!memberInfo.getMem_id().equals(referenceInfo.getMem_id())){
				alarmservice.insertAlarm(alarmInfo);
			}
			alarmInfo.setAl_tit(memberInfo.getMem_id()+"("+memberInfo.getMem_nm()+") 님이 회원님의 글에 댓글을 등록하셨습니다.");
			alarmInfo.setMem_id(parentInfo.getMem_id());
			// 자신이 댓글을 입력한것을 제외
			if(!referenceInfo.getMem_id().equals(parentInfo.getMem_id())){
				alarmservice.insertAlarm(alarmInfo);
			}
			List<CommtVO> commtList = service.commtListreference(params);
			andView.addObject("commtList", commtList);
		}

		andView.setViewName("jsonConvertView");
		return andView;
	}

}
