package kr.or.plzdvl.carinfo.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.carinfo.dao.CarinfoDao;
import kr.or.plzdvl.carinfo.vo.CarinfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("carinfoService")
public class CarinfoServiceImpl implements CarinfoService{

	@Autowired
	private CarinfoDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertCarinfo(CarinfoVO carinfo) throws Exception {
		dao.insertCarinfo(carinfo);
		
	}

	@Override
	public List<CarinfoVO> getCarInfoList(Map<String, String> params)
			throws Exception {
		List<CarinfoVO> carinfoList = null;
		carinfoList = dao.getCarInfoList(params);
		return carinfoList;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteCarInfo(CarinfoVO carinfo) throws Exception {
		dao.deleteCarInfo(carinfo);
	}
}
