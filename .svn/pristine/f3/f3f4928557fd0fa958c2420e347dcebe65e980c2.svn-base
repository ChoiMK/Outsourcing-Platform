package kr.or.plzdvl.reference.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.plzdvl.reference.dao.ReferenceDao;
import kr.or.plzdvl.reference.vo.ReferenceVO;
@Service("referenceService")
public class ReferenceServiceImpl implements ReferenceService {

	@Autowired
	private ReferenceDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertReference(ReferenceVO referenceInfo) throws Exception {
		dao.insertReference(referenceInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateReference(ReferenceVO referenceInfo) throws Exception {
		int updateCnt = 0;
		updateCnt = dao.updateReference(referenceInfo);
		return updateCnt;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteReference(Map<String, String> params) throws Exception {
		int deleteCnt = 0;
		deleteCnt = dao.deleteReference(params);
		return deleteCnt;
	}

	@Override
	public List<ReferenceVO> getReferenceList(Map<String, String> params)
			throws Exception {
		List<ReferenceVO> referenceList = null;
		referenceList = dao.getReferenceList(params);
		return referenceList;
	}

	@Override
	public ReferenceVO getReferenceInfo(Map<String, String> params)
			throws Exception {
		ReferenceVO referenceInfo = null;
		referenceInfo = dao.getReferenceInfo(params);
		return referenceInfo;
	}

	@Override
	public int goodReference(Map<String, String> params) throws Exception {
		int good = dao.goodReference(params);
		return good;
	}

}
