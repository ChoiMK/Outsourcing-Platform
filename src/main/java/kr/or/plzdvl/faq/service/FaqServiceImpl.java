package kr.or.plzdvl.faq.service;

import java.util.List;
import java.util.Map;

import org.bouncycastle.voms.VOMSAttribute.FQAN;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.plzdvl.faq.controller.FaqController;
import kr.or.plzdvl.faq.dao.FaqDao;
import kr.or.plzdvl.faq.vo.FaqVO;

@Service("faqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDao dao;
	private static Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	public FaqServiceImpl(){
		logger.debug("FaqServiceImpl의 생성자");
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertFaq(FaqVO faqInfo) throws Exception {
		dao.insertFaq(faqInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateFaqInfo(FaqVO faqInfo) throws Exception {
		int updateCnt = 0;
		updateCnt = dao.updateFaqInfo(faqInfo);
		return updateCnt;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteFaqInfo(Map<String, String> params) throws Exception {
		int deleteCnt = 0;
		deleteCnt = dao.deleteFaqInfo(params);
		return deleteCnt;
	}

	@Override
	public List<FaqVO> getFaqList(Map<String, String> params) throws Exception {
		List<FaqVO> FaqList = null;
		FaqList = dao.getFaqList(params);
		return FaqList;
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public FaqVO getFaqInfo(Map<String, String> params) throws Exception {
		FaqVO faqInfo = null;
		faqInfo = dao.getFaqInfo(params);
		return faqInfo;
	}

}
