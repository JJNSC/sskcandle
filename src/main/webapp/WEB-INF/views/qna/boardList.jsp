<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/header/navHeader.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qna/boardList.css">
<script src="${pageContext.request.contextPath}/resources/js/qna/boardList.js"></script>

<div class="container">
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">상품명</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${boards}">
				<tr>
					<td>${board.qnaId}</td>
					<%-- <td><a href="detailBoard?qnaId=${board.qnaId}">${board.qnaTitle}</a></td>
					<td><a href="detailBoard?qnaId=${board.qnaId}">${board.productName}</a></td> --%>
					<td><a href="javascript:void(0);" class="accordion-toggle" data-toggle="collapse" data-target="#collapse${board.qnaId}">${board.qnaTitle}</a></td>
                    <td><a href="javascript:void(0);" class="accordion-toggle" data-toggle="collapse" data-target="#collapse${board.qnaId}">${board.productName}</a></td>
					<td>${board.userName}</td>
					<td><fmt:formatDate value="${board.qnaDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
                    <td colspan="5" class="hiddenRow">
                        <div class="collapse" id="collapse${board.qnaId}">
                            <div class="card card-body justify-content-center hidden_info">
                               	<div class="row align-items-center adjust_col h-100">
							        <div class="col-2 d-flex justify-content-center">
							        	<c:if test="${board.base64Image != null}">
							            	<img src="data:${board.qnaAttachType};base64,${board.base64Image}" width="200" height="200" class="img-fluid" />
										</c:if>
										<c:if test="${board.base64Image == null}">
											<i class="bi bi-card-image d-flex justify-content-center align-items-center" style="font-size: 100px;"></i>
										</c:if>
							        </div>
							        <div class="col-6 content_font">${board.qnaContent}</div>
							    </div>
                            </div>
                        </div>
                    </td>
                </tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4" class="text-center">
					<div>
						<a class="btn btn-sm" href="getBoardList?pageNo=1">처음</a>
						<c:if test="${pager.groupNo>1}">
							<a class="btn btn-sm" href="getBoardList?pageNo=${pager.startPageNo-1}">이전</a>
						</c:if>
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo != i}">
								<a class="btn btn-sm" href="getBoardList?pageNo=${i}">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a class="btn btn-sm" href="getBoardList?pageNo=${i}">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<a class="btn btn-sm" href="getBoardList?pageNo=${pager.endPageNo+1}">다음</a>
						</c:if>
						<a class="btn btn-sm" href="getBoardList?pageNo=${pager.totalPageNo}">맨끝</a>
					</div>
				</td>
				<td class="text-right">
					<a href="writeBoard" class="btn btn-sm btn-secondary">새글쓰기</a>
				</td>
			</tr>
		</tfoot>
	</table>
</div>

<%@ include file="/WEB-INF/views/footer/footer.jsp" %>