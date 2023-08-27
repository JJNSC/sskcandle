<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/header/navHeader.jsp" %>

<div class="container">
	<div class="row" style="margin: 50px 0;">
		<div class="col product_thumbnail_box">
			<div class="product_thumbnail text-center">
				<i class="bi bi-image" style="font-size: 100px;"></i>
				<%-- <img src="data:${};base64, ${.base64Image}" width="200" height="200" /> --%>
			</div>
		</div>
		<form class="col form-group" action="writeBoard" method="post" enctype="multipart/form-data">
			<div class="">
				<label for="">제목</label>
				<input class="col" type="" id="" name="" />				
			</div>
			<div class="">
				<label for="">내용</label>
				<textarea class="col" name=""></textarea>
			</div>
			<div class="" style="display: flex; align-content: center; justify-content: space-between;">
				<input id="attach" type="file" name="attach" class="text-left">
				<div>
					<button class="btn btn-sm btn-info">저장</button>
					<a href="getBoardList" class="btn btn-sm btn-info">목록</a>							
				</div>
			</div>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer/footer.jsp" %>