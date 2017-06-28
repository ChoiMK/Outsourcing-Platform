package kr.or.plzdvl.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.plzdvl.notice.service.NoticeService;
import kr.or.plzdvl.notice.vo.NoticeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lowagie.tools.handout_pdf;

@Controller
@RequestMapping("/notice/")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping("noticeList")
	public ModelAndView noticeList(ModelAndView andview, HashMap<String, String> params)throws Exception{
		List<NoticeVO> noticeList = service.getNoticeList(params);
		andview.addObject("noticeList", noticeList);
		andview.setViewName("notice/noticeList");
		return andview;
	}
	
	@RequestMapping("noticeForm")
	public void noticeForm(){
	}
	
	@RequestMapping("insertNotice")
	public String insertNotice(NoticeVO noticeInfo )throws Exception{
		service.insertNotice(noticeInfo);
		return "redirect:/notice/noticeList.do";
	}
	
	@RequestMapping("noticeView/{nbod_num}")
	public ModelAndView noticeView(ModelAndView andView, @PathVariable String nbod_num)throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("nbod_num", nbod_num);
		
		NoticeVO noticeInfo = service.getNoticeInfo(params);
		andView.addObject("noticeInfo", noticeInfo);
		andView.setViewName("notice/noticeView");
		return andView;
	}
	
	@RequestMapping("deleteNotice/{nbod_num}")
	public String deleteNotice(@PathVariable String nbod_num)throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("nbod_num", nbod_num);
		
		service.deleteNoticeInfo(params);
		return "redirect:/notice/noticeList.do";
	}
	
//	@RequestMapping("updateNotice")
//	public String updateNotice(NoticeVO noticeInfo)throws Exception{
//		
// 		service.updateNoticeInfo(noticeInfo);
// 		return "redirect:/notice/noticeList.do";
//	}
	
	@RequestMapping("updateNotice")
	public String updateNotice(NoticeVO noticeInfo)throws Exception{
		service.updateNoticeInfo(noticeInfo);
		return "redirect:/notice/noticeList.do";
	}

}
