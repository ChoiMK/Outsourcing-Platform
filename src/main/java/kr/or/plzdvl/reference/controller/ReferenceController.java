package kr.or.plzdvl.reference.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.plzdvl.comment.service.CommtService;
import kr.or.plzdvl.comment.vo.CommtVO;
import kr.or.plzdvl.dvrTest.service.DvrTestService;
import kr.or.plzdvl.fileitem.vo.FileitemVO;
import kr.or.plzdvl.member.service.MemberService;
import kr.or.plzdvl.member.vo.MemberVO;
import kr.or.plzdvl.reference.service.ReferenceService;
import kr.or.plzdvl.reference.vo.ReferenceVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/reference")
@Controller
public class ReferenceController {

	@Autowired
	private ReferenceService service;
	
	@Autowired
	private DvrTestService testService;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private CommtService commtservice;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	@Autowired
	private ApplicationContext context;	
	
	public List<FileitemVO> fileList;
	
	@RequestMapping("/referenceList")
	public ModelAndView referenceList2(ModelAndView andview, HashMap<String, String> params) throws Exception{
		List<ReferenceVO> referenceList = service.getReferenceList(params);
		andview.addObject("referenceList", referenceList);
		andview.setViewName("reference/referenceList");
		return andview;
	}
	
	@RequestMapping("/referenceForm")
	public ModelAndView projectForm(ModelAndView andView, String re_num) throws Exception{
		String abc= re_num;
		
		return andView;
	}
	
	@RequestMapping("/referenceView")
	private ModelAndView memberView(String re_num, ModelAndView andView, Map<String, String> params)
			throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_id", memberInfo.getMem_id());
		FileitemVO memfile = memberservice.getFileItemInfo(params);
		if(memfile != null){
			String mem_profile = memfile.getFile_save_nm();
			andView.addObject("mem_profile", mem_profile);
		}
		
		params.put("re_num", re_num);
		
		ReferenceVO referenceInfo = service.getReferenceInfo(params);
		List<CommtVO> commtList = commtservice.commtListreference(params);
		andView.addObject("commtList", commtList);
		andView.addObject("referenceInfo", referenceInfo);
		andView.setViewName("reference/referenceView");
		return andView;
	}
	
	@RequestMapping("/insertReferenceInfo")
	public String insertReferenceInfo(ReferenceVO referenceInfo) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		referenceInfo.setMem_id(memberInfo.getMem_id());
		service.insertReference(referenceInfo);
		
		return "redirect:/reference/referenceList.do";
	}

	@RequestMapping("deleteReference/{re_num}")
	public String deleteReferenceInfo(@PathVariable String re_num) throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("re_num", re_num);
		service.deleteReference(params);
		return "redirect:/reference/referenceList.do";
	}
	
	@RequestMapping("updateReference")
	public String updateReferenceInfo(ReferenceVO referenceInfo) throws Exception{
		service.updateReference(referenceInfo);
		return "redirect:/reference/referenceList.do";
	}
	
	@RequestMapping("goodReference/{re_num}")
	public String goodReferenceInfo(@PathVariable String re_num, Map<String, String> params) throws Exception{
		params.put("re_num", re_num);
		service.goodReference(params);
		return "redirect:/reference/referenceView.do";
	}
	
	
}	
