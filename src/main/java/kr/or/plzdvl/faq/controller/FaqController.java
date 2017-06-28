package kr.or.plzdvl.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.plzdvl.faq.service.FaqService;
import kr.or.plzdvl.faq.vo.FaqVO;
import kr.or.plzdvl.member.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService serviceFaq;
	
	@Autowired
	private MemberService serviceMem;
	
	@RequestMapping("/faq")
	public ModelAndView faq(ModelAndView andView, Map<String, String> params) throws Exception{
		List<FaqVO> faqList = serviceFaq.getFaqList(params);
		
		andView.addObject("faqList", faqList);
		andView.setViewName("faq/faqList");
		return andView;
	}
	@RequestMapping("/faq/faqForm")
	public void faqForm(){
		
	}
	
	@RequestMapping("/faq/insertFaq")
	public String insertFaq(FaqVO faqInfo)throws Exception{
		serviceFaq.insertFaq(faqInfo);
		return "redirect:/faq.do";
	}
	
	@RequestMapping("/faq/deleteFaq/{faq_num}")
	public String deleteNotice(@PathVariable String faq_num )throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("faq_num",faq_num);
		
		serviceFaq.deleteFaqInfo(params);
		return "redirect:/faq.do";
	}

}