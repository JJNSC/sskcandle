<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/header/navHeader.jsp" %>

<div class="card m-2">
	<div class="card-header">
		글 수정
	</div>
	<div class="card-body">
		<form id="updateBoardForm" method="post" action="updateBoard">
			<input type="hidden" name="qnaId" value="${qna.qnaId}"/>
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text">title</span></div>
				<input id="qnaTitle" type="text" name="qnaTitle" class="form-control" value="${qna.qnaTitle}">
				<span id="titleError" class="error"></span>
			</div>
			
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text">content</span></div>
				<textarea id="qnaContent" name="qnaContent" class="form-control">${qna.qnaContent}</textarea>
				<span id="contentError" class="error"></span>
			</div>
				
			<div class="mt-3">
				<button class="btn btn-info btn-sm mr-2">수정하기</button>
				<a class="btn btn-info btn-sm" href="getBoardList">목록보기</a>
			</div>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer/footer.jsp" %>