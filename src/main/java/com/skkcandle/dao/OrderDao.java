package com.skkcandle.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
/**
 * 
 * @author 김종진
 *
 */
@Mapper
public interface OrderDao {
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> selectOrdersByUserId(int userId);
}
