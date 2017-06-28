package kr.or.plzdvl.member.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.plzdvl.carinfo.service.CarinfoService;
import kr.or.plzdvl.carinfo.vo.CarinfoVO;
import kr.or.plzdvl.document.service.DocumentService;
import kr.or.plzdvl.document.vo.DocumentFileVO;
import kr.or.plzdvl.document.vo.DocumentVO;
import kr.or.plzdvl.fileitem.vo.FileitemVO;
import kr.or.plzdvl.member.service.MemberService;
import kr.or.plzdvl.member.vo.MemberVO;
import kr.or.plzdvl.portfolio.service.PortfolioService;
import kr.or.plzdvl.portfolio.vo.PortfolioFileVO;
import kr.or.plzdvl.portfolio.vo.PortfolioVO;
import kr.or.plzdvl.project.service.ProjectService;
import kr.or.plzdvl.project.vo.ProjectVO;
import kr.or.plzdvl.tecinfo.service.TechnologyService;
import kr.or.plzdvl.tecinfo.service.TecinfoService;
import kr.or.plzdvl.tecinfo.vo.TechnologyVO;
import kr.or.plzdvl.tecinfo.vo.TecinfoVO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private TechnologyService serviceTech;
	@Autowired
	private TecinfoService serviceTechInfo;
	@Autowired
	private CarinfoService serviceCarInfo;
	@Autowired
	private DocumentService serviceDocument;
	@Autowired
	private PortfolioService servicePortfolio;
	@Autowired
	private ProjectService serviceproject;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	@Autowired
	private ApplicationContext context;
	
	public List<FileitemVO> fileList;
	
	@RequestMapping("/baseMng")
	public ModelAndView mypageProfile(ModelAndView andView, Map<String, String> params) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		params.put("mem_id", memberInfo.getMem_id());
		FileitemVO fileitem = service.getFileItemInfo(params);
		
		List<TechnologyVO> technologyList = serviceTech.technologyList();
		
		List<TecinfoVO> tecinfoList = serviceTechInfo.getTecInfoList(params);
		
		List<CarinfoVO> carinfoList = serviceCarInfo.getCarInfoList(params);
		
		List<PortfolioFileVO> portfolioitemList = servicePortfolio.getFileitemList(params);
		
		andView.addObject("memberInfo", memberInfo);
		andView.addObject("fileitem", fileitem);
		andView.addObject("technologyList", technologyList);
		andView.addObject("tecinfoList", tecinfoList);
		andView.addObject("carinfoList", carinfoList);
		andView.addObject("portfolioitemList", portfolioitemList);
		andView.setViewName("mypage/mypageBase");
		return andView;
	}
	
	@RequestMapping("/updateMember")
	public ModelAndView updateMember(MemberVO memberInfo, ModelAndView andView, Map<String, String> params,
			@RequestHeader("User-Agent") String userAgent,
			@RequestHeader("Accept-Language") String acceptLanguage,
			HttpServletRequest request
			) throws Exception {
		
		params.put("mem_id", memberInfo.getMem_id());
		memberInfo.setAttachFileItemList(fileList);
		service.updateMemberInfo(memberInfo);
		service.insertMemPic(memberInfo);
		FileitemVO fileitem = service.getFileItemInfo(params);
		
		andView.addObject("memberInfo", memberInfo);
		andView.addObject("fileitem", fileitem);
		
		session.invalidate();
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		andView.setViewName("redirect:/baseMng.do");

		return andView; 
	}
	
	@RequestMapping("/updateMemberSelf")
	public ModelAndView updateMemberSelf(MemberVO memberInfo, ModelAndView andView,
			@RequestHeader("User-Agent") String userAgent,
			@RequestHeader("Accept-Language") String acceptLanguage,
			HttpServletRequest request) throws Exception {
		service.updateMemberSelf(memberInfo);
		
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("redirect:/baseMng.do");
		return andView;
	}
	
	@RequestMapping("/deleteMember/{mem_id}")
	public String deleteMember(@PathVariable String mem_id,
			Map<String, String> params) throws Exception{
		params.put("mem_id", mem_id);
		session.invalidate();
		service.deleteMemberInfo(params);
		
		return "redirect:/main.do";
	}
	
	@RequestMapping("/projectMng")
	public ModelAndView mypageProject(ModelAndView andView, Map<String, String> params, String est_req) throws Exception{
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		// 프리랜서라면 견적문의 요청한 것은 프로젝트 리스트에 보이지않는다.
		if(memberInfo.getMem_type()=="F"){
			est_req = "N";
			params.put("est_req", est_req);
		}
		params.put("mem_id", memberInfo.getMem_id());
		List<ProjectVO> projectList = serviceproject.clientProjectList(params);
		
		// 프리랜서에게만 띄워줄 견적문의를 한 리스트
		est_req = "Y";
		Map<String, String> estparams = new HashMap<String, String>();
		estparams.put("est_req", est_req);
		estparams.put("est_mem_id", memberInfo.getMem_id());
		estparams.put("pro_cod_wht","모집중");
		List<ProjectVO> projectestList = serviceproject.clientProjectList(estparams);
		
		andView.addObject("projectList", projectList);
		andView.addObject("projectestList", projectestList);
		andView.setViewName("mypage/mypageProject");
		return andView;
	}
	
	// 타이틀 관리 페이지
	@RequestMapping("/titleMng")
	public ModelAndView mypageTitle(ModelAndView andView, HashMap<String, String> params) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("mypage/mypageTitle");
		return andView;
	}
	
	// 문서 리스트 & 문서관리 페이지로 이동
	@RequestMapping("/documentMng")
	public ModelAndView mypageDocument(ModelAndView andView, HashMap<String, String> params) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_id", memberInfo.getMem_id());
		List<DocumentFileVO> documentFileItem = serviceDocument.getFileitemInfo(params);
		andView.addObject("documentFileItem", documentFileItem);
		andView.setViewName("mypage/mypageDocument");
		return andView;
	}
	
	@RequestMapping("/baseMng/picture")
	public ModelAndView mypagePicture(ModelAndView andView, HashMap<String, String> params) throws Exception{
		andView.setViewName("mypage/mypageBase");
		return andView;
	}
	
	
	
	   @RequestMapping("idPictureUpload")
	   @ResponseBody
	   public ModelAndView idPictureUpload(ModelAndView andView, MemberVO memberInfo, HttpServletRequest request) throws Exception{
	      MultipartHttpServletRequest multipartRequest = 
	                          (MultipartHttpServletRequest)request;
	      
	      Iterator<String> fileNames = multipartRequest.getFileNames();
	      String fileName = "";
	      String saveFileName = "";
	      fileList = new ArrayList<FileitemVO>();
	      
	      while(fileNames.hasNext()){
	         MultipartFile file = multipartRequest.getFile(fileNames.next());
	         if(file.getSize() > 0){
	            FileitemVO fileInfo = new FileitemVO();
	            fileName = file.getOriginalFilename();

	            String baseName = FilenameUtils.getBaseName(fileName);
	                String uuid = UUID.randomUUID().toString().replace("-", "");
	                String extension = FilenameUtils.getExtension(fileName);
	                saveFileName = baseName + "_" + uuid + "." + extension;
	            
	            File saveFile = new File("D:\\temp\\upload", saveFileName);
	            
	            file.transferTo(saveFile);
	            fileInfo.setFile_con_type(file.getContentType());
	               fileInfo.setFile_upl_nm(fileName);
	               fileInfo.setFile_save_nm(saveFileName);
	               fileInfo.setFile_size(String.valueOf(file.getSize()));
	               fileInfo.setFile_bod_num(memberInfo.getMem_id());
	               fileList.add(fileInfo);
	         }
	      }
	      andView.addObject("saveFileName",saveFileName);
	      andView.setViewName("jsonConvertView");
	      return andView;
	   }
	
	//기술 등록
	@RequestMapping("/insertTech")
	public ModelAndView mypageInsertTech(String tech, ModelAndView andView, MemberVO memberInfo,HashMap<String, String> params, TecinfoVO tecinfo) throws Exception{
		memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		Boolean flag = true;
		tecinfo.setMem_id(memberInfo.getMem_id());
		tecinfo.setTec_info_lan(tech);
		params.put("mem_id", memberInfo.getMem_id());
		List<TecinfoVO> tecinfoList =  serviceTechInfo.getTecInfoList(params);
		for(TecinfoVO tecinfomation : tecinfoList){
			if(tecinfomation.getTec_info_lan().equals(tecinfo.getTec_info_lan())){
				flag = false;
			}
		}
		if(flag){
		serviceTechInfo.insertTecinfo(tecinfo);
		}
		tecinfoList =  serviceTechInfo.getTecInfoList(params);
		andView.addObject("tecinfoList", tecinfoList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	// 기술 삭제
	@RequestMapping("/deleteTech")
	public ModelAndView mypageDeleteTech( HashMap<String, String> params, ModelAndView andView, String tech, MemberVO memberInfo, TecinfoVO tecinfo) throws Exception {
		memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		tecinfo.setMem_id(memberInfo.getMem_id());
		tecinfo.setTec_info_lan(tech);
		serviceTechInfo.deleteTecinfo(tecinfo);
		
		params.put("mem_id", memberInfo.getMem_id());
		List<TecinfoVO> tecinfoList =  serviceTechInfo.getTecInfoList(params);
		andView.addObject("tecinfoList", tecinfoList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	// 경력 등록
	@RequestMapping("/insertCarinfo")
	public ModelAndView mypageInsertCarinfo(ModelAndView andView, CarinfoVO carInfo, HashMap<String, String> params,
			MemberVO memberInfo) throws Exception {
		memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_id", memberInfo.getMem_id());
		carInfo.setMem_id(memberInfo.getMem_id());
		serviceCarInfo.insertCarinfo(carInfo);
		
		List<CarinfoVO> carinfoList = serviceCarInfo.getCarInfoList(params);
		andView.addObject("carinfoList", carinfoList);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	// 경력 삭제
	@RequestMapping("/deleteCarinfo")
	public ModelAndView mypageDeleteCarinfo(ModelAndView andView, HashMap<String, String> params,
			String car_num, CarinfoVO carInfo, MemberVO memberInfo) throws Exception {
		
		memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_id", memberInfo.getMem_id());
		
		carInfo.setCar_num(car_num);
		serviceCarInfo.deleteCarInfo(carInfo);
		
		List<CarinfoVO> carinfoList = serviceCarInfo.getCarInfoList(params);
		andView.addObject("carinfoList", carinfoList);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
}