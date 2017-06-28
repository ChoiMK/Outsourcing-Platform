package kr.or.plzdvl.dvrTest.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.plzdvl.admin.dvrTest.service.Quiz_optService;
import kr.or.plzdvl.admin.dvrTest.service.SolveService;
import kr.or.plzdvl.admin.dvrTest.vo.Quiz_optVO;
import kr.or.plzdvl.dvrTest.service.DvrTestService;
import kr.or.plzdvl.dvrTest.vo.QuizOptVO;
import kr.or.plzdvl.dvrTest.vo.QuizVO;
import kr.or.plzdvl.dvrTest.vo.SolveVO;
import kr.or.plzdvl.fileitem.vo.FileitemVO;
import kr.or.plzdvl.member.service.MemberService;
import kr.or.plzdvl.member.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/dvrTest")
@Controller
public class DvrTestController {

	@Autowired	
	private DvrTestService testService;
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	@Autowired
	private ApplicationContext context;	
	@Autowired
	private Quiz_optService optService;
	@Autowired
	private SolveService solveService;
	@Autowired
	private MemberService memService;
	
	public List<FileitemVO> fileList;
	
	@RequestMapping("/dvrTestList")
	public ModelAndView dvrTest(ModelAndView andView) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("dvrTest/dvrTest");
		
		return andView;
	}
	
	@RequestMapping("/dvrTestQue")
	public ModelAndView dvrTestQue(String dvr_sub, int quiz_num, ModelAndView modelView, @RequestParam Map<String, String> params) throws Exception{
		
		String sub_num = "";
		if(dvr_sub.equals("OS")){
			sub_num = "1";
		} else if ( dvr_sub.equals("JavaScript")){
			sub_num = "2";
		} else if ( dvr_sub.equals("SQL")){
			sub_num = "3";
		} else if ( dvr_sub.equals("HTML")){
			sub_num = "4";
		} else if ( dvr_sub.equals("CSS")){
			sub_num = "5";
		} else if ( dvr_sub.equals("JAVA")){
			sub_num = "6";
		} else if ( dvr_sub.equals("JSP")){
			sub_num = "7";
		}
		
		params.put("sub_num", sub_num);
		List<QuizVO> quizList = testService.getQuizInfo(params);
		// 퀴즈 내용
		List<String> quiz_con = new ArrayList<String>();
		
		// 퀴즈 번호
		List<String> num = new ArrayList<String>();
		
		for( QuizVO quizInfo : quizList) {
			quiz_con.add(quizInfo.getQuiz_con());
			num.add(quizInfo.getQuiz_num());
		}
		
		String[] quizCon = new String[quiz_con.size()];
		quizCon = quiz_con.toArray(quizCon);
		
		String[] numArray = new String[num.size()];
		numArray = num.toArray(numArray);
		
		modelView.setViewName("jsonConvertView");
		modelView.addObject("quizInfo", quizCon[quiz_num]);
		modelView.addObject("quizNum", numArray[quiz_num]);
		
		
		return modelView;
	}
	
	@RequestMapping("/dvrTestOpt")
	@ResponseBody
	public ModelAndView dvrTestOpt(String quiz_num, ModelAndView andView, @RequestParam Map<String, String> params) throws Exception{
		
		params.put("quiz_num", quiz_num);
		
		List<QuizOptVO> quizOptInfoList = testService.getQuizOptInfoList(params);
		
		andView.setViewName("jsonConvertView");
		andView.addObject("quizOptInfo", quizOptInfoList);
		
		return andView;
		
	}
	
	@RequestMapping("/insertAnswer")
	@ResponseBody
	public ModelAndView insertAnswer(ModelAndView andView, String answ1, String answ2, String answ3, String answ4, String answ5,
			String answ6, String answ7, String answ8, String answ9, String answ10, String dvr_sub)throws Exception{		
		
		List<Quiz_optVO> optList = optService.optList();
		
		List<String> opt_wht = new ArrayList<String>();
		
		for(Quiz_optVO optInfo : optList) {
			// 만약 이 리스트와 회원이 고른 답의 내용이 같은 정답여부 출력
			
			if ( answ1.equals(optInfo.getOpt_con()) ) {
				opt_wht.add(optInfo.getOpt_wht());
			}
			if ( answ2.equals(optInfo.getOpt_con()) ) {
				opt_wht.add(optInfo.getOpt_wht());
			}
			if ( answ3.equals(optInfo.getOpt_con()) ) {
				opt_wht.add(optInfo.getOpt_wht());
			}
			if ( answ4.equals(optInfo.getOpt_con()) ) {
				opt_wht.add(optInfo.getOpt_wht());
			}
			if ( answ5.equals(optInfo.getOpt_con()) ) {
				opt_wht.add(optInfo.getOpt_wht());
			}
			if ( answ6.equals(optInfo.getOpt_con()) ) {
				opt_wht.add(optInfo.getOpt_wht());
			}
			if ( answ7.equals(optInfo.getOpt_con()) ) {
				opt_wht.add(optInfo.getOpt_wht());
			}
			if ( answ8 == optInfo.getOpt_con() ) {
				opt_wht.add(optInfo.getOpt_wht());
			}
			if ( answ9.equals(optInfo.getOpt_con()) ) {
				opt_wht.add(optInfo.getOpt_wht());
			}
			if ( answ10.equals(optInfo.getOpt_con()) ) {
				opt_wht.add(optInfo.getOpt_wht());
			}
		}
		
		// 정답의 갯수
		int count = 0;
		
		for(String t : opt_wht) {
			if( t.equals("T") ){
				count = count + 1;
			}
		}
		
		
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", memberInfo.getMem_id());
		params.put("sub_num", dvr_sub);
		
		if( dvr_sub.equals("운영체제")) {
			dvr_sub = "OS";
		} 
		
		
		SolveVO solveInfo3 = solveService.solveList(params);
		// 만약 SOLVE 테이블에 기존 값이 없다면.
		if ( solveInfo3 == null) {
			solveInfo3 = new SolveVO();
			solveInfo3.setMem_id(memberInfo.getMem_id());
			solveInfo3.setSol_rate(String.valueOf(count));
			solveInfo3.setSub_num(dvr_sub);
			solveService.insertSovle(solveInfo3);
		} else {
			solveInfo3.setMem_id(memberInfo.getMem_id());
			solveInfo3.setSol_rate(String.valueOf(count));
			solveInfo3.setSub_num(dvr_sub);
			solveService.updateSolve(solveInfo3);
		}
		
		// 여기서부터 타이틀을 뽑아낼꺼임
		Map<String, String> params1 = new HashMap<String, String>();
		params1.put("mem_id", memberInfo.getMem_id());
		List<SolveVO> MemSolveList = solveService.solveMemList(params1);
		
		String title = new String(); 
		for(SolveVO solveInfo : MemSolveList) {
			int num = Integer.parseInt(solveInfo.getSol_rate());
			if( num >= 0 && num <= 3) {
				title = title + solveInfo.getSub_num()+"_B,";
			} else if ( num > 3 && num < 8) {
				title = title + solveInfo.getSub_num()+"_M,";
			} else if ( num >= 8) {
				title = title + solveInfo.getSub_num()+"_H,";
			}
		}
		
		// 타이틀 등록
		memberInfo.setMem_tig_nm(title);
		memService.insertMemTitle(memberInfo);

		andView.setViewName("redirect:/dvrTest/dvrTestList");

		return andView;
	}
	
	
}	
