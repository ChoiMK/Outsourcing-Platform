package kr.or.plzdvl.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.plzdvl.member.service.MemberService;
import kr.or.plzdvl.member.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.supercsv.cellprocessor.ParseDouble;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("insertMemberInfo")
	public ModelAndView insertMember(MemberVO memberInfo,
			ModelAndView andView) throws Exception{
		service.insertMemberInfo(memberInfo);
		andView.setViewName("redirect:/main.do");
		return andView;
	}
	
	@RequestMapping("naverinsertMember")
	public ModelAndView naverinsertMember(MemberVO memberInfo,
			ModelAndView andView, Map<String, String> params, HttpSession session) throws Exception{
		params.put("mem_id", memberInfo.getMem_id());
		MemberVO result = service.getMemberInfo(params);
		if(result == null){
			service.insertMemberInfo(memberInfo);
			andView.setViewName("mypage/mypageBase");
		}else{
			andView.setViewName("redirect:/main.do");
		}
		memberInfo = service.getMemberInfo(params);
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("redirect:/baseMng.do");
		return andView;
	}
	
	@RequestMapping("memberList")
	public ModelAndView memberList(String mem_type, ModelAndView andView, Map<String, String> params) throws Exception{
		params.put("mem_type", mem_type);
		List<MemberVO> memberList = service.memberList(params);
		andView.addObject("memberList", memberList);
		andView.setViewName("member/memberList");
		return andView;
	}
	
	@RequestMapping("updatestarInfo")
	public ModelAndView updatestarInfo(ModelAndView cmk, Map<String, String> params, String starnum, String mem_id) throws Exception{
		String mem_idArr[]= mem_id.split(",");
		String starArr[]= starnum.split(",");
		
		for(int i=0 ; i<mem_idArr.length ; i++){
		params.put("mem_id", mem_idArr[i]);
		MemberVO memberInfo = service.getMemberInfo(params);
		// 현재 진행한 프로젝트 횟수 에서 +1해줌
		double pro_count = Double.parseDouble(memberInfo.getMem_pro_count())+1;
		// 현재 진행한 프로젝트의 별점과 지금까지의 총점을 더해줌
		double star_sum = Double.parseDouble(starArr[i]) + Double.parseDouble(memberInfo.getMem_star_sum());
		//  총점에서 나눈후 소수점 첫번째 자리에서 반올림 후 저장
		String starEndnum = Double.toString( (Math.round((star_sum/pro_count)*10.0)/10.0) );
		// 값을 .으로 나눈다
		String starEndArr[] = starEndnum.trim().split("\\.");
		// 나눈값들을 다시 int형으로 불리
		int starnum1 = Integer.parseInt(starEndArr[0]);
		int starnum2 = Integer.parseInt(starEndArr[1]);
		//4~6이면 그냥 5 
		if(Integer.parseInt(starEndArr[1])> 3 && Integer.parseInt(starEndArr[1])< 7){
			starnum2 = 5;
		//7보다 크면 1플러스
		}else if(Integer.parseInt(starEndArr[1])> 6 && Integer.parseInt(starEndArr[1])< 10){
			 starnum1 = Integer.parseInt(starEndArr[0]) + 1;
			 starnum2 =  0;
		//아니면 그냥 짜름
		}else{
			starnum2 =  0;
		}
		//스트링형태기이 때문에 더해서 보내줌
		String sumstarnums = starnum1+"."+starnum2;
		
		// 프로젝트 횟수를 추가해줌
		memberInfo.setMem_pro_count(Double.toString(pro_count));
		// 회원의 평점을 넣어줌
		memberInfo.setMem_grd(sumstarnums);
		
		memberInfo.setMem_star_sum(Double.toString(star_sum));
		service.updateMemberInfo(memberInfo);
		}
		
		cmk.setViewName("redirect:/projectMng.do");
		return cmk;
	}
}
