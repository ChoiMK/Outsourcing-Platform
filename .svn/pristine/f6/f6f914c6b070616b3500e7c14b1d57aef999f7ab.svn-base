package kr.or.plzdvl.index;

import java.util.List;

import kr.or.plzdvl.count.service.CountService;
import kr.or.plzdvl.portfolio.service.PortfolioService;
import kr.or.plzdvl.portfolio.vo.PortfolioFileVO;
import kr.or.plzdvl.project.service.ProjectService;
import kr.or.plzdvl.project.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class IndexController {
	@Autowired
	public PortfolioService service;
	@Autowired
	public ProjectService projectService;
	@Autowired
	public CountService countService;
	
	@RequestMapping("/main")
	public ModelAndView index(ModelAndView andView) throws Exception{
		List<PortfolioFileVO> portfolioFileList = service.portfolioListMain();
		List<ProjectVO> projectList = projectService.projectListMain();
		
		projectService.d_dayupdate();
		
		int projectCount = countService.projectCount();
		int freelancerCount = countService.freelancerCount();
		int portfolioCount = countService.portfolioCount();
		
		andView.addObject("portfolioFileList", portfolioFileList);
		andView.addObject("projectList", projectList);
		andView.addObject("portfolioCount", portfolioCount);
		andView.addObject("freelancerCount", freelancerCount);
		andView.addObject("projectCount", projectCount);
		andView.setViewName("index/index");
		return andView;
	}
}
