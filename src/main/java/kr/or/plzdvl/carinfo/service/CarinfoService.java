package kr.or.plzdvl.carinfo.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.carinfo.vo.CarinfoVO;

public interface CarinfoService {

	public void insertCarinfo(CarinfoVO carinfo) throws Exception;
	public List<CarinfoVO> getCarInfoList(Map<String, String> params) throws Exception;
	public void deleteCarInfo(CarinfoVO carinfo) throws Exception;
	
}
