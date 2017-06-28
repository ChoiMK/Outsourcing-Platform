package kr.or.plzdvl.comment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.plzdvl.comment.dao.CommtDao;
import kr.or.plzdvl.comment.vo.CommtVO;

@Service("commtService")
public class CommtServiceImpl implements CommtService{
	
	@Autowired
	private CommtDao dao;

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertCommt(CommtVO commtInfo) throws Exception {
		dao.insertCommt(commtInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateCommt(CommtVO commtInfo) throws Exception {
		int updateCnt = 0;
		updateCnt = dao.updateCommt(commtInfo);
		return updateCnt;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertCommtReply(CommtVO commtInfo) throws Exception {
		dao.insertCommtReply(commtInfo);
	}

	@Override
	public List<CommtVO> getCommtList(Map<String, String> params)
			throws Exception {
		List<CommtVO> commtList = null;
		commtList = dao.getCommtList(params);
		return commtList;
	}

	@Override
	public CommtVO getCommtInfo(Map<String, String> params) throws Exception {
		return dao.getCommtInfo(params);
	}

	@Override
	public String getcommtMaxturn(Map<String, String> params) throws Exception {
		return dao.getcommtMaxturn(params);
	}

	@Override
	public List<CommtVO> commtListreference(Map<String, String> params)
			throws Exception {
		List<CommtVO> commtList = null;
		commtList = dao.commtListreference(params);
		return commtList;
	}

}
