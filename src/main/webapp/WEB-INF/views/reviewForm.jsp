<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width-device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon" />
		<title>마이페이지</title>

		<!-- Bootstrap 을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script><!-- slim을 뺀다 ajax 관련 기능이 지금피료없기때문에) -->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
		<style>
    body {
        font-family: Arial, sans-serif;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
    }
    .review-form {
    	margin:auto;
    	margin-top:50px;
        max-width: 600px;
        width: 100%;
        padding: auto;
        background-color: #fff;
        text-align: center;
    }
    .form-group {
        margin-bottom: 20px;
        text-align: left;
    }
    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }
    .form-group input[type="text"],
    .form-group textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }
    .form-group textarea {
        resize: vertical;
    }
    .form-group .rating {
        font-size: 24px;
        display: flex;
        align-items: center;
        justify-content: flex-start; /* 왼쪽 정렬 */
        margin-top: 10px;
    }
    .form-group .rating input[type="radio"] {
        display: none;
    }
    .form-group .rating label {
        color: #ff9800;
        cursor: pointer;
        margin: 0 5px;
    }
    .form-group .rating label:before {
        content: "\2605"; /* 별 아이콘 Unicode */
        font-size: 24px;
        display: inline-block;
    }
    .form-group .rating input[type="radio"]:checked ~ label {
        color: #ccc;
    }
    .form-group .rating input[type="radio"]:checked {
        color: #ff9800c;
    }
    .form-group button {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }
		</style>
		<script>
			$(document).ready(function() {
	            $(".rating input[type='radio']").on("click", function() {
	                var selectedRating = $(this).val();
	                console.log("평점: " + selectedRating);
	            });
	        });
		
		</script>
	  
	
	</head>
	<div>
	<%@ include file="./header/navHeader.jsp" %>
	</div>
		<div class="review-form">
		<div style="float:left; display:inline-block;">
		이미지가 들어갈곳
		</div>
		<div style="float:right; display:inline-block; width:400px;">
		<form action="submitReview" method="post">
		    <div class="form-group">
		        <label for="product">상품명 : 아아아아</label>
		        <input type="text" id="product" name="product" placeholder="제목" required>
		    </div>
		    <div class="form-group">
		        <label for="rating">평점</label>
				 <div class="rating">
                    <input type="radio" id="star7" name="rating" value="">
                    <label for="star6" class="d-none"></label>
                    <input type="radio" id="star6" name="rating" value="">
                    <label for="star5"></label>
                    <input type="radio" id="star5" name="rating" value="1">
                    <label for="star4"></label>
                    <input type="radio" id="star4" name="rating" value="2">
                    <label for="star3"></label>
                    <input type="radio" id="star3" name="rating" value="3">
                    <label for="star2"></label>
                    <input type="radio" id="star2" name="rating" value="4">
                    <label for="star1"></label>
                    <input type="radio" id="star1" name="rating" value="5">
                </div>
		    </div>
		    <div class="form-group">
		        <label for="comment">리뷰 내용</label>
		        <textarea id="comment" name="comment" rows="4" required></textarea>
		    </div>
		    <div class="form-group " style="display:flex; justify-content: right;">
		        <button type="submit">리뷰 작성</button>
		    </div>
		</form>
		</div>
		</div>
	</body>
</html>