package kr.or.plzdvl.carinfo.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.carinfo.vo.CarinfoVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("carinfoDao")
public class CarinfoDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 경력정보 등록
	public void insertCarinfo(CarinfoVO carinfo) throws Exception {
		sqlSession.insert("carinfo.insertCarinfo", carinfo);
	}

	// 경력정보 리스트
	public List<CarinfoVO> getCarInfoList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("carinfo.carinfoList", params);
	}
	
	// 경력정보 삭제
	public void deleteCarInfo(CarinfoVO carinfo) throws Exception {
		sqlSession.delete("carinfo.deleteCarinfo", carinfo);
	}
}
