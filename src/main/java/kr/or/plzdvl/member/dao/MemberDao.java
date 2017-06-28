package kr.or.plzdvl.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import freemarker.cache.FileTemplateLoader;
import kr.or.plzdvl.fileitem.vo.FileitemVO;
import kr.or.plzdvl.member.controller.MemberController;
import kr.or.plzdvl.member.vo.MemberFileVO;
import kr.or.plzdvl.member.vo.MemberVO;

@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	public MemberDao(){
		logger.debug("MemberDao의 생성자");
	}
	
	// 회원정보찾기
		public MemberVO memberSel(Map<String, String> params) throws Exception {
				return (MemberVO) sqlSession.selectOne("member.memberSel", params);
		}
	
	// 로그인
	public MemberVO getMemberInfo(Map<String, String> params) throws Exception {
		return (MemberVO) sqlSession.selectOne("member.memberInfo", params);
	}

	// 회원가입
	public void insertMemberInfo(MemberVO memberInfo) throws Exception {
		sqlSession.insert("member.insertMember", memberInfo);
	}
	
	// 회원삭제
	public int deleteMemberInfo(Map<String, String> params) throws Exception {
		return sqlSession.update("member.deleteMember", params);
	}

	// 회원수정 - 회원수정을 하는데 사진을 등록할수도 있고 안할 수도 있다. 
	public int updateMemberInfo(MemberVO memberInfo) throws Exception {
		return sqlSession.update("member.updateMember", memberInfo);
		// 그냥 회원수정만 하는 경우
	}
	
	// 사진 등록
	public void insertMemPic(MemberVO memberInfo) throws Exception {
		// 1. 사진은 없고 맴버정보만 수정하는 경우
		// 2. 사진 등록과 맴버수정을 동시에 하는 경우
		// 3. 이미 등록된 사진이 있고 다른 사진으로 교체후 수정버튼을 클릭하는 경우.
		
		List<FileitemVO> fileItemList = memberInfo.getAttachFileItemList(); // 파일 리스트에 로그인한 맴버의 파일아이템리스트를 삽입.
		sqlSession.update("member.updateMember", memberInfo); // << 1
		
		if(fileItemList != null ){
			for(FileitemVO fileItemInfo : fileItemList) {
				String file_bod_num = (String)sqlSession.selectOne("member.fileitemList", fileItemInfo);
				if( file_bod_num != null ) {
					sqlSession.update("member.memberPicUpdate", fileItemInfo); // << 3
				} else {
					fileItemInfo.setFile_bod_num(memberInfo.getMem_id());
					sqlSession.insert("member.insertFileItem", fileItemInfo); // << 2
					sqlSession.update("member.updateMember", memberInfo);
				}
			}			
		}
	}
	
	// 등록된 사진 보기 
	public FileitemVO fileitemInfo(Map<String, String> params) throws Exception {
		return (FileitemVO)sqlSession.selectOne("member.fileitemInfo", params);
	}
	
	// 프리랜서 리스트
	public List<MemberVO> freelancerList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("member.freelancerList", params);
	}
	
	// 자기소개 수정
	public int updateMemberSelf(MemberVO memberInfo) throws Exception {
		return sqlSession.update("member.updateMemberSelf", memberInfo);
	}
	
	// 맴버 리스트 & 사진 리스트
	public List<MemberFileVO> memberPicList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("member.memberPicList", params);
	}
	
	// 한명의 회원에 대한 사진 & 기본정보
	public MemberFileVO memberInfoAndPicInfo(Map<String, String> params) throws Exception {
		return sqlSession.selectOne("member.memberInfoAndPicInfo", params);
	}
	
	// 타이틀 등록
	public int insertMemTitle(MemberVO memberInfo) throws Exception {
		return sqlSession.update("member.insertMemTitle", memberInfo);
	}
	
	// 관리자단 회원관리 리스트
	public List<MemberVO> memberList(Map<String, String> params) throws Exception {
		return sqlSession.selectList("member.memberList", params);
	}
}
