package kr.or.plzdvl.member.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.fileitem.vo.FileitemVO;
import kr.or.plzdvl.member.vo.MemberFileVO;
import kr.or.plzdvl.member.vo.MemberVO;

public interface MemberService {
	
	// 로그인
	public MemberVO getMemberInfo(Map<String, String> params) throws Exception;
	
	// 회원가입
	public void insertMemberInfo(MemberVO memberInfo) throws Exception;
	
	// 회원탈퇴
	public int deleteMemberInfo(Map<String, String> params) throws Exception;
	
	// 회원수정
	public int updateMemberInfo(MemberVO memberInfo) throws Exception;
	
	// 프리랜서 리스트
	public List<MemberVO> freelancerList(Map<String, String> params) throws Exception;
	
	// 사진 보기
	public FileitemVO getFileItemInfo(Map<String, String> params ) throws Exception;
	
	// 자기소개 수정
	public int updateMemberSelf(MemberVO memberInfo) throws Exception;
	
	// 사진 등록
	public void insertMemPic(MemberVO memberInfo) throws Exception;
	
	//회원정보 찾기
	public MemberVO memberSel(Map<String, String> params) throws Exception;
	
	// 맴버 리스트 & 사진 리스트
	public List<MemberFileVO> memberPicList(Map<String, String> params) throws Exception;
	
	// 한명의 회원에 대한 사진 & 기본정보
	public MemberFileVO memberInfoAndPicInfo(Map<String, String> params) throws Exception;
	
	// 타이틀 등록
	public int insertMemTitle(MemberVO memberInfo) throws Exception;
	
	// 관리자단 회원관리 리스트
	public List<MemberVO> memberList(Map<String, String> params) throws Exception; 
}
