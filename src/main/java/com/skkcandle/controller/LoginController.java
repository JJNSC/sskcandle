package com.skkcandle.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skkcandle.dto.User;
import com.skkcandle.service.UserService;
import com.skkcandle.service.UserService.LoginResult;

import lombok.extern.slf4j.Slf4j;
/**
 * 로그인 페이지 관련 기능 처리 컨트롤러
 * 
 * 로그인,로그아웃,아이디찾기, 비밀번호찾기 기능 제공
 * @author 김종진
 *
 */
@Slf4j
@Controller
public class LoginController {
	
	/**
	 * 의존성 주입
	 */
	@Autowired
	private UserService userService;
	
	/**
	 * '/loginForm' 경로로 들어오는 요청을 처리
	 * 
	 * @param loginErrMsg	로그인 실패시 생성되는 에러메세지. 실패시 해당 메세지를 로그인 페이지에 출력
	 * @param productId		제품 상세페이지에서 장바구니, 결제, 찜 기능으로 인해 로그인 할 경우 다시 해당 페이지로 돌아가기 위한 상품고유 번호 
	 * @param model			모델 객체에 에러메세지를 담아 응답
	 * @param session		제품 상세페이지에서 요청이 들어왔을 경우 세션 객체 상품 아이디를 세팅
	 * @return				'login/loginForm.jsp'(로그인 페이지) 로 이동 
	 */
	@RequestMapping("/loginForm")
	public String loginForm(@RequestParam(name="loginErrMsg", defaultValue="") String loginErrMsg,
							@RequestParam(name="productId", defaultValue="") String productId,
							Model model, HttpSession session) {
		//만약 로그인 실패하면 이 정보를 가지고 팝업띄우자
		model.addAttribute("loginErrMsg", loginErrMsg);
		//만약 제품상세페이지에서 왔을경우 해당 상품을 세션에저장하자.
		if(!productId.equals(null)) {
			session.setAttribute("productId", productId);
		}
		
		return "login/loginForm";
	}
	
	/**
	 * 로그인 폼에서 정보 입력후 로그인 버튼 클릭시 POST 방식으로 '/login' 경로로 들어오는 요청을 처리 
	 * 
	 * 입력된 이메일 , 비밀번호를 DB와 비교후 (비밀번호는 암호화 되어있기 때문에 복호화 후 비교) 
	 * 틀린 
	 * @param user		회원이 입력한 정보(이메일,비밀번호)를 받아오는 매개변수 
	 * @param session	로그인 성공시 로그인 정보를 세션객체에 세팅, 
	 * 					특정 상품페이지에서 로그인폼으로 요청되었을 경우 해당 상품 아이디를 세션객체에서 GET 하여 해당 페이지로 이동
	 * @param model		로그인 실패시 실패 메세지를 모델 객체에 담는다. 특정 상품페이지에서 로그인폼으로 요청되었을 경우 해당 상품 아이디를 모델 객체에 담는다.
	 * @return			로그인 실패시 에러메세지를 모델 객체에 담아서  'redirect:/loginForm'(로그인 페이지) 로 이동
	 * 					로그인 성공시 특정 상품페이지에서 로그인폼으로 요청 되었을 경우 상품 아이디를 모델에 담아서 'redirect:/productDetail'(상품상세 페이지) 로 이동 
	 * 					그외 로그인 성공시 'redirect:/' (메인 페이지) 로 이동한다.
	 */
	@Transactional
	@PostMapping("/login")
	public String login(User user, HttpSession session, Model model) {
		LoginResult result = userService.login(user);
		String errorMsg = "";
		if(result == LoginResult.FAIL_EMAIL_WRONG) {
			errorMsg = "잘못된 이메일 주소 입니다.";
		}else if(result == LoginResult.FAIL_PASSWORD_WRONG) {
			errorMsg = "잘못된 비밀번호 입니다.";
		}else {
			User dbUser = userService.getUserInfo(user.getUserEmail());
			session.setAttribute("login", dbUser);
			//세션에 보고있던 상품이 있는지 확인
			String pid = (String) session.getAttribute("productId");
			//상세제품을 보고있을때 는 다시 해당 페이지로 돌려보내자
			if(!pid.equals("")) {
				int productId = Integer.parseInt(pid);
				//세션에서 보고있는 상품을 삭제
				session.removeAttribute("productId");
				model.addAttribute("productId", productId);
				return "redirect:/productDetail";
			}
			//성공시 페인페이지
			return "redirect:/";
		}
		//실패시 에러메세지와 함께 로그인 페이지
		model.addAttribute("loginErrMsg", errorMsg);
		return "redirect:/loginForm";
	}
	
