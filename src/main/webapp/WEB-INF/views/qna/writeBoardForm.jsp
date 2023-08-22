<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/header/navHeader.jsp" %>

<div class="container">
	<div class="row">
		<div class="col product_thumbnail_box">
			<div class="product_thumbnail">
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
			<div class="text-right">
				<button class="btn btn-sm btn-info">저장</button>
				<a href="getBoardList" class="btn btn-sm btn-info">목록</a>			
			</div>
		</form>
	</div>
</div>

<div class="container">
	<div class="card m-2">
		<div class="card-header">
			문의글 작성
		</div>
		<div class="card-body">
			<form id="writeBoardForm" method="post" action="writeBoard" enctype="multipart/form-data">
				<div class="input-group">
					<div class="input-group-prepend" style="width:100px;"><span class="input-group-text" style="width:100px; background-color: #00000008;">제목</span></div>
					<input id="title" type="text" name="qnaTitle" class="form-control">
				</div>
				
				<div class="input-group">
					<div class="input-group-prepend" style="width:100px; height:100px;"><span class="input-group-text" style="width:100px; background-color: #00000008;">내용</span></div>
					<textarea id="content" name="qnaContent" class="form-control"></textarea>
				</div>
				
				<div class="input-group">
					<div class="input-group-prepend" style="width:100px;"><span class="input-group-text" style="width:100px; background-color: #00000008;">파일첨부</span></div>
					<input id="attach" type="file" name="attach" class="form-control">
				</div>
					
				<div class="mt-3" style="display:flex; justify-content: flex-end;">
					<button class="btn btn-info btn-sm mr-2" style="background-color:#88c8bc; border-color:#88c8bc;">저장</button>
					<a class="btn btn-info btn-sm" href="getBoardList" style="background-color:#88c8bc; border-color:#88c8bc;">목록</a>
				</div>
			</form>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/footer/footer.jsp" %>