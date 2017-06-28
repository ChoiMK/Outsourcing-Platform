package kr.or.plzdvl.tecinfo.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.tecinfo.vo.TecinfoVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("tecinfoDao")
public class TecinfoDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 기술정보 등록
	public void insertTecinfo(TecinfoVO tecinfo) throws Exception{
		sqlSession.insert("tecinfo.insertTecinfo", tecinfo);
	}
	
	// 기술정보 수정
	public int updateTecinfo(TecinfoVO tecinfo) throws Exception {
		return sqlSession.update("tecinfo.updateTecinfo", tecinfo);
	}
	
	// 기술정보 리스트
	public List<TecinfoVO> getTecInfoList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("tecinfo.tecinfoList", params);
	}
	
	// 기술정보 삭제
	public void deleteTecinfo(TecinfoVO tecinfo) throws Exception {
		sqlSession.delete("tecinfo.deleteTecinfo", tecinfo);
	}
}
