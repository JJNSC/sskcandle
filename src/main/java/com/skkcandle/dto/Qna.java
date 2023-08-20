package com.skkcandle.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Qna {
	private int qnaId;
	private int userId;
	private String userName;
	private String qnaTitle;
	private String qnaContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date qnaDate;
	private String qnaAnswer;
	private String productName;
	
	private MultipartFile attach;
	private String qnaAttachType;
	private String qnaAttachFileName;	
	private byte[] qnaImage;
	private String base64Image;
}
