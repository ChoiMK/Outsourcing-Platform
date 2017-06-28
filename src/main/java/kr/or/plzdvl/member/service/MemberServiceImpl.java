package kr.or.plzdvl.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.plzdvl.fileitem.vo.FileitemVO;
import kr.or.plzdvl.member.controller.MemberController;
import kr.or.plzdvl.member.dao.MemberDao;
import kr.or.plzdvl.member.vo.MemberFileVO;
import kr.or.plzdvl.member.vo.MemberVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao dao;
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	public MemberServiceImpl() {
		logger.debug("MemberServiceImpl의 생성자");
	}
	
	//REQUIRED : 트랜잭션이 있으면 쓰고 , 없으면 새로 만든다.
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO getMemberInfo(Map<String, String> params) throws Exception {
		MemberVO memberInfo = dao.getMemberInfo(params);
		return memberInfo;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertMemberInfo(MemberVO memberInfo) throws Exception {
		dao.insertMemberInfo(memberInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteMemberInfo(Map<String, String> params) throws Exception {
		int deleteCnt = dao.deleteMemberInfo(params);
		return deleteCnt;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateMemberInfo(MemberVO memberInfo) throws Exception {
		int updateCnt = dao.updateMemberInfo(memberInfo);
		return updateCnt;
	}

	@Override
	public List<MemberVO> freelancerList(Map<String, String> params)
			throws Exception {
		List<MemberVO> freelancerList = null;
		freelancerList = dao.freelancerList(params);
		return freelancerList;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public FileitemVO getFileItemInfo(Map<String, String> params)
			throws Exception {
		FileitemVO fileitemInfo = null;
		fileitemInfo = dao.fileitemInfo(params);
		return fileitemInfo;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateMemberSelf(MemberVO memberInfo) throws Exception {
		int updateCnt = dao.updateMemberSelf(memberInfo);
		return updateCnt;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertMemPic(MemberVO memberInfo) throws Exception {
		System.out.println("MemberServiceImpl :" +memberInfo);
		dao.insertMemPic(memberInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO memberSel(Map<String, String> params) throws Exception {
		MemberVO memberInfo = dao.memberSel(params);
		return memberInfo;
	}

	@Override
	public List<MemberFileVO> memberPicList(Map<String, String> params)
			throws Exception {
		List<MemberFileVO> memberPicList = dao.memberPicList(params);
		return memberPicList;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberFileVO memberInfoAndPicInfo(Map<String, String> params)
			throws Exception {
		MemberFileVO memberInfoAndPicInfoFileVO = dao.memberInfoAndPicInfo(params);
		return memberInfoAndPicInfoFileVO;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int insertMemTitle(MemberVO memberInfo) throws Exception {
		int isertMemTitle = dao.insertMemTitle(memberInfo);
		return isertMemTitle;
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params)
			throws Exception {
		List<MemberVO> memberList = dao.memberList(params);
		return memberList;
	}
}
