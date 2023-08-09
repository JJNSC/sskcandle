package com.skkcandle.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Qna;
import com.skkcandle.dto.User;
import com.skkcandle.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class qnaController {

	@Resource
	private QnaService qnaService;
	
	@RequestMapping("/qna")
	public String qna() {
		return "qna/qna";
	}

	@GetMapping("/getBoardList")
	public String getBoardList(String pageNo, Model model, HttpSession session) {
		// 브라우저에서 pageNo가 넘어오지 않았을 경우
		if (pageNo == null) {
			// 세션에 저장되어 있는지 확인
			pageNo = (String) session.getAttribute("pageNo");
			if (pageNo == null) {
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
		/* log.info("list: " + list); */

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
		User user = (User) session.getAttribute("login");

		MultipartFile mf = qna.getAttach();
		if (!mf.isEmpty()) {
			// 이름에 확장자가 포함되어있다.
			qna.setQnaAttachFileName(mf.getOriginalFilename());
			// 파일의 형식 (MIME 타입) 을 설정(image/jpeg, image/png) 등록
			qna.setQnaAttachType(mf.getContentType());
			// 방법2 (첨부 파일을 DB에 직접 저장)
			qna.setQnaImage(mf.getBytes());
		}

		qna.setUserId(user.getUserId());
		qnaService.write(qna);

		return "redirect:/getBoardList";
	}

	@GetMapping("/detailBoard")
	public String detailBoard(int qnaId, Model model) {
		Qna qna = qnaService.getQna(qnaId);
		model.addAttribute("qna", qna);

		if (qna.getQnaImage() != null) {
			// 0과 1로 구성된 바이너리 데이터를 base64 문자로 변환
			String base64Img = Base64.getEncoder().encodeToString(qna.getQnaImage());
			model.addAttribute("base64Img", base64Img);
		}
		return "qna/detailBoard";
	}

	@GetMapping("/filedownload")
	public void filedownload(int qnaId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Qna qna = qnaService.getQna(qnaId);

		byte[] fileData = qna.getQnaImage();
		String mimeType = qna.getQnaAttachType();
		String fileName = qna.getQnaAttachFileName();
		
		response.setContentType(mimeType);

		String userAgent = request.getHeader("User-Agent");
		if (userAgent.contains("Trident") || userAgent.contains("MSIE")) {
			fileName = URLEncoder.encode(fileName, "UTF-8");
		} else {
			fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		OutputStream os = response.getOutputStream();
		os.write(fileData);
		os.flush();
		os.close();
	}
	
	@GetMapping("/deleteBoard")
	public String deleteBoard(int qnaId) {
		qnaService.remove(qnaId);
		return "redirect:/getBoardList";
	}

}
