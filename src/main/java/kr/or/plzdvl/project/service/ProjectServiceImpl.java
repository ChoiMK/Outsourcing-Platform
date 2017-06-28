package kr.or.plzdvl.project.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.plzdvl.project.controller.ProjectController;
import kr.or.plzdvl.project.dao.ProjectDao;
import kr.or.plzdvl.project.vo.ProjectVO;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDao dao;
	private static Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	public ProjectServiceImpl() {
		logger.debug("ProjectServiceImpl의 생성자");
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertProJect_Y(ProjectVO projectInfo) throws Exception {
		 dao.insertProJect_Y(projectInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertProJect_N(ProjectVO projectInfo) throws Exception {
		dao.insertProJect_N(projectInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateProJectInfo(ProjectVO projectInfo) throws Exception {
		int updateCnt = 0;
		updateCnt = dao.updateProJectInfo(projectInfo);
		return updateCnt;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteProJectInfo(Map<String, String> params) throws Exception {
		int deleteCnt = 0;
		deleteCnt = dao.deleteProJectInfo(params);
		return deleteCnt;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int supportProjectDate(Map<String, String> params) throws Exception {
		int supportProjectDateCnt = 0;
		supportProjectDateCnt =  dao.supportProjectDate(params);
		return supportProjectDateCnt;
	}

	@Override
	public List<ProjectVO> getProjectList(Map<String, String> params) throws Exception {
		List<ProjectVO> projectList = null;
			projectList = dao.getProjectList(params);
		return projectList;
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProjectVO getProjectInfo(Map<String, String> params)
			throws Exception {
		ProjectVO projectInfo = null;
		projectInfo = dao.getProjectInfo(params);
		return projectInfo;
	}

	@Override
	public List<ProjectVO> clientProjectList(Map<String, String> params)
			throws Exception {
		List<ProjectVO> clientProjectList = null;
		clientProjectList = dao.clientProjectList(params);
		return clientProjectList;
	}

	@Override
	public int updateProjectWTHDeadlineRe(Map<String, String> params)
			throws Exception {
		int updateProjectWTHDeadlineReCnt = 0;
		updateProjectWTHDeadlineReCnt = dao.updateProjectWTHDeadlineRe(params);
		return updateProjectWTHDeadlineReCnt;
	}

	@Override
	public int updateProjectWTH(Map<String, String> params) throws Exception {
		int updateProjectWTH = 0;
		updateProjectWTH = dao.updateProjectWTH(params);
		return updateProjectWTH;
	}

	@Override
	public int d_daySelect(Map<String, String> params) throws Exception {
		int d_daySelect = 0;
		d_daySelect = dao.d_daySelect(params);
		return d_daySelect;
	}

	@Override
	public void d_dayupdate() throws Exception {
		dao.d_dayupdate();
	}

	@Override
	public List<ProjectVO> projectListMain() throws Exception {
		List<ProjectVO> projectList = dao.projectListMain();
		return projectList;
	}
	
}
