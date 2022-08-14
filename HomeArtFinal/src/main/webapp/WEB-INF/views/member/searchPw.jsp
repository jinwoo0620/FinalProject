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
			<h2>비밀번호 찾기</h2>
			<div class="containerBox">
				<div class="searchChoice">
					<div onclick="location.href='searchId.me'">아이디찾기</div>
					<div class="searchOn">비밀번호찾기</div>
				</div>
				<form  action="findPwView.me" method="post" >
					<div class="searchContext">
					<table>
						<tbody>
							<tr>
								<th>
									아이디
								</th>
								<td>
									<input type="text" name="id" id="userId"/>
								<td>
							</tr>
							<tr>
								<th>
									이름
								</th>
								<td>
									<input type="text" name="name" id="userName"/>
								<td>
							</tr>
							<tr class="searchPass">
								<th>
									이메일
								</th>
								<td>
									<input type="email" name="email" id="email"/>
									<button type="button" id="emailCk">인증</button>
									<span id="checkEmail">회원가입시 등록한 이메일을 입력해 주세요.</span>
								<td>
							</tr>
							<tr>
								<th>
									인증번호 입력
								</th>
								<td>
									<input type="text" name="searchPass" id="searchPass" disabled="disabled"/>
								<td>
							</tr>
						</tbody>
					</table>
					</div>
					<div class="searchBox">
						<button type="button" onclick="location.href='${contextPath}/loginView.me'">돌아가기</button>
						<button type="submit" id="searchPwGo">찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
	
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// 이메일 인증
	$("#emailCk").click(function(){
		var id = $("#userId").val();
		var name = $("#userName").val();
		var email = $("#email").val();
		var checkText = $("#checkEmail");
		
		if(email == ""){
			alert("메일주소를 입력해 주세요");
		} else{
			$.ajax({
				url:"searchPwEmail.me",
				data:{id:id, name:name, email:email},
				success :function(data){
					if(data == "noEmail"){
						alert("입력된 정보를 확인해 주세요");
						return false;
					}
					console.log("성공 :"+data);
					$("#searchPass").attr("disabled",false);
					$("#checkEmail").html("메일을 발송했습니다.").attr({'style':'color:green'});
					code = data;
				},
				error: function(data){
					console.log("실패 :"+data);
				}
			});
		}
	});
	
	var findePwCheck = false;
	// 이메일 인증번호 입력
	$("#emailCk").on('change paste keyup', function(){
		findePwCheck = false;
	});
	$("#searchPass").blur(function(){
		if($(this).val() == code){
			$("#checkEmail").html("확인되었습니다.").attr({'style':'color:green'});
			findePwCheck = true;
		} else{
			$("#checkEmail").html('인증번호가 일치하지 않습니다.').attr({'style':'color:red'});
			findePwCheck = false;
		}
	});
	
	// 재설정 페이지 넘어가기
	$("#searchPwGo").click(function(){
		if(findePwCheck == false){
			alert("인증을 완료 해 주세요!");
			return false;
		}
	});
</script>

</html>