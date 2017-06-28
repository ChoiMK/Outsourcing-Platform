package kr.or.plzdvl.freelancer;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.carinfo.service.CarinfoService;
import kr.or.plzdvl.carinfo.vo.CarinfoVO;
import kr.or.plzdvl.member.service.MemberService;
import kr.or.plzdvl.member.vo.MemberFileVO;
import kr.or.plzdvl.portfolio.service.PortfolioService;
import kr.or.plzdvl.portfolio.vo.PortfolioFileVO;
import kr.or.plzdvl.tecinfo.service.TecinfoService;
import kr.or.plzdvl.tecinfo.vo.TecinfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/freelancer/")
public class FreelancerController {
	//회원
	@Autowired
	private MemberService memservice;
	//기술
	@Autowired
	private TecinfoService tecservice;
	//경력
	@Autowired
	private CarinfoService carservice;
	//포트폴리오
	@Autowired
	private PortfolioService porservice;
	
	
	@RequestMapping("freelancerList")
	public ModelAndView freelancerList(ModelAndView andView, 
			Map<String, String> params,
			String endNum,
			String startNum)throws Exception{
		
		if(endNum != null){
			andView.setViewName("jsonConvertView");
			startNum = String.valueOf(Integer.parseInt(endNum) + 1);
			endNum = String.valueOf(Integer.parseInt(endNum) + 8);
		}else{
			andView.setViewName("freelancer/freelancerList");
			startNum = "0";
			endNum = "0";
			endNum = String.valueOf(Integer.parseInt(endNum) + 8);
		}
		params.put("startNum", startNum);
		params.put("endNum", endNum);
		List<MemberFileVO> freelancerList = memservice.memberPicList(params);
		
		andView.addObject("freelancerList", freelancerList);
		return andView;
	}
	
	
	@RequestMapping("freelancerView")
	public ModelAndView freelancerView(ModelAndView andView, 
			Map<String, String>params,
			String mem_id)throws Exception{
		params.put("mem_id", mem_id);
		
		//회원정보
		MemberFileVO freelancerInfo = memservice.memberInfoAndPicInfo(params);
		//기술
		List<TecinfoVO> freelancerTecInfo = tecservice.getTecInfoList(params);
		//경력
		List<CarinfoVO> freelancerCarInfo = carservice.getCarInfoList(params);
		//포트폴리오
		List<PortfolioFileVO> freelancerPorInfo = porservice.getFileitemList(params);
		
		
		andView.setViewName("freelancer/freelancerView");
		andView.addObject("freelancerInfo",freelancerInfo);
		andView.addObject("freelancerTecInfo",freelancerTecInfo);
		andView.addObject("freelancerCarInfo",freelancerCarInfo);
		andView.addObject("freelancerPorInfo",freelancerPorInfo);
		
		return andView;
	}
	
	
	@RequestMapping("freeInfo")
	public ModelAndView freeInfo(ModelAndView andView, 
			Map<String, String>params,
			String mem_id)throws Exception{
		params.put("mem_id", mem_id);
		//회원정보
		MemberFileVO freelancerInfo = memservice.memberInfoAndPicInfo(params);
		andView.addObject("freelancerInfo",freelancerInfo);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
}
