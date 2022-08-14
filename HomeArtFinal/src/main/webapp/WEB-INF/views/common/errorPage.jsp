<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');

	#button{
		padding-bottom:20px;
		text-align:center;
		padding-top: 3%;
	}
	
	.logo{
		width:100%;
	}
	.main{
		width:500px;
		height:100%;
		color:black;
		margin:5%  auto;
		background-color:white;
		border-radius: 20px;
	}
	
	.originalProfile {
		width: 80px;
		height: 80px;
		object-fit: cover;
		border-radius: 50%;
		margin-right: 20px;
	}
	
	.title{	
		font-size:20px;
		font-weight: bold;
		color:#4F8CD1;
		margin:5%  auto;
		
	}
	
	body{
		background-color:#EBF2FE;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	td{
		padding:5px;
	}
	
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	<div id="error-container" style="text-align: center;">
<%-- 		<h2 style="color: red;"><%= request.getAttribute("msg") %></h2> --%>
<%-- 		<h2 style="color: blue;"><%= request.getAttribute("javax.servlet.error.message") %></h2> --%>

	</div>
	<c:import url="../member/memberHeader.jsp"></c:import>
	<div class="main" style="text-align:center; padding-top:20px;">
		<div class="title" style="font-size:28px;">
			안내<br><br>
		</div>
		
		<div style="color:blue; font-size:23px;">
			${ msg }
		</div>
		
		<br><br>
		
		<div id="errorMessage" style="padding:40px;">
			<span id="print" style="font-size:18px;"></span>
			<input id="message" type="hidden" value="${ requestScope['javax.servlet.error.message'] }">
		</div>
		
		<br>		
		
		<hr width="80%">
		<div id="button">
			<button onclick="history.go(-1);" style="border-radius:5px; width:80px; height:30px;  border:0px; cursor: pointer; color:white; background-color:#4F8CD1;">이전</button>
			<button onclick="location.href='home.do';" style="border-radius:5px; width:80px; height:30px;  border:0px; cursor: pointer; color:white; background-color:#4F8CD1;">홈</button>
		</div>
	
	</div>
	<script>
		window.onload = function(){
			var message = $('#message').val();
			var messageArr =message.split(":");
			
			console.log(messageArr);
			
			$('#print').text(messageArr[1]);
		}
	</script>
</body>
</html>