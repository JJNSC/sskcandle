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

/**
 * QnA 관련 기능 처리 컨트롤러
 * 
 * 문의글 목록 조회, 작성, 수정, 삭제, 상세 보기, 첨부파일 업/다운로드 기능 제공
 * @author 김상규
 */
@Controller
@Slf4j
public class QnaController {
	
	/**
	 * 의존성 주입
	 */
	@Resource
	private QnaService qnaService;
	
	/**
	 * '/qna' 경로로 들어오는 요청을 처리
	 * @return qna/qna 페이지로 이동
	 */
	@RequestMapping("/qna")
	public String qna() {
		return "qna/qna"; 
	}
	
	/**
	 * 문의글 목록 조회 메소드
	 * 
	 * @param pageNo 페이지 번호
	 * @param model 모델 객체
	 * @param session 세션 객체
	 * @return 페이징 처리된 문의글 목록으로 이동
	 */
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

		List<Qna> list = qnaService.getList(pager);

		model.addAttribute("pager", pager);
		model.addAttribute("boards", list);

		return "qna/boardList";
	}
	
	/**
	 * '/writeBoard' 경로로 들어오는 요청을 처리
	 * @return writeBoardForm.jsp 로 이동
	 */
	@GetMapping("/writeBoard")
	public String writeBoardForm() {
		return "qna/writeBoardForm";
	}

	/**
	 * 문의글 작성 메소드
	 * 
	 * @param qna 문의글 정보를 담은 객체
	 * @param session 세션 객체
	 * @return 문의글 저장 후 목록 페이지로 리다이렉트
	 * @throws Exception IO, NULLPoint, NumberFormat 예외가 발생할 수 있다
	 */
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
	
	/**
	 * 선택 문의글 상세 정보 조회 메소드
	 * 
	 * @param qnaId 문의글 번호
	 * @param model 모델 객체
	 * @return detailBoard.jsp로 이동
	 */
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
	
	/**
	 * 첨부 파일 다운로드 메소드
	 * 
	 * @param qnaId 문의글 번호
	 * @param request HTTP 요청 객체
	 * @param response HTTP 응답 객체
	 * @throws Exception IO, NULLPoint, UnsupportedEncoding 예외가 발생할 수 있다
	 */
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
	
	/**
	 * 문의글 삭제 기능 메소드
	 * 
	 * @param qnaId 문의글 번호
	 * @return 문의글 목록으로 리다이렉트
	 */
	@GetMapping("/deleteBoard")
	public String deleteBoard(int qnaId) {
		qnaService.remove(qnaId);
		return "redirect:/getBoardList";
	}
	
	/**
	 * 문의글 수정폼으로 이동하는 메소드
	 * 
	 * @param qnaId 문의글 번호
	 * @param model 모델 객체
	 * @return "qna"에 기존 내용을 가지고 updateBoardForm.jsp로 이동
	 */
	@GetMapping("/updateBoard")
	public String updateBoardForm(int qnaId, Model model) {
		// 기존 내용 가져오기
		Qna qna = qnaService.getQna(qnaId);
		
		model.addAttribute("qna", qna);
		return "qna/updateBoardForm";
	}
	
	/**
	 * 문의글 내용 수정 메소드
	 * 
	 * @param qna 문의글 정보를 담은 객체
	 * @param model 모델 객체
	 * @return 문의글 목록으로 리다이렉트
	 */
	@PostMapping("/updateBoard")
	public String updateBoard(Qna qna, Model model) {
		qnaService.modify(qna);
		return "redirect:/getBoardList";
	}

}
