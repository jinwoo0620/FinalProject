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
		text-align:center;
		padding-top: 3%;
	}
	
	.logo{
		width:100%;
	}
	.main{
		width:500px;
		height:300px;
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
		padding-left:43%;
		padding-top:5%;
		
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

	<c:import url="memberHeader.jsp"></c:import>
	<div class="main">
		<div class="title">
			회원<span style="color:black;">탈퇴</span><br><br>
		</div>
		<form action="memberDelete.me" method="post" id="deleteForm">
			<table style="margin-left:15%;">
				<tr>
					<td>ID</td>
					<td><input id="id" name="id" type="text" maxlength="16" required autocomplete="off"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input id="password1" name="password1" class="passowrd" type="password" maxlength="16" required></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input id="password2" name="password2" class="password" type="password" maxlength="16" required>
						<div id="pwCheckResult"></div>
					</td>
				</tr>
				
			</table>
			<br>		
			<hr width="80%">
			<div id="button">
				<button onclick="history.go(-1);" style="border-radius:5px; width:80px; height:30px;  border:0px; cursor: pointer; color:white; background-color:#4F8CD1;">이전</button>
				<button id="modify_Btn" style="border-radius:5px; width:80px; height:30px;  border:0px; cursor: pointer; color:white; background-color:#4F8CD1;">확인</button>
			</div>
		</form>
	</div>
		
	<script>
	
	//비밀번호 정규식패턴 
// 	$("#password1").change(function(){
//     	checkPassword($('#password1').val());
// 	});
	
// 	function checkPassword(password){
    
//     	if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/.test(password)){            
//     		alert('비밀번호는 숫자+영문자+특수문자 조합으로 8~16자리를 입력해야 합니다.');
//         	$('#password1').val('').focus();
//         	return false;
//     	}   
   	
// 	    return true;
// 	} 
	
	//비밀번호 일치 확인
	$('.password').on('change paste keyup', function(){			
		var password1 = $('#password1').val().trim()
		var password2 = $('#password2').val().trim()
		if(password1 != "" && password2 != "") {
			if(password1 != "" && password2 != "" && password1 != password2){
				$('#pwCheckResult').text('비밀번호가 일치하지 않습니다.').css('color', 'red');		
				$(this).focus();
				
				
			} else {
				$('#pwCheckResult').text('비밀번호가 일치합니다.').css('color', 'green');
				
			}
		}
		
	})
	//탈퇴하기 
	$('#modify_Btn').on('click', function(){
		if(confirm("정말로 탈퇴하시겠습니까?")){
			return true;
		} else {
			return false;
		}
	});

</script> 
</body>
</html>