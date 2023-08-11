package com.skkcandle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.skkcandle.dto.Cart;

import lombok.extern.slf4j.Slf4j;

@Mapper
public interface CartDao {
	
    public List<Cart> cartMoney();
    public void insert(Cart cart); //장바구니 추가
    public List<Cart> listCart(int userid); //장바구니 목록
    public void delete(int userId, List<Integer> checkedProductId); //장바구니 개별 삭제
    public void deleteAll(String userid); //장바구니 비우기
  //  public void update(Cart cart); 
    public int sumMoney(String userid); //장바구니 금액 합계
    public int countCart(String userid, int product_id); //장바구니 상품 갯수
    public void updateCart(Cart cart); //장바구니 수정 
    public void modifyCart(Cart cart);
    public int countCart(Cart cart); //db에 같은 상품이 있는지 가져오기 있으면 1 없으면 0 리턴
    public int selectCount(Cart cart);
    
}
