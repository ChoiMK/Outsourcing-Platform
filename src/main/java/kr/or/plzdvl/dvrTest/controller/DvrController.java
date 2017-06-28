package kr.or.plzdvl.dvrTest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@RequestMapping("/dvrTest2/")
@Controller
public class DvrController {
	@RequestMapping("/insertAnswer")
	public ModelAndView insertAnswer(ModelAndView andView)throws Exception{		
		System.out.println(">>insertAnswer");
//		testService.insertAnswer(solveVoList);
//		andView.setViewName("jsonConvertView");
//		andView.addObject("solveVo", solveVo);
		andView.setViewName("redirect:/main.do");
		return andView;
	}
}
