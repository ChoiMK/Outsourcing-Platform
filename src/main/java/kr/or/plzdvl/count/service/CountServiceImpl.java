package kr.or.plzdvl.count.service;

import kr.or.plzdvl.count.dao.CountDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("countService")
public class CountServiceImpl implements CountService {

	@Autowired
	private CountDao dao;
	
	@Override
	public int projectCount() throws Exception {
		int projectCount = dao.projectCount();
		return projectCount;
	}

	@Override
	public int freelancerCount() throws Exception {
		int freelancerCount = dao.freelancerCount();
		return freelancerCount;
	}

	@Override
	public int portfolioCount() throws Exception {
		int portfolioCount = dao.portfolioCount();
		return portfolioCount;
	}

}
