<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
	<style>
		.form-control {
			height:auto;
		}
		input{
			border:none;
		}
	</style>
	<script>
		//리뷰 삭제하기 버튼 클릭시
		function deleteReview(element, event) {
		    if (confirm("해당 리뷰를 삭제하시겠습니까?")) {
		        let deleteReviewId = $(element).data("delete");
		        console.log("삭제할 리뷰 아이디 : " + deleteReviewId);
		        //d-none 처리 
		        $("#"+deleteReviewId+"top").attr("class","d-none");
		        $("#"+deleteReviewId+"middle").attr("class","d-none");
		        $("#"+deleteReviewId+"bottom").attr("class","d-none");
		        //실제 db에서 삭제
		        $.ajax({
		        	url:"deleteReview",
		        	method:"POST",
		        	data:{reviewId:deleteReviewId},
		        	success:function(){
		        		
		        	}
		        })
		        
		    }
		    // 이벤트의 기본 동작 중단
		    event.preventDefault();
		}
		//리뷰 수정하기 버튼 클릭시
		function updateReview(element, event) {
		    if (confirm("해당 리뷰를 수정하시겠습니까?")) {
		        let updateReviewId = $(element).data("delete");
		        console.log("수정할 리뷰 아이디 : " + updateReviewId);
		        
		        location.href="reviewForm?reviewId="+updateReviewId;
		        
		    }
		    // 이벤트의 기본 동작 중단
		    event.preventDefault();
		}
		
	</script>
	</head>
		<div class="wrap" style="border:0px solid black; margin-left:50px;">
			<h3>내 리뷰 리스트</h3>
			<br>
			<table class="table table-sm" style="margin-bottom:0;">
				<thead>
					<tr>
						<td style="width:5%;">번호</td>
						<td style="width:20%;">상품 명</td>
						<td style="width:30%;">제목</td>
						<!-- <td style="width:10%;">작성 날짜</td> -->
						<td style="width:5%;">별점</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="review" items="${myreview }" varStatus="a">
						<c:forEach var="product" items="${productList }" varStatus="b">
							<c:if test="${a.index==b.index}">
							
								<tr id="${review.reviewId }top">
									<td colspan="5">
			                  			<div class="collapse" id="collapseExample${review.reviewId }">
							        		<div style="display:flex; flex-direction: row-reverse;">
									         		작성날짜 : 
									         	<fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd"></fmt:formatDate>
								         	</div>
								      	</div>
					 				</td>
								</tr>
								
							   <tr style="height:50px; line-height: 50px;" id="${review.reviewId }middle">
							      <td>${review.reviewId }</td>
							      <td style="width:20%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
							          ${product.productName }
							      </td>
							      <td>
							         <a class="reviewTitle" data-toggle="collapse" id="reviewTitle${review.reviewId }" href="#collapseExample${review.reviewId }" role="button" aria-expanded="false" aria-controls="collapseExample">
							           ${review.reviewTitle }
							         </a>
							      </td>
							      <%-- <td><fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td> --%>
							      <td>
							     	 <c:if test="${review.ratingScore ==5}">
							     	 	<span style="color:#88c8bc;">★★★★★</span>
							     	 </c:if>
							     	 <c:if test="${review.ratingScore ==4}">
							     	 	<span style="color:#88c8bc;">★★★★☆</span>
							     	 </c:if>
							     	 <c:if test="${review.ratingScore ==3}">
							     	 	<span style="color:#88c8bc;">★★★☆☆</span>
							     	 </c:if>
							     	 <c:if test="${review.ratingScore ==2}">
							     	 	<span style="color:#88c8bc;">★★☆☆☆</span>
							     	 </c:if>
							     	 <c:if test="${review.ratingScore ==1}">
							     	 	<span style="color:#88c8bc;">★☆☆☆☆</span>
							     	 </c:if>
							      </td>
							    </tr>
								<tr id="${review.reviewId }bottom">
									<td colspan="5">
				                      	<div class="collapse" id="collapseExample${review.reviewId }">
								         	<div class="card card-body">
								            	${review.reviewContent }
								         	</div>
							         		<div style="display:flex; flex-direction: row-reverse;">
						            			<a type="button" onclick="deleteReview(this, event)" data-delete="${review.reviewId }" style="width:70px; text-align: right;">삭제</a>
									            <a type="button" onclick="updateReview(this, event)" data-delete="${review.reviewId }" style="width:70px;text-align: right;">수정</a>
									         	<%-- 작성날짜 : 
									         	<fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd"></fmt:formatDate> --%>
								         	</div>
								      	</div>
						   			</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
			<hr style="margin-top:0;">
			<c:if test="${noPaging!=1}"> 
				<div style="margin:auto; padding:0 auto; ">
					<table style="margin-left:28%; ">
						<tr>
							<td colspan="4" class="text-center">
								<div>
									<a class="btn btn-sm" href="mypage?subpage=myreviewlist&reviewPageNo=1">처음</a>
									<c:if test="${reviewPager.groupNo>1}">
										<a class="btn btn-outline-info btn-sm" href="mypage?subpage=myreviewlist&reviewPageNo=${reviewPager.startPageNo-1}">이전</a>
									</c:if>
									<c:forEach var="i" begin="${reviewPager.startPageNo}" end="${reviewPager.endPageNo}">
										<c:if test="${reviewPager.pageNo != i}">
											<a class="btn  btn-sm" href="mypage?subpage=myreviewlist&reviewPageNo=${i}">${i}</a>
										</c:if>
										<c:if test="${reviewPager.pageNo == i}">
											<a class="btn btn-sm" style="color:#20c997;" href="mypage?subpage=myreviewlist&reviewPageNo=${i}">${i}</a>
										</c:if>
									</c:forEach>
									<c:if test="${reviewPager.groupNo<reviewPager.totalGroupNo}">
										<a class="btn btn-outline-info btn-sm" href="mypage?subpage=myreviewlist&reviewPageNo=${reviewPager.endPageNo+1}">다음</a>
									</c:if>
									<a class="btn btn-sm" href="mypage?subpage=myreviewlist&reviewPageNo=${reviewPager.totalPageNo}">맨끝</a>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</c:if>
		</div>
	</body>
</html>