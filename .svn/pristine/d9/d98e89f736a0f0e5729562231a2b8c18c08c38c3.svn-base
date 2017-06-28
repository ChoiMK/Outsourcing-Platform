package kr.or.plzdvl.join;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.plzdvl.member.service.MemberService;
import kr.or.plzdvl.member.vo.MemberVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/join/")
public class JoinController {
	@Autowired
	public MemberService service;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	@ResponseBody
	public String idCheck1(String mem_id, Map<String, String> params) throws Exception{
		params.put("mem_id", mem_id);
		
		MemberVO memberInfo = service.getMemberInfo(params);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if(memberInfo == null){
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(jsonMap);
		// {"flag":"true"}
		return jsonData;
	}
	
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(String mem_id,
			String mem_pw,
			HttpSession session,
			HashMap<String, String>params,
			ModelAndView andView,
			HttpServletRequest request)throws Exception{
			
		String messageCon = "";
		String messageTit = "";
		String messageType = "";
		
		params.put("mem_id",mem_id);
		params.put("mem_pw",mem_pw);
		
		MemberVO memberInfo = service.getMemberInfo(params);
		
		RedirectView redirectView = new RedirectView();
		
		if(memberInfo == null){
			messageTit = URLEncoder.encode("로그인 실패", "UTF-8");
			messageCon = URLEncoder.encode("회원이 아닙니다.", "UTF-8");
			messageType = URLEncoder.encode("error", "UTF-8");
			redirectView.setUrl(request.getContextPath() + "/main.do?messageTit="+messageTit+"&messageCon="+messageCon+"&messageType="+messageType);
		}else{
			messageTit = URLEncoder.encode("로그인 완료", "UTF-8");
			messageCon = URLEncoder.encode("로그인 하셨습니다.", "UTF-8");
			messageType = URLEncoder.encode("success", "UTF-8");
			redirectView.setUrl(request.getContextPath() + "/main.do?messageTit="+messageTit+"&messageCon="+messageCon+"&messageType="+messageType);

			session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		}
		redirectView.setExposeModelAttributes(false);
		andView.setView(redirectView);
		return andView;
	}
	
	@RequestMapping("idSelect.do")
	public ModelAndView idSelect( HashMap<String, String>params, 
			ModelAndView andView, HttpServletRequest request,
			String mem_nm, String mem_mail, String mem_id)throws Exception{
			
		String messageCon = "";
		String messageTit = "";
		String messageType = "";
		String backup = "";
		
		params.put("mem_id",mem_id);
		params.put("mem_nm",mem_nm);
		params.put("mem_mail",mem_mail);
		
		MemberVO memberInfo = service.memberSel(params);
		
		RedirectView redirectView = new RedirectView();
		
		if(memberInfo == null){
			messageTit = URLEncoder.encode("전송 실패", "UTF-8");
			messageCon = URLEncoder.encode("회원 정보가 일치하지 않습니다.", "UTF-8");
			messageType = URLEncoder.encode("error", "UTF-8");
			if(mem_id == null || mem_id == ""){
				backup = URLEncoder.encode("idback", "UTF-8");
			}else{
				backup = URLEncoder.encode("pwback", "UTF-8");
			}
			redirectView.setUrl(request.getContextPath() + "/main.do?messageTit="+messageTit+"&messageCon="+messageCon+"&messageType="+messageType+"&backup="+backup);
		}else{
			messageTit = URLEncoder.encode("전송 완료", "UTF-8");
			messageCon = URLEncoder.encode("귀하의 이메일을 확인바랍니다.", "UTF-8");
			messageType = URLEncoder.encode("success", "UTF-8");
			backup = URLEncoder.encode("login", "UTF-8");
			redirectView.setUrl(request.getContextPath() + "/main.do?messageTit="+messageTit+"&messageCon="+messageCon+"&messageType="+messageType+"&backup="+backup);
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			// 아이디 찾기 눌렀을때
			if(mem_id == null || mem_id == ""){
				
				messageHelper.setTo(memberInfo.getMem_mail());       //회원의 email로 전송
				messageHelper.setText(memberInfo.getMem_nm()+"님 현재 귀하의 아이디는 ["+memberInfo.getMem_id()+"]입니다.");//메일 본문
				messageHelper.setFrom("alsrb3346@gmail.com"); //보내는사람
				messageHelper.setSubject("제발개발에서 알려드립니다.");            // 메일제목은 생략이 가능하다
			}
			// 비밀번호 찾기 눌렀을때
			else{
				messageHelper.setTo(memberInfo.getMem_mail());       //회원의 email로 전송
				messageHelper.setText(memberInfo.getMem_nm()+"님 현재 귀하의 비밀번호는 ["+memberInfo.getMem_pw()+"]입니다.");//메일 본문
				messageHelper.setFrom("alsrb3346@gmail.com"); //보내는사람
				messageHelper.setSubject("제발개발에서 알려드립니다.");            // 메일제목은 생략이 가능하다
				
				
			}
			mailSender.send(message);
		}
		redirectView.setExposeModelAttributes(false);
		andView.setView(redirectView);
		return andView;
	}
	
	@RequestMapping("logout")
	public ModelAndView logot(HttpSession session,
			ModelAndView andView){
		session.invalidate();
		String messageCon = "";
		String messageTit = "";
		String messageType = "";
		
		try {
			messageTit = URLEncoder.encode("로그아웃 완료", "UTF-8");
			messageCon = URLEncoder.encode("로그아웃 되셨습니다.", "UTF-8");
			messageType = URLEncoder.encode("success", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		andView.setViewName("redirect:/main.do?messageTit="+messageTit+"&messageCon="+messageCon+"&messageType="+messageType);
		return andView;
		
	}
	
	@RequestMapping("naver/callback")
	public String callback(){
		return "join/naver/callback";
	}
	
	
	
	
}
