package com.skkcandle.service;

import java.util.List;

import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Qna;

public interface QnaService {
 	public List<Qna> getList(Pager pager);
 	public int getTotalBoardNum();
 	public void write(Qna qna);
}