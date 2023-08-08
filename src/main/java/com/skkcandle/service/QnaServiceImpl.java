package com.skkcandle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skkcandle.dao.qnaDao;
import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Qna;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaServiceImpl implements QnaService {
	@Autowired
	private qnaDao qnaDao;

	@Override
	public List<Qna> getList(Pager pager) {
		List<Qna> boardList = qnaDao.selectByPage(pager);
		return boardList;
	}
	
	@Override
	public int getTotalBoardNum() {
		int totalBoardNum = qnaDao.count();
		return totalBoardNum;
	}
	
	@Override
	public void write(Qna qna) {
		qnaDao.insert(qna);
	}
}
