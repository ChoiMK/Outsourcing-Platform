package kr.or.plzdvl.portfolio.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.fileitem.vo.FileitemVO;
import kr.or.plzdvl.member.vo.MemberVO;
import kr.or.plzdvl.portfolio.vo.PortfolioFileVO;
import kr.or.plzdvl.portfolio.vo.PortfolioVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("portfolioDao")
public class PortfolioDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 포트폴리오 등록 & 파일등록
	public void insertPortfolio(PortfolioVO portfolioInfo) throws Exception {
		sqlSession.insert("portfolio.insertPortfolio", portfolioInfo);
		
		List<FileitemVO> fileItemList = portfolioInfo.getAttachFileItemList();
		
		for(FileitemVO fileItemInfo : fileItemList) {
			fileItemInfo.setFile_bod_num(portfolioInfo.getPo_num());
			sqlSession.insert("portfolio.insertFileItem", fileItemInfo);
		}
	}
	
	// 포트폴리오 수정
	public int updatePortfolio(PortfolioVO portfolioInfo) throws Exception {
		return sqlSession.update("portfolio.updatePortfolio",portfolioInfo);
	}
	
	// 포트폴리오 리스트
	public List<PortfolioVO> getPortfolioList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("portfolio.portfolioList", params);
	}
	
	// 포트폴리오 상세보기
	public PortfolioVO getPortfolioInfo(Map<String, String> params) throws Exception {
		return (PortfolioVO) sqlSession.selectOne("portfolio.portfolioInfo", params);
	}

	// 포트폴리오 & 파일 리스트
	public List<PortfolioFileVO> getFileitemList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("portfolio.fileitemList", params);
	}
	
	// 파일 삭제
	public void deletePortfolio(Map<String, String> params) throws Exception {
		sqlSession.selectOne("portfolio.deletePortfolio", params);
	}
	
	// 포트폴리오 리스트 ( 메인에서 )
	public List<PortfolioFileVO> portfolioListMain() throws Exception {
		return sqlSession.selectList("portfolio.portfolioListMain");
	}
}
