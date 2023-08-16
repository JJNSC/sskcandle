<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#notfound {
		position: relative;
		height: 50vh;
	}
	
	#notfound .notfound {
	    position: absolute;
	    left: 50%;
	    top: 50%;
	    -webkit-transform: translate(-50%,-50%);
	    -ms-transform: translate(-50%,-50%);
	    transform: translate(-50%,-50%);
	}
	
	.notfound .notfound-404 {
	    position: relative;
	    height: 240px;
	}
	
	.notfound-404 {
	    line-height: 1.4;
	    text-align: center;
	    box-sizing: border-box;
	    position: relative;
	    height: 240px;
	}
	
	.notfound .notfound-404 h3 {
	    font-family: cabin,sans-serif;
	    position: relative;
	    font-size: 16px;
	    font-weight: 700;
	    text-transform: uppercase;
	    color: #262626;
	    margin: 0;
	    letter-spacing: 3px;
	    padding-left: 6px;
	}

	.notfound .notfound-404 h1 {
	    font-family: montserrat,sans-serif;
	    position: absolute;
	    left: 50%;
	    top: 50%;
	    -webkit-transform: translate(-50%,-50%);
	    -ms-transform: translate(-50%,-50%);
	    transform: translate(-50%,-50%);
	    font-size: 252px;
	    font-weight: 900;
	    margin: 0;
	    color: #262626;
	    text-transform: uppercase;
	    letter-spacing: -40px;
	    margin-left: -20px;
	}
	
	.notfound .notfound-404 h1 > span {
	    text-shadow: -8px 0 0 #fff;
	}
	
	.notfound h2 {
	    font-family: cabin,sans-serif;
	    font-size: 20px;
	    font-weight: bold;
	    text-transform: uppercase;
	    color: #000;
	    margin-top: 0;
	    margin-bottom: 25px;
	    
	}
</style>

<%@ include file="/WEB-INF/views/header/navHeader.jsp" %>

<div id="notfound">
	<div class="notfound">
		<div class="notfound-404">
			<h3>Oops! Bad Gateway</h3>
			<h1><span>5</span><span>0</span><span>2</span></h1>
		</div>
		<h2>유효하지 않은 응답입니다.</h2>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer/footer.jsp" %>