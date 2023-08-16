<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/header/navHeader.jsp" %>

<div class="card m-2">
	<div class="card-header">
		예외 처리 내용(500)
	</div>
	<div class="card-body">		
		사유: 알수없는 서버 오류가 발생되었습니다. 관리자에게 문의하세요.
	</div>
</div>

<%@ include file="/WEB-INF/views/footer/footer.jsp" %>