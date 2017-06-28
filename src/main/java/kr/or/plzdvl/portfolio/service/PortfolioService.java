package kr.or.plzdvl.portfolio.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.portfolio.vo.PortfolioFileVO;
import kr.or.plzdvl.portfolio.vo.PortfolioVO;

public interface PortfolioService {
	
	// 포트폴리오 등록
	public void insertPortfolio(PortfolioVO portfolioInfo) throws Exception;
		
	// 포트폴리오 수정
	public int updatePortfolio(PortfolioVO portfolioInfo) throws Exception;
		
	// 포트폴리오 리스트
	public List<PortfolioVO> getPortfolioList(Map<String, String> params) throws Exception;
		
	// 포트폴리오 상세보기
	public PortfolioVO getPortfolioInfo(Map<String, String> params) throws Exception;
	
	// 파일 리스트
	public List<PortfolioFileVO> getFileitemList(Map<String, String> params) throws Exception;

	//포트폴리오의 파일 삭제
	public void deletePortFileInfo(Map<String, String> params) throws Exception;
	
	// 포트폴리오 리스트 ( 메인에서 )
	public List<PortfolioFileVO> portfolioListMain() throws Exception;
}
