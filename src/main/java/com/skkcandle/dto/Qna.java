package com.skkcandle.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Qna {
	private int qnaId;
	private int userId;
	private String userName;
	private String qnaTitle;
	private String qnaContent;
	private byte[] qnaImage;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date qnaDate;
	private String qnaAnswer;
}
