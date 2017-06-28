package kr.or.plzdvl.dvrTest.controller;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.admin.dvrTest.service.QuizService;
import kr.or.plzdvl.admin.dvrTest.service.Quiz_optService;
import kr.or.plzdvl.admin.dvrTest.vo.QuizVO;
import kr.or.plzdvl.admin.dvrTest.vo.Quiz_optVO;
import kr.or.plzdvl.dvrTest.vo.SubjectVO;
import kr.or.plzdvl.subject.service.SubjectService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/quiz")
@Controller
public class QuizController {
	
	// 과목 Service
	@Autowired
	private SubjectService subjectService;
	
	// 문제 Service
	@Autowired
	private QuizService quizService;
	
	// 보기 Service
	@Autowired
	private Quiz_optService quiz_optService;
	
	
	@RequestMapping("quizForm")
	public ModelAndView inputTest(ModelAndView andView) throws Exception{
		List<SubjectVO> subjectList = subjectService.subjectList();
		int lastNum = quizService.lastQuizNum();
		andView.addObject("subjectList", subjectList);
		andView.addObject("lastNum", lastNum);
		andView.setViewName("quiz/quizForm");
		return andView;
	}
	
	@RequestMapping("quizList")
	public ModelAndView quizList(String sub_num, ModelAndView andView, Map<String, String> params ) throws Exception {
		params.put("sub_num", sub_num);
		List<QuizVO> quizList = quizService.quizList(params);
		andView.addObject("quizList", quizList);
		andView.setViewName("quiz/quizList");
		return andView;
	}
	
	@RequestMapping("quizView")
	public ModelAndView quizView(String quiz_num, ModelAndView andView, Map<String, String> params) throws Exception {
		params.put("quiz_num", quiz_num);
		QuizVO quizInfo = quizService.quizView(params);
		List<Quiz_optVO> optList = quiz_optService.optInfo(params);
		andView.addObject("optList", optList);
		andView.addObject("quizInfo", quizInfo);
		andView.setViewName("quiz/quizView");
		return andView;
	}
	
	@RequestMapping("quizDelete/{quiz_num}")
	public ModelAndView quizDelete(@PathVariable String quiz_num, Map<String, String> params, ModelAndView andView) throws Exception {
		params.put("quiz_num", quiz_num);
		
		quizService.quizDelete(params);
		andView.setViewName("quiz/quizList");
		return andView;
	}
	
	@RequestMapping("insertQuiz")
	public ModelAndView insertQuiz(ModelAndView andView, QuizVO quizInfo, Quiz_optVO optInfo) throws Exception {
		String quizNum = quizInfo.getQuiz_num();
		int currNum = Integer.parseInt(quizNum) + 1;
		String Num = Integer.toString(currNum);
		
		// 문제번호 ( 모든보기 동일해야함  ) 
		quizInfo.setQuiz_num(Num);
		
		quizService.insertQuiz(quizInfo);
		
		// 보기 등록 시작
		
		// 보기가 배열로 받아와짐 , 로 잘라야함
		String[] opt_con = optInfo.getOpt_con().split(",");
		String[] opt_wht = optInfo.getOpt_wht().split(",");
		
		
		for(int i = 0; i < opt_con.length; i++) {
			Quiz_optVO optInfo1 = new Quiz_optVO();
			optInfo1.setOpt_con(opt_con[i]);
			optInfo1.setOpt_wht(opt_wht[i]);
			optInfo1.setQuiz_num(Num);
			quiz_optService.insertQuizOpt(optInfo1);
		}
		
		
		
		andView.setViewName("redirect:/dvrTest/dvrTestList.do");
		return andView;
	}
	
	
}
