package com.skkcandle.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

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
	
	@GetMapping("/writeBoard")
	public String writeBoardForm() { 
		return "qna/writeBoardForm";
	}
	
	@PostMapping("/writeBoard")
	public String writeBoard(Qna qna, HttpSession session) throws Exception {
		
		MultipartFile mf = qna.getAttach();
		if(!mf.isEmpty()) {
			// 브라우저에서 선택한 파일 이름
			qna.setQnaAttachoname(mf.getOriginalFilename());
			// 파일의 형식 (MIME 타입) 을 설정(image/jpeg, image/png) 등록
			qna.setQnaAttachType(mf.getContentType());
			// 방법2 (첨부 파일을 DB에 직접 저장)
			qna.setQnaImage(mf.getBytes());
			
		} 
		
		qnaService.write(qna);
		
		// 실제로 저장된bno
		log.info("저장된 qnaId: " + qna.getQnaId());
		return "redirect:/qna/getBoardList";
	}
}

