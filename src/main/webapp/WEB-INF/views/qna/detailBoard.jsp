<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/WEB-INF/views/header/navHeader.jsp" %>

<div class="card m-2">
	<div class="card-header">
		게시물 내용
	</div>
	<div class="card-body">
		<div>
			<div>
				<div>
					<p>
						<span>번호:</span> 
						<span>${qna.qnaId}</span>
					</p>
					
					<p>
						<span>제목:</span> 
						<span>${qna.qnaTitle}</span>
					</p>
					
					<p>
						<span>글쓴이:</span> 
						<span>${qna.userName}</span>
					<p>
					
					<p>
						<span>날짜:</span> 
						<span><fmt:formatDate value="${qna.qnaDate}" pattern="yyyy-MM-dd HH.mm.ss"/></span> <br/>
					</p>
					
					<c:if test="${qna.qnaImage != null}">
						<p>
							<span>첨부:</span> 
							<span>
								<%-- 
								첨부파일 이름	
								${qna.battachoname} 
								--%>
								
								<!-- 첨부 파일이 DB에 저장되어 있는 경우 -->
								<c:if test="${qna.qnaImage != null}">
									<a href="filedownload?qnaId=${qna.qnaId}" 
										class="btn btn-info btn-sm ml-2">다운로드</a>
									<img src="data:${qna.qnaAttachType};base64, ${base64Img}" height="100"/>
								</c:if>
							</span> 
						</p>
					</c:if>
				</div>
				
				<div>
					<span class="title">내용:</span> <br/>
					<textarea style="width:100%" readonly>${qna.qnaContent}</textarea>
				</div>
				
				<a class="btn btn-info btn-sm mt-2" href="getBoardList">목록</a>
				
				<%-- <c:if test="${ch13Login.mid == board.mid}">
					<a class="btn btn-info btn-sm mt-2" href="updateBoard?bno=${board.bno}">수정</a>
					<a class="btn btn-info btn-sm mt-2" href="deleteBoard?bno=${board.bno}">삭제</a>				
				</c:if> --%>
				<a class="btn btn-info btn-sm mt-2" href="updateBoard?qnaId=${qna.qnaId}">수정</a>
				<a class="btn btn-info btn-sm mt-2" href="deleteBoard?qnaId=${qna.qnaId}">삭제</a>	
				
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer/footer.jsp" %>