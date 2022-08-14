<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="<%= request.getContextPath() %>"></c:set>
<title>Insert title here</title>
<link href="${contextPath}/resources/css/signSuccessCSS.css" rel="stylesheet" />
</head>
<body>

	<div class="bodyWrap">
		<div class="container">
			<div class="signSuccessImg">
				<div class="ssBg">
					<img src="https://imgur.com/uGoL4cq.jpg">
					<img src="https://imgur.com/u5iNf7x.jpg">
				</div>
				<div class="userPt">
				<c:if test="${loginUser.renameFileName != null}">
					 <img src="${contextPath}/resources/muploadFiles/${loginUser.renameFileName}">
				 </c:if>
				 <c:if test="${loginUser.renameFileName == null}">
					<img src="https://imgur.com/ccT0Yj3.png">
				 </c:if>
				</div>
			</div>
			<div class="signSuccessText">
			<!-- 로그인 등급에 따른 조회 다르게 하기 -->
				<h3>${loginUser.name}님 홈아트에 오신것을 환영합니다!</h3>
				<c:if test="${loginUser.power == 0 }">
					<strong>당신의 실내인테리어의 꿈을 이루어 보세요.<br>홈아트가 언제나 당신과 함께합니다.</strong>
				</c:if>
				<br>
				<c:if test="${loginUser.power == 1 }">
					<strong>프로패셔널한 당신의 솜씨를 빛내보세요.<br>홈아트가 언제나 당신과 함께합니다.</strong>
				</c:if>
				<div class="successBt">
					<button type="button" onclick="location.href='${contextPath}/home.do'">메인으로 이동</button>
					<button type="button" onclick="location.href='${contextPath}/commnuityList.bo'">인테리어 구경하기</button>
					
				</div>
			</div>
		</div>
	</div>
</body>
	
</html>