	/**
	 * '/logout' 경로로 들어오는 요청을 처리 
	 * 
	 * @param session	로그아웃시 모든 세션을 invalidate 하기위해 사용
	 * @return			'redirect:/' (메인 페이지) 로 이동 
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	/**
	 * 이메일 찾기 버튼 클릭시 발생하는 '/findEmail' 경로로 들어오는 요청을 처리 
	 * 
	 * @return	'login/findEmail'이메일 찾기 폼으로 이동한다.		
	 */
	//이메일 찾기
	@GetMapping("/findEmail")
	public String findEmailForm() {
		return "login/findEmail";
	}
	
	/**
	 * 이메일 찾기 폼에서 가져온 데이터(이름, 전화번호)를 DB와 대조하여 
	 * 일치시 이메일을 리턴해주고 
	 * 불일치시 실패메세지를 리턴하는 메소드 
	 * 
	 * @param userName		유저가 입력한 이름
	 * @param userPhone		유저가 입력한 전화번호
	 * @param model			결과, 결과 메세지를 담은 모델 객체
	 * @return				모델객체를 담고 'login/findEmailResult'(이메일찾기 결과창)
	 */
	@PostMapping("/findEmail")
	public String findEmail(@RequestParam String userName, @RequestParam String userPhone, Model model) {
		User user = new User();
		user.setUserName(userName);
		user.setUserPhone(userPhone);
		
		String userEmail=null;
		int exist = userService.checkUserExistByNameAndPhone(user);
		String result=null;
		if(exist ==1) {
			userEmail = userService.getEmailByNameAndPhone(user);
			result = "emailYes";
		}else {
		}
		model.addAttribute("result", result);
		model.addAttribute("resultMsg", userEmail);
		return "login/findEmailResult";
	}
	
	/** 
	 * '/findPassword' (비밀번호 찾기) 경로로 들어오는 요청을 처리 
	 * 
	 * @return	'login/findPassword' (비밀번호찾기 폼) 으로 이동
	 */
	@GetMapping("/findPassword")
	public String findPasswordForm() {
		return "login/findPassword";
	}
	
	/**
	 * 유저의 이메일,전화번호, 비밀번호 확인 질문, 비밀번호 확인 답변을 DB와 대조하여 일치할 경우 
	 * 새로운 비밀번호로 업데이트 할 수 있는 폼으로 이동하는 메소드 
	 * 
	 * @param userEmail					유저의 이메일
	 * @param userPhone					유저의 전화번호
	 * @param userCheckPasswordQuestion	유저의 비밀번호 확인 질문 
	 * @param userCheckPasswordAnswer	유저의 비밀번호 확인 답변 
	 * @param model						비밀번호가 수정될 유저의 userId 를 담은 모델 객체
	 * @return							성공 시 위의 모델을 가지고 'login/findPasswordResult'로 이동 
	 * 									실패 시  'login/failFindInfo' 로 이동
	 */
	@PostMapping("/findPassword")
	public String findPassword(@RequestParam String userEmail,
							   @RequestParam String userPhone,
							   @RequestParam(name="userCheckPasswordQuestion", defaultValue="0") String userCheckPasswordQuestion,
							   @RequestParam String userCheckPasswordAnswer,
							   Model model) {
		//질문확인문제 미선택시
		if(userCheckPasswordQuestion.equals("0")) {
			return "login/failFindInfo";
		}
		User user = new User();
		user.setUserEmail(userEmail);
		user.setUserPhone(userPhone);
		user.setUserCheckPasswordQuestion(userCheckPasswordQuestion);
		user.setUserCheckPasswordAnswer(userCheckPasswordAnswer);
		
		int userId = userService.getUserIdByCheckUserExistByEmailPhoneQnA(user);
		//일치하는 회원이있다면 비밀번호를 수정하는 폼으로 이동
		if(userId != 0) {
			model.addAttribute("userId", userId);
			return "login/findPasswordResult";
		}
		return "login/failFindInfo";
	}
	
	/**
	 * 유저가 비밀번호를 바꿀수있도록 새 비밀번호를 요청받아 업데이트 하는 메소드 
	 * 
	 * @param userId		비밀번호를 수정할 유저의 userId 
	 * @param userPassword	회원이 작성한 새로운 비밀번호 
	 * @return				회원의 이름을 리턴(ajax라서 기존의 페이지로 이동)
	 */
	//비밀번호 수정
	@PostMapping("/changePassword")
	@ResponseBody
	public String changePassword(@RequestParam int userId, @RequestParam String userPassword) {
		User user = new User();
		//유저 객체에 아이디와 암호화된 비밀번호를 세팅한다.
		user.setUserId(userId);
		PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		user.setUserPassword(pwEncoder.encode(userPassword));
		userService.updateUserPassword(user);
		user = userService.getUserInfoById(userId);
		String result =user.getUserName();
		return result;
	}
}
