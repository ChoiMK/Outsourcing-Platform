package kr.or.plzdvl.admin.dvrTest.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.admin.dvrTest.vo.AdminDvrTestOptVo;
import kr.or.plzdvl.admin.dvrTest.vo.AdminDvrTestQueVo;

public interface adminDvrTestService {

	//문제 등록
	public void insertDvrTestQue(AdminDvrTestQueVo adminDvrTestQueInfo) throws Exception;
	
	//문제 수정
	public int updateDvrTestQue(AdminDvrTestQueVo adminDvrTestQueInfo) throws Exception;
	
	//문제 삭제
	public int deleteDvrTestQue(Map<String, String> params) throws Exception;	 
	
	//문제 리스트
	public List<AdminDvrTestQueVo> getAdminDvrTestQueList(Map<String, String> params) throws Exception;
	
	//문제 상세보기 
	public AdminDvrTestQueVo getAdminDvrTestQueInfo(Map<String, String> params) throws Exception;
	
	//보기 등록
	public void insertDvrTestOpt(AdminDvrTestOptVo adminDvrTestOptInfo) throws Exception;	
	
	//보기 수정
	public int updateDvrTestOpt(AdminDvrTestOptVo adminDvrTestOptInfo) throws Exception;
	
	//보기 삭제
	public int deleteDvrTestOpt(Map<String, String> params) throws Exception;
	
	//보기 리스트
	public List<AdminDvrTestOptVo> getAdminDvrTestOptList(Map<String, String> params) throws Exception;
	
	//보기 상세보기
	public AdminDvrTestOptVo getAdminDvrTestOptInfo(Map<String, String> params) throws Exception;
	
}
