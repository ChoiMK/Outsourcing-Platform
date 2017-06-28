package kr.or.plzdvl.portfolio.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.plzdvl.fileitem.vo.FileitemVO;
import kr.or.plzdvl.member.vo.MemberVO;
import kr.or.plzdvl.portfolio.service.PortfolioService;
import kr.or.plzdvl.portfolio.vo.PortfolioFileVO;
import kr.or.plzdvl.portfolio.vo.PortfolioVO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/portfolio/")
public class PortfolioController {
	
	@Autowired
	private PortfolioService service;
	
	@Autowired
	private HttpSession session;
	
	
	@RequestMapping("insertPortfolio")
	   public ModelAndView insertportfolio(ModelAndView andView, PortfolioVO portfolioInfo, 
			   Map<String, String> params ,HttpServletRequest request) throws Exception{
		
		  MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		  portfolioInfo.setMem_id(memberInfo.getMem_id());
		  params.put("mem_id", memberInfo.getMem_id());
		
	      MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

	      Iterator<String> fileNames = multipartRequest.getFileNames();
	      String fileName = "";
	      List<FileitemVO> fileList = new ArrayList<FileitemVO>();
	      
	      while(fileNames.hasNext()){
	      MultipartFile file = multipartRequest.getFile(fileNames.next());
	         if(file.getSize() > 0){
	            FileitemVO fileInfo = new FileitemVO();
	            
	            fileName = file.getOriginalFilename();
	            
	            String baseName = FilenameUtils.getBaseName(fileName);
	            String uuid = UUID.randomUUID().toString().replace("-", "");
	            String extension = FilenameUtils.getExtension(fileName);
	            String saveFileName = baseName + "_" + uuid + "." + extension;

	            File saveFile = new File("D:\\temp\\upload", saveFileName);
	            
	            file.transferTo(saveFile);
	            
	            fileInfo.setFile_con_type(file.getContentType());
	            fileInfo.setFile_upl_nm(fileName);
	            fileInfo.setFile_save_nm(saveFileName);
	            fileInfo.setFile_size(String.valueOf(file.getSize()));
	            
	            fileList.add(fileInfo);
	            
	         }
	      }
	      portfolioInfo.setAttachFileItemList(fileList);
	      
	      service.insertPortfolio(portfolioInfo);
	      List<PortfolioFileVO> portfolioitemList = service.getFileitemList(params);
	      andView.addObject("portfolioitemList", portfolioitemList);
	      andView.setViewName("jsonConvertView");
	      
	      return andView;
	   }
	@RequestMapping("deletePortfolio")
	 public ModelAndView deletePortfolio(String file_bod_num, ModelAndView andView, 
			   Map<String, String> params) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_id", memberInfo.getMem_id());
		params.put("file_bod_num", file_bod_num);
		service.deletePortFileInfo(params);
		
		List<PortfolioFileVO> portfolioitemList = service.getFileitemList(params);
	    andView.addObject("portfolioitemList", portfolioitemList);
	    andView.setViewName("jsonConvertView");
	    
		return andView;
	}
	
}







