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
			<h2>아이디 찾기</h2>
			<div class="containerBox">
				<div class="searchChoice">
					<div class="searchOn">아이디찾기</div>
					<div onclick="location.href='searchPw.me'">비밀번호찾기</div>
				</div>
				<form>
					<div class="searchContext">
					<table>
						<tbody>
							<tr>
								<th>
									이름
								</th>
								<td>
									<input type="text" name="name" id="userName"/>
								<td>
							</tr>
							<tr>
								<th>
									이메일
								</th>
								<td>
									<input type="email" name="email" id="email"/>
									<span>회원가입시 등록한 이메일을 입력해 주세요.</span>
								<td>
							</tr>
						</tbody>
					</table>
					</div>
					<div class="searchBox">
						<button type="button" onclick="location.href='${contextPath}/loginView.me'" >돌아가기</button>
					<button type="button" id="searchIdBt">찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
	
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$("#searchIdBt").click(function(){
		var name = $("#userName").val();
		var email = $("#email").val();
		
		$.ajax({
			url: 'findId.me',
			data:{name:name, email:email},
			type: 'post',
			success: function(data){
				console.log(data);
				if(data == 'sendEmail'){
					alert("메일이 전송되었습니다!");
				} else {
					alert("입력된 정보를 확인해 주세요!");
				}
				
			},
			error: function(data){
				console.log(data);
			}
		});
	});
</script>
</html> 