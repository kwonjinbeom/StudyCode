package com.spring.admin.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.board.controller.AdminBoardController;
import com.spring.admin.login.sevice.AdminLoginService;
import com.spring.admin.login.vo.AdminLoginVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
/* @SessionAttrubtes 파라미터로 지정된 이름과 같은 이름이 @ModelAttribute에 지정되어 있을 경우 
 * 메소드가 반환되는 값은 세션에 저장된다.*/
@SessionAttributes("adminLogin")
@RequestMapping("/admin/*")
//@Log4j
@Slf4j
public class AdminLoginController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminLoginService adminLoginService;
	
	/* @SessionAttributes의 파라미터와 같은 이름이 @ModelAttribute에 있을 경우 
	 * 세션에 있는객체를 가져온 후 , 클라이언트로 전송받은 값을 설정한다. */
	@ModelAttribute
	public AdminLoginVO adminLogin() {
		return new AdminLoginVO();
	}
	
	/* 로그인 화면 구현 메서드
	 * 요청 URL : http://localhost:8080/admin/login으로 요청 */
	@GetMapping("/login")
	public String loginForm() {
		log.info("admin 로그인 화면 호출");
		
		return "admin/main"; // /WEB-INF/views/admin/main.jsp 로 포워드(관리자 시작페이지로 구분 - 로그인 페이지)
	}

	/* 로그인 처리 메서드
	 * 참고 : 자바단에서는 세션의 값을 사용할 경우 다시 말해 Controller 내 메서드에서 세션의 값이 필요할 경우
	 * @SessionAttributes("adminLogin") 명시해 준 이름을
	 * public 반환형 메서드명(@SessionAttribute("adminLogin") VO 클래스명 참조변수)로
	 * 정의하고 사용하면 된다.
	 * RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에
	 * 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다.
	 * addFlashAttribute()메서드는 브라우저까지 전송되기는 하지만, URI상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
	 * redirect:/admin/login?errorMsg=error이라고 전송을 하여야 하는데
	 * 이 때 ras.addFlashAttribute("errorMsg", "error"); redirect:/admin/login으로 이동 */
	@PostMapping("/login")
	public String loginProcess(AdminLoginVO login, Model model, RedirectAttributes ras) {
		String url="";
		AdminLoginVO adminLogin = adminLoginService.loginProcess(login);
		
		if(adminLogin != null) {
			model.addAttribute("adminLogin",adminLogin);
			url="/admin/board/boardList";
		}else {
			ras.addFlashAttribute("errorMsg","로그인 실패");
			url="/admin/login";
		}
		return "redirect:"+url;
	}

	/* 로그아웃 처리 메서드
	 * setComplete() 메서드를 활용하여 세션을 할당 해지 */
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		log.info("admin 로그인 아웃 처리");
		sessionStatus.setComplete();
		return "redirect:/admin/login";
	}
}
