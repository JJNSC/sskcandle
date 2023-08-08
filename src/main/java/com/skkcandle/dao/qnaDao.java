package com.skkcandle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Qna;

@Mapper
public interface qnaDao {
	public int count();
	public List<Qna> selectByPage(Pager pager);
	public int insert(Qna qna);
}
