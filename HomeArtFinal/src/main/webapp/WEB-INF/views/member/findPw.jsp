<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  
<link href="${contextPath}/resources/css/searchIdPwCSS.css"  rel="stylesheet"/>
</head>
<body>

	<div class="bodyWrap">
		<c:import url="memberHeader.jsp"></c:import>
		<div class="container">
			<h2>비밀번호 재설정</h2>
			<div class="containerBox">
				<form method="post" action="changePw.me">
					<div class="searchContext">
					<table>
						<tbody>
							<tr>
								<th>
									비밀번호
								</th>
								<td>
									<input type="password" name="pwd" id="userPw"/>
									<span id="checkPw"></span>
								<td>
							</tr>
							<tr>
								<th>
									비밀번호 확인
								</th>
								<td>
									<input type="password" name="pwd2" id="userPw2"/>
									<span id="checkPw2"></span>
								<td>
							</tr>
						</tbody>
					</table>
					</div>
					<div class="searchBox">
						<button type="button" onclick="location.href='${contextPath}/loginView.me'">돌아가기</button>
						<button type="submit" id="newPwSubmit">재설정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
	
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var pwCheck = false;
	var pwCheck2 = false;
	
	// 유효성 검사..
	$("#userPw").change(function(){
		var pwLength = $("#userPw").val().length;
		var pwRule = /[^a-zA-Z0-9@$!%*?&]/g;
		var pwRule2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/g;
		
		if( pwLength >= 17 || pwLength <= 3 ){
			$(this).focus();
			$("#checkPw").html('4글자이상 16글자 이하로 입력해 주세요.').attr({'style':'color:red'});
			$(this).css("border","1px solid red");
			pwCheck = false;
		}  else if(!pwRule2.test($(this).val())){
			$(this).focus();
			$("#checkPw").html('영문,숫자,특수문자(@$!%*?&)를 섞어서 사용해주세요').attr({'style':'color:red'});
			$(this).css("border","1px solid red");
			pwCheck = false;
		} else if(pwRule.test($(this).val())){
			$(this).focus();
			$("#checkPw").html('사용할 수 없는 문자가 포함되 있습니다. 특수문자 @$!%*?&만 사용').attr({'style':'color:red'});
			$(this).css("border","1px solid red");
			pwCheck = false;
		} else{
			$("#checkPw").html('사용가능한 비밀번호 입니다.').attr({'style':'color:green'});
			$(this).css("border","1px solid #A7A7A7");
			pwCheck = true;
		}
	});
	
	
	
	$("#userPw2").change(function(){
		var pwd1 = $("#userPw").val();
		var pwd2 = $("#userPw2").val();
		if(pwd1 != pwd2){
			$(this).focus();
			$("#checkPw2").html('비밀번호가 일치하지 않습니다.').attr({'style':'color:red'});
			$(this).css("border","1px solid red");
			pwCheck2 = false;
		} else {
			$("#checkPw2").html('확인되었습니다.').attr({'style':'color:green'});
			$(this).css("border","1px solid #A7A7A7");
			pwCheck2 = true;
		}
	});
	
	$("#newPwSubmit").click(function(){
		console.log("pwCheck2 : " + pwCheck2);
		console.log("pwCheck : " + pwCheck);
		if(pwCheck == false || pwCheck2 == false){
			alert("비밀번호 확인을 해주세요!");
			return false;
		}
	});
	
</script>
</html>