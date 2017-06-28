package kr.or.plzdvl.document.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.document.vo.DocumentFileVO;
import kr.or.plzdvl.document.vo.DocumentVO;
import kr.or.plzdvl.fileitem.vo.FileitemVO;

public interface DocumentService {
	// 문서관리 등록
	public void insertDocument(DocumentVO documentInfo) throws Exception;
	
	// 파일 보기
	public List<DocumentFileVO> getFileitemInfo(Map<String, String> params) throws Exception;

	// 문서삭제
	public void deleteDocumentInfo(DocumentVO documentInfo) throws Exception;
	
	// 파일삭제
	public void deleteDocFileInfo(Map<String, String> params) throws Exception;
	
	// 파일 보기
	public FileitemVO getFileInfo(Map<String, String> params) throws Exception;
}
