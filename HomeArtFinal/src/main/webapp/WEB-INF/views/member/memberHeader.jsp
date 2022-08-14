<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>
<title>Insert title here</title>
<style type="text/css">
	header{height: 50px; width: 100%;}
	.headerBar{widht:100%; height:100%; background: #4F8CD1;}
	.headerBar>h1{font-size: 30px;color: #fff;text-align: center;}
	.headerBar>h1:hover{cursor: pointer;}
	.headerBar>h1>img{height: 30px;vertical-align: -10%;margin-left: 10px;}
</style>
</head>
<body>

	<header>
		<div class="headerBar">
			<h1 onclick="location.href='${contextPath}/home.do'" title="홈으로 돌아가기">HomeArt<img alt="" src="https://imgur.com/11527lC.png"></h1>
		</div>
	</header>
</body>
	
</html>