package kr.or.plzdvl.portfolio.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.plzdvl.portfolio.dao.PortfolioDao;
import kr.or.plzdvl.portfolio.vo.PortfolioFileVO;
import kr.or.plzdvl.portfolio.vo.PortfolioVO;

@Service("portfolioService")
public class PortfolioServiceImpl implements PortfolioService{

	@Autowired
	private PortfolioDao dao;
	
	@Override
	public void insertPortfolio(PortfolioVO portfolioInfo) throws Exception {
		dao.insertPortfolio(portfolioInfo);
		
	}

	@Override
	public int updatePortfolio(PortfolioVO portfolioInfo) throws Exception {
		int updateCnt = 0;
		updateCnt = dao.updatePortfolio(portfolioInfo);
		return updateCnt;
	}

	@Override
	public List<PortfolioVO> getPortfolioList(Map<String, String> params)
			throws Exception {
		List<PortfolioVO> portfolioList = null;
		portfolioList = dao.getPortfolioList(params);
		return portfolioList;
	}

	@Override
	public PortfolioVO getPortfolioInfo(Map<String, String> params)
			throws Exception {
		PortfolioVO portfolioInfo = null;
		portfolioInfo = dao.getPortfolioInfo(params);
		return portfolioInfo;
	}
	
	@Override
	public List<PortfolioFileVO> getFileitemList(Map<String, String> params)
			throws Exception {
		List<PortfolioFileVO> portfoliofileList = dao.getFileitemList(params);
		return portfoliofileList;
	}

	@Override
	public void deletePortFileInfo(Map<String, String> params) throws Exception {
		dao.deletePortfolio(params);
	}

	@Override
	public List<PortfolioFileVO> portfolioListMain() throws Exception {
		List<PortfolioFileVO> portfoliofileList = dao.portfolioListMain();
		return portfoliofileList;
	}

}
