package com.skkcandle.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Qna;
import com.skkcandle.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class qnaController {
	
	@Resource
	private QnaService qnaService;
	
	@GetMapping("/getBoardList")
	public String getBoardList(String pageNo, Model model, HttpSession session) {
		// 브라우저에서 pageNo가 넘어오지 않았을 경우 
		if(pageNo == null) {
			// 세션에 저장되어 있는지 확인
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo == null) {
				// 저장되어 있지 않다면 1로 초기화
				pageNo = "1";
			}
		}
		// 문자열로 정수를 변환
		int intpageNo = Integer.parseInt(pageNo);
		// 세션에 pageNo를 저장
		session.setAttribute("pageNo", String.valueOf(pageNo));
		
		int totalBoardNum = qnaService.getTotalBoardNum();
		Pager pager = new Pager(10, 5, totalBoardNum, intpageNo);		
		log.info("pager: " + pager);
		log.info("totalBoardNum: " + totalBoardNum);
		log.info("intpageNo: " + intpageNo);
		
		List<Qna> list = qnaService.getList(pager);
		log.info("list: " + list);
		
		model.addAttribute("pager", pager);
		model.addAttribute("boards", list);
		
		return "qna/boardList";
	}
}

