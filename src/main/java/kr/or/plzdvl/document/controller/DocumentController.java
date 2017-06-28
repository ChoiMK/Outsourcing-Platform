package kr.or.plzdvl.document.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.plzdvl.common.GlobalConstant;
import kr.or.plzdvl.document.service.DocumentService;
import kr.or.plzdvl.document.vo.DocumentVO;
import kr.or.plzdvl.fileitem.vo.FileitemVO;
import kr.or.plzdvl.member.vo.MemberVO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DocumentController {
	@Autowired
	private DocumentService service;
	@Autowired
	private HttpSession session;
	
	// 문서 등록
	@RequestMapping("insertDocument")
	public String insertDocument(DocumentVO documentInfo, HttpServletRequest request) throws Exception {

		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		documentInfo.setMem_id(memberInfo.getMem_id());
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		Iterator<String> fileNames = multipartRequest.getFileNames();
		String fileName = "";
		List<FileitemVO> fileList = new ArrayList<FileitemVO>();

		while (fileNames.hasNext()) {
			MultipartFile file = multipartRequest.getFile(fileNames.next());
			if (file.getSize() > 0) {

				FileitemVO fileInfo = new FileitemVO();
				fileName = file.getOriginalFilename();

				String baseName = FilenameUtils.getBaseName(fileName);
				String uuid = UUID.randomUUID().toString().replace("-", "");
				String extension = FilenameUtils.getExtension(fileName);
				String saveFileName = baseName + "_" + uuid + "." + extension;

				File saveFile = new File(GlobalConstant.SAVE_PATH, saveFileName);

				file.transferTo(saveFile);
				fileInfo.setFile_con_type(file.getContentType());
				fileInfo.setFile_upl_nm(fileName);
				fileInfo.setFile_save_nm(saveFileName);
				fileInfo.setFile_size(String.valueOf(file.getSize()));
				fileInfo.setFile_bod_num(memberInfo.getMem_id());

				fileList.add(fileInfo);
			}
		}
		
		documentInfo.setAttachFileItemList(fileList);
		service.insertDocument(documentInfo);
		
		return "redirect:/documentMng.do";
	}
	
	@RequestMapping("fileDownload/{file_num}")
	public ModelAndView fileDownload(@PathVariable String file_num, ModelAndView andView, Map<String, String> params) throws Exception{
		params.put("file_num", file_num);
		
		FileitemVO fileInfo = service.getFileInfo(params);
		
		File downloadFile = new File(GlobalConstant.SAVE_PATH, fileInfo.getFile_save_nm());
		
		andView.addObject("downloadFile",downloadFile);
		andView.addObject("fileName", fileInfo.getFile_upl_nm());
		andView.setViewName("downloadView");
		return andView;
	}
	
	@RequestMapping("deleteDocument")
	public String deleteDocument(String file_bod_num, Map<String, String> params) throws Exception {
		
		params.put("file_bod_num", file_bod_num);
		
		service.deleteDocFileInfo(params);
		
		return "redirect:/documentMng.do";
	}
}
