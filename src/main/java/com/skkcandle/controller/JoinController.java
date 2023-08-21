package com.skkcandle.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skkcandle.dto.User;
import com.skkcandle.service.UserService;
import com.skkcandle.service.UserService.JoinResult;
import com.skkcandle.service.UserService.WithdrawResult;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;
/**
 * 회원 가입,탈퇴 관련 기능 처리 컨트롤러 
 * 
 * 회원 가입, 가입 실패시 처리, 회원 탈퇴 등 기능 제공
 * @author 김종진
 *
 */
@Slf4j
@Controller
public class JoinController {
	/**
	 * 의존성 주입
	 */
	@Autowired
	private UserService userService;
	
	/**
	 * 회원가입 페이지로 이동하는 요청을 처리 
	 * 회원가입 실패시 실패문구를 제공
	 * 
	 * @param register_msg	실패 종류에 따른 실패 메세지
	 * @param model			모델 객체
	 * @return				실패 메세지가 있으면 함께, 없으면 그대로 회원가입 페이지로 이동
	 */
	@RequestMapping("/join")
	public String joinmain(@RequestParam(value ="register_msg", defaultValue ="이메일")String register_msg, Model model) {
		model.addAttribute("register_msg", register_msg);
		return "join/joinForm";
	}
	
	/**
	 * 회원가입 시 유저가 작성한 정보 처리 
	 * DB와 비교하여 이메일 또는 전화번호가 중복되면 회원가입이 실패하며 에러 메세지 출력
	 * 회원가입 성공시 1000포인트 지급과 동시에 성공 메세지를 제공
	 * 
	 * @param user	유저가 회원가입 폼에서 작성한 정보
	 * @param model	모델 객체
	 * @return		실패시 회원가입페이지로, 성공시 로그인페이지로 이동
	 */
	@PostMapping("/register")
	public String register(User user, Model model) {
		JoinResult joinresult =  userService.join(user);
		//이메일이 중복될경우 
		if(joinresult == JoinResult.FAIL_DUPLICATED_Email) {
			model.addAttribute("register_msg", "이메일이 중복되었습니다.");
			return "redirect:/join";
		}else if(joinresult == JoinResult.FAIL_DUPLICATED_PHONE) {
			model.addAttribute("register_msg", "전화번호가 중복되었습니다.");
			return "redirect:/join";
		}
		model.addAttribute("loginErrMsg", " 회원가입을 축하드립니다! \n 가입 기념으로 1000포인트를 적립해드려요! \n 즐거운 쇼핑 되세요!");
		return "login/loginForm";
	}
	
	/**
	 * 회원탈퇴 요청을 처리
	 * 
	 * @param user		회원탈퇴전 본인 인증 정보
	 * @param session	세션 객체
	 * @param model		모델 객체
	 * @return			실패시 실패 문구를 가지고 회원탈퇴 페이지로이동, 성공시 로그인 세션 삭제,DB에서 회원정보 삭제 후 메인페이지로 이동
	 */
	@PostMapping("/withdraw")
	public String withdraw(User user, HttpSession session, Model model) {
		User sessionUser = (User) session.getAttribute("login");
		String errMsg ="";
		WithdrawResult result = userService.withdraw(sessionUser, user);
		if(result == WithdrawResult.FAIL_EMAIL_WRONG) {
			errMsg="이메일 주소를 잘못 입력하였습니다.";
		}else if(result == WithdrawResult.FAIL_PASSWORD_WRONG) {
			errMsg="비밀번호를 잘못 입력하였습니다.";
		}else if(result == WithdrawResult.SUCCESS) {
			userService.withdrawUser(sessionUser.getUserId());
			session.removeAttribute("login");
			return "redirect:/";
		}
		
		model.addAttribute("errMsg", errMsg);
		model.addAttribute("subpage", "withdraw");
		return "redirect:/mypage";
	}
	
}
