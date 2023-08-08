<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/header/navHeader.jsp" %>

<div class="card m-2">
	<div class="card-header">
		새글쓰기
	</div>
	<div class="card-body">
		<form id="writeBoardForm" method="post" action="writeBoard" enctype="multipart/form-data">
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text">title</span></div>
				<input id="title" type="text" name="title" class="form-control">
			</div>
			
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text">content</span></div>
				<textarea id="content" name="content" class="form-control"></textarea>
			</div>
			
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text">attach</span></div>
				<input id="attach" type="file" name="attach" class="form-control">
			</div>
				
			<div class="mt-3">
				<button class="btn btn-info btn-sm mr-2">저장</button>
				<a class="btn btn-info btn-sm" href="getBoardList">목록</a>
			</div>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer/footer.jsp" %>