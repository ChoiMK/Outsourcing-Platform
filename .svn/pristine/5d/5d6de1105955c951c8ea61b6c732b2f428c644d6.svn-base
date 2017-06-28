package kr.or.plzdvl.support.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.plzdvl.support.dao.SupportDao;
import kr.or.plzdvl.support.vo.SupportVO;

@Service("supportService")
public class SupportServiceImpl implements SupportService{

	@Autowired
	private SupportDao dao;
	
	@Override
	public void insertSupport(SupportVO supportVO) throws Exception {
		dao.insertSupport(supportVO);
	}

	@Override
	public List<SupportVO> getSupportList(Map<String, String> params)
			throws Exception {
		List<SupportVO> supportList = null;
		supportList = dao.getSupportList(params);
		return supportList;
	}

	@Override
	public int supportCount(Map<String, String> params) throws Exception {
		int supportCountCnt = 0;
		supportCountCnt = dao.supportCount(params);
		return supportCountCnt;
	}

	@Override
	public void deleteSupportMember(SupportVO supportInfo) throws Exception {
		dao.deleteSupportMember(supportInfo);
	}

	@Override
	public SupportVO supportInfo(Map<String, String> params) throws Exception {
		return dao.supportInfo(params);
	}

}
