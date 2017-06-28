package kr.or.plzdvl.count.service;

public interface CountService {

	// 등록된 프로젝트
	public int projectCount() throws Exception;
		
	// 등록된 프리랜서
	public int freelancerCount() throws Exception;
		
	// 등록된 포트폴리오
	public int portfolioCount() throws Exception;
	
}
