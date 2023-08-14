package com.skkcandle.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.skkcandle.dto.Cart;

@Mapper
public interface CartDao {
	
	public void insert(Cart cart); //장바구니 추가
    public List<Cart> listCart(int userId); //장바구니 목록
    public void delete(Cart cart); //장바구니 개별 삭제
    public void deleteAll(String userId); //장바구니 비우기
    public void updateCart(Cart cart); //장바구니 수정 
    public void modifyCart(Cart cart);
    public int countCart(Cart cart); //db에 같은 상품이 있는지 가져오기 있으면 1 없으면 0 리턴
    public int selectCount(Cart cart);
    public ArrayList<Integer> getListCart(int userId);
}
