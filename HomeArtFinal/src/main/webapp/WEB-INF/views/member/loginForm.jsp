<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="#">
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  
<link href="${contextPath}/resources/css/loginFormCSS.css"  rel="stylesheet"/>
<!-- <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script> -->
<script type="text/javascript">
</script>
</head>
<body>

	<div class="bodyWrap">
		<c:import url="memberHeader.jsp"></c:import>
		<div class="container">
			<h2>로그인</h2>
			<div class="containerBox">
				<!-- 일반 로그인 -->
				<div class="loginWrap logRight log-on" id="loginWrap" >
					<form>
						<input type="text" class="input" placeholder="아이디" name="id" id="loginId"/>
						<input type="password" class="input" placeholder="비밀번호" name="pwd" id="loginPwd"/>
						<button type="button" class="loginBt" id="loginBt" >Log in</button>
					</form>
	
					<div class="loginCheck">
						<ul>
							<li><a onclick="location.href='${contextPath}/searchId.me'">아이디 찾기</a></li>
							<li>/</li>
							<li><a onclick="location.href='${contextPath}/searchPw.me'">비밀번호 찾기</a></li>
						</ul>
						<span><a onclick="location.href='${contextPath}/signUpView.me'">아직 계정이 없으시다면?</a></span>
					</div>
				</div>
				
				<!-- 전문 로그인 -->
				<div class="eLoginWrap logLeft" id="eLoginWrap" style="opacity: 0;">
					<form>
						<input type="text" class="input" placeholder="아이디" name="id" id="eloginId"/>
						<input type="password" class="input" placeholder="비밀번호" name="pwd" id="eloginPwd"/>
						<button type="button" class="eloginBt" id="eloginBt" >Log in</button>
					</form>
					<div class="loginCheck">
						<ul>
							<li><a onclick="location.href='${contextPath}/searchId.me'">아이디 찾기</a></li>
							<li>/</li>
							<li><a onclick="location.href='${contextPath}/searchPw.me'">비밀번호 찾기</a></li>
						</ul>
						<span><a onclick="location.href='${contextPath}/eSignUpView.me'">아직 계정이 없으시다면? 전문가로 등록!</a></span>
					</div>
				</div>
				
				<!-- 로그인 전환 -->
				<div class="loginToggle" id="loginToggle">
					<strong>전문가 이신가요?</strong>
					<strong>프로페셔널한 당신을 위한 HomeArt 전문가로그인으로 이동합니다.</strong>
					<div class="toggleBt" id="toggleBt">로그인 전환</div>
				</div>
			</div>
			
		</div>
	</div>
</body>
	
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script type="text/javascript">
$(function(){
	$("#toggleBt").click(function(){
		
		if($("#loginToggle").hasClass("tOn")){
			$("#loginToggle").removeClass("tOn");
			$("#loginToggle strong:first-of-type").html("전문가 이신가요?");
			$("#loginToggle strong:nth-of-type(2)").html("프로페셔널한 당신을 위한 HomeArt 전문가로그인으로 이동합니다.");
			$('#eLoginWrap').animate({opacity: '0'}, 1000).removeClass("log-on");
			$("#loginWrap").addClass("log-on").animate({opacity: '1'}, 1000);
			
		} else{
			$("#loginToggle").addClass("tOn");
			$("#loginToggle strong:first-of-type").html("전문가의 손길이  필요하신가요?");
			$("#loginToggle strong:nth-of-type(2)").html("당신을 위해 준비중인 수많은 전문 인력들이 있습니다.");
			$('#loginWrap').animate({opacity: '0'}, 1000).removeClass("log-on");
			$("#eLoginWrap").addClass("log-on").animate({opacity: '1'}, 1000);
		}
	});
	
});
//로그인 입력확인
$("#loginBt").click(function(){
	var loginId = $('#loginId').val();
	var loginPwd = $('#loginPwd').val();
	if(loginId == ""){
		alert('아이디를 입력하세요');
		$('#loginId').focus();
		return false;
	}
	if(loginPwd == ""){
		alert('비밀번호를 입력하세요');
		$('#loginPwd').focus();
		return false;
	}
	$.ajax({
		url:"login.me",
		type: "post",
		data:{id:loginId, pwd:loginPwd},
		success :function(data){
			if(data == "expert"){
				alert("전문가 폼에서 로그인을 진행해 주세요!");
				console.log("expert :"+data);
				return false;
			} else if(data == "noUser"){
				console.log("noUser :"+data);
				alert("아이디 혹은 비밀번호를 확인해 주세요!");
				return false;
			}
			console.log("성공 :"+ data);
			location.href = "home.do";
		},
		error: function(data){
			console.log("실패 :"+data);
		}
	});
});

//전문가 로그인 입력확인

$("#eloginBt").click(function(){
	var loginId = $('#eloginId').val();
	var loginPwd = $('#eloginPwd').val();
	if(loginId == ""){
		alert('아이디를 입력하세요');
		$('#eloginId').focus();
		return false;
	}
	if(loginPwd == ""){
		alert('비밀번호를 입력하세요');
		$('#eloginPwd').focus();
		return false;
	}
	$.ajax({
		url:"elogin.me",
		type: "post",
		data:{id:loginId, pwd:loginPwd},
		success :function(data){
			if(data == "expert"){
				alert("일반회원 폼에서 로그인을 진행해 주세요!");
				console.log("expert :"+data);
				return false;
			} else if(data == "noUser"){
				console.log("noUser :"+data);
				alert("아이디 혹은 비밀번호를 확인해 주세요!");
				return false;
			}
			console.log("성공 :"+ data);
			location.href = "home.do";
		},
		error: function(data){
			console.log("실패 :"+data);
		}
	});
});


/* 

// 네이버 로그인처리
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "tLwA0lgccZmRnTYCXQer", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://homeArt/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			
			var email = naverLogin.user.getEmail();
			var gender = naverLogin.user.getGender();
			var id = naverLogin.user.getId();
			var name = naverLogin.user.getName();
			var nickName = naverLogin.user.getNickName();

			$.ajax({
				type: 'post',
				url: 'naverSave',
				data: {'n_email':email, 'n_gender':gender, 'n_id':id, 'n_name':name, 'n_nickName':nickName},
				dataType: 'text',
				success: function(data) {
					if(data=='ok') {
						console.log('성공');
						location.replace("${contextPath}/member/loginForm.jsp"); 
					} else if(result=='no') {
						console.log('실패');
						location.replace("${contextPath}/member/loginForm.jsp");
					}
				},
				error: function(data) {
					console.log('오류 발생');
				}
			})
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
}
 */


</script>
</html>