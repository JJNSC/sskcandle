package com.skkcandle.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductImages {
	private int productImageId;
	private int productId;
	private byte[] productImage;
	//client => controller
	private MultipartFile battach;
		
	//client => controller => dao => db
	private String pattachoname;
	private String pattachtype;
		
	//방법2: DB에 BLOB으로 저장
	//byte[] <- MyBatis -> Blob  sql 에서는 blob 만 사용가능 한데 mybatis 를 거치면 blob은 byte로 byte는 blob 으로 타입 변환이 이루어 지므로  sql에 blob으로 넘기기 위한 장치 ->
	private String usage;
	
	private String base64Image;
}
