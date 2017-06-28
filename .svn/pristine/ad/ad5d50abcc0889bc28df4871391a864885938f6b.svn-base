package kr.or.plzdvl.document.service;

import java.util.List;
import java.util.Map;

import kr.or.plzdvl.document.dao.DocumentDao;
import kr.or.plzdvl.document.vo.DocumentFileVO;
import kr.or.plzdvl.document.vo.DocumentVO;
import kr.or.plzdvl.fileitem.vo.FileitemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("documentService")
public class DocumentServiceImpl implements DocumentService {

	@Autowired
	private DocumentDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertDocument(DocumentVO documentInfo) throws Exception {
		dao.insertDocument(documentInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<DocumentFileVO> getFileitemInfo(Map<String, String> params)
			throws Exception {
		List<DocumentFileVO> fileitemInfo = dao.getFileitemInfo(params);
		return fileitemInfo;
	}

	@Override
	public void deleteDocumentInfo(DocumentVO documentInfo) throws Exception {
		dao.deleteDocumentInfo(documentInfo);
	}

	@Override
	public void deleteDocFileInfo(Map<String, String> params) throws Exception {
		dao.deleteDocFileInfo(params);
	}

	@Override
	public FileitemVO getFileInfo(Map<String, String> params) throws Exception {
		FileitemVO fileInfo = dao.getFileInfo(params);
		return fileInfo;
	}

}
