package kr.or.plzdvl.project.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.project.vo.ProjectVO;

public interface ProjectService {

	// 프로젝트 등록(견적 요청시)
	public void insertProJect_Y(ProjectVO projectInfo) throws Exception;
		
	// 프로젝트 등록(일반 등록시)
	public void insertProJect_N(ProjectVO projectInfo) throws Exception;
		
	// 프로젝트 수정
	public int updateProJectInfo(ProjectVO projectInfo) throws Exception;
	
	// 프로젝트 삭제
	public int deleteProJectInfo(Map<String, String> params) throws Exception;
	
	// 프로젝트 착수될 때 착수일 변경
	public int supportProjectDate(Map<String, String> params) throws Exception;

	// 프로젝트 리스트
	public List<ProjectVO> getProjectList(Map<String, String> params) throws Exception;
	
	// 프로젝트 상세보기
	public ProjectVO getProjectInfo(Map<String, String> params) throws Exception;
	
	// 클라이언트가 (자기가)등록한 프로젝트 리스트 보기
	public List<ProjectVO> clientProjectList(Map<String, String> params) throws Exception ;

	// 프로젝트 상태를 진행으로 변경
	public int updateProjectWTHDeadlineRe(Map<String, String> params) throws Exception;
		
	// 프로젝트 상태 변경 ( 완료, 보류, 실패 )
	public int updateProjectWTH(Map<String, String> params) throws Exception;
	
	// d_day 날짜 계산
	public int d_daySelect(Map<String, String> params) throws Exception;
	
	// 로그인할시 D_day 변경후 프로젝트 상태 모집중 -> 모집완료 변경
	public void d_dayupdate() throws Exception;
	
	// 메인화면에서 보여지는 프로젝트 리스트
	public List<ProjectVO> projectListMain() throws Exception;
	
}
