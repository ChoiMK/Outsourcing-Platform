package kr.or.plzdvl.document.dao;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.document.vo.DocumentFileVO;
import kr.or.plzdvl.document.vo.DocumentVO;
import kr.or.plzdvl.fileitem.vo.FileitemVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("documentDao")
public class DocumentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 문서 등록
	public void insertDocument(DocumentVO documentInfo) throws Exception {
		
		sqlSession.insert("document.insertDocument", documentInfo);
		
		List<FileitemVO> fileItemList = documentInfo.getAttachFileItemList();
		if(fileItemList != null) {
			for( FileitemVO fileItemInfo : fileItemList ){
				fileItemInfo.setFile_bod_num(documentInfo.getDoc_num());
				sqlSession.insert("document.insertFileItem", fileItemInfo);
			}
		}
	}
	
	// 문서 & 파일 보기
	public List<DocumentFileVO> getFileitemInfo(Map<String, String> params) throws Exception {
		return sqlSession.selectList("document.fileitemInfo", params);
	}
	
	// 문서 삭제
	public void deleteDocumentInfo(DocumentVO documentInfo) throws Exception {
		sqlSession.delete("document.deleteDocumentInfo", documentInfo);
	}
	
	// 파일 삭제
	public void deleteDocFileInfo(Map<String, String> params) throws Exception {
		sqlSession.selectOne("document.deleteDocFileInfo", params);
	}
	
	// 파일보기
	public FileitemVO getFileInfo(Map<String, String> params) throws Exception {
		return sqlSession.selectOne("document.fileInfo", params);
	}
}
