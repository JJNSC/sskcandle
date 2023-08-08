package com.skkcandle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.skkcandle.dto.Pager;
import com.skkcandle.dto.Qna;
import com.skkcandle.dto.User;

@Mapper
public interface qnaDao {
	public int count();
	public List<Qna> selectByPage(Pager pager);
	public void insert(Qna qna);
}
