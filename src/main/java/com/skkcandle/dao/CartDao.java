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
    public void updateCartCount(Cart cart); //장바구니 페이지에서 상품의 수량변경
    public int countCart(Cart cart); //db에 같은 상품이 있는지 가져오기 있으면 1 없으면 0 리턴
    public int selectCount(Cart cart); //카트의 각 제품의 수량
    public ArrayList<Integer> getListCart(int userId); //카트 select List 타입으로 가져온다
}
