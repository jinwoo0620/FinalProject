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
		text-align: center;
		padding-top: 3%;
	}

	.logo{
		width:100%;
	}
	.main{
		width:670px;
		height:830px;
		color:black;
		margin: 5% auto;
		background-color:white;
		border-radius: 20px;
	}
	
	.memberPhoto {
		width: 80px;
		height: 80px;
		object-fit: cover;
		border-radius: 50%;
		margin-right: 20px;
		cursor:pointer;
	}
	
	.title{	
		font-size:20px;
		font-weight: bold;
		color:#4F8CD1;
		text-align:center;
		padding-top:5%
		
	}
	
	body{
		background-color:#EBF2FE;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	td{	
		padding:20px;
	}
	
	#btnGroup{
		text-align:center;
		padding:20px;
	}
	
	#btnGroup *{
		text-align:center;		
		margin:10px;
	}
	
	
	
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>

	<form action="memberModify.me" method="post"  enctype="multipart/form-data">
		<c:import url="memberHeader.jsp"></c:import>
		<div class="main">
			<div class="title">
				일반 <span style="color:black;">회원정보 수정</span><br><br>
			</div>
			<table style="margin:auto;">
				<tr>
					<td>사진</td>
						<td>
						<c:if test="${ !empty loginUser.renameFileName }">
							<img id="preview" class="memberPhoto" src="resources/muploadFiles/${ loginUser.renameFileName }"/>
							<input type="file" name="uploadFile" accept="image/*" onchange="readURL(this);"> 
						</c:if>
						<c:if test="${ empty loginUser.renameFileName }">
							<img id="preview" class="memberPhoto" src="resources/images/basicMemberPhoto.png"/>
							<input type="file" name="uploadFile" accept="image/*" onchange="readURL(this);"> 
						</c:if>
						</td>
				</tr>		
				<tr>
					<td>닉네임 </td>
					<td>
						<input type="text" id="nickName" name="nickName" maxlength="16" value="${ loginUser.nickName }" onKeyup="this.value=this.value.replace( /[^a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|0-9]/g,'');" required>
						<div id="nickNameGuide" style="font-size:14px;"></div> 
						<input type="hidden" value="이미 사용중인 닉네임 입니다." size="22px" style="border:0; color:red;"> 
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input id="password1" name="password1"  class="password" type="password" placeholder="비밀번호를 입력하세요." maxlength="16" required>
						<div id="pwResult"></div>
					</td>
				</tr>
				<tr>
					<td class="left-over-cell">비밀번호 확인</td>
					<td>
						<input id="password2" name="password2" class="password" type="password" placeholder="비밀번호를 입력하세요." maxlength="16" required>
						<div id="pwCheckResult" style="font-size:15px;"></div>
					</td>
				</tr>
				<tr>
					<td>주소</td> 
					<td>
						<input type="text" name="address1" id="address1" class="address"  value="${addressArr[0]}" size="25" required/><br>
						<input type="text" name="address2" id="address2" class="address"  value="${addressArr[1]}" size="25" required/><br>
						<input type="text" name="address3" id="address3" class="address" value="${addressArr[2]}" size="25" placeholder="상세주소 입력" required/>
						<button type="button" id="searchAddress">검색</button>					
					</td> 
				</tr>
				
				<tr>
					<td>휴대폰</td>
					<td><input id="phoneNumber1" name="phoneNumber1" type="text" maxlength="3" value="${phoneArr[0]}" size="2px;" onKeyup="this.value=this.value.replace( /[^0-9]/g,'');" required>
						- <input id="phoneNumber2" name="phoneNumber2" type="text" maxlength="4" value="${phoneArr[1]}" size="4px;" onKeyup="this.value=this.value.replace( /[^0-9]/g,'');" required>
						- <input id="phoneNumber3" name="phoneNumber3" type="text" maxlength="4" value="${phoneArr[2]}" size="4px;"  onKeyup="this.value=this.value.replace( /[^0-9]/g,'');" required>
<!-- 						<input value="인증번호 " style="border:0px; cursor: pointer; color:white; background-color:#4F8CD1;"> -->
					</td>
				</tr>
				<tr>
					<td>이메일 주소</td>
					<td>
						<input type="text" name="email1" id="email1" size="10px" value="${emailArr[0]}" maxlength="12" autocomplete="off" placeholder="이메일 아이디" onKeyup="this.value=this.value.replace( /[^a-z|A-Z|0-9]/g,'');" required> 
						<input id="at" value="@" disabled style="width:14px;">
						<input type="text" name="email2" id="email2" size="10px" value="${emailArr[1]}" autocomplete="off" placeholder="이메일 주소" onKeyup="this.value=this.value.replace( /[^a-z|A-Z|.]/g,'');" required>
						<select class="custom-select" name="selectEmail" id="selectEmail" required>
							 <option value="1" selected>직접입력</option>
							 <option value="naver.com">naver.com</option>
							 <option value="hanmail.net">daum.net</option>
							 <option value="hanmail.net">nate.com</option>
							 <option value="iei.co.kr">iei.kr</option>
						</select>
							<br>				
							<input id="checkNumber" type="text" size="20px" maxlength="6" placeholder="인증번호를 입력해주세요." required> &nbsp;
							<input type="button" id="sendEmailBtn" value="인증번호 발송" style="border:0px; cursor: pointer; color:white; background-color:#4F8CD1;">
							<input type="button" id="checkNumberBtn" value="확인" style="border:0px; cursor: pointer; color:white; background-color:#4F8CD1;">
					</td>
				</tr>									
			</table>
			<br>		
			<hr width="80%">
			<div id="btnGroup">
				<input onclick = "history.back(-1);" style="border-radius:5px; width:80px; height:30px; border:0px; cursor: pointer; color:white; background-color:#4F8CD1;" value="이전">
				<button style="border-radius:5px; width:80px; height:30px; border:0px; cursor: pointer; color:white; background-color:#4F8CD1;">확인</button>
			</div>
		</div>
	</form>
		
	<script>
		//직접입력 selectBox선택시 이메일 주소 입력창 활성화
		$('#selectEmail').change(function(){ 
		  	$("#selectEmail option:selected").each(function () { 
		  		if($(this).val()== '1'){ //selectBox에서 직접입력을 선택하면 
		 			$("#email2").val(''); 				  //직접입력 창을 한번 비워주고
		 			$("#email2").attr("disabled",false); //직접입력 input창 이용할 수 있게 속성변경
		 		
		  		}else { 
		  			$("#email2").val($(this).text()); 	  //this(selectEmail)요소의 text를 직접입력창의 value로 대입해주고
		  			$("#email2").attr("readonly",true);  //직접입력 input창 이용할 수 없게 속성변경
		  		} 
		  	}); 
		}); 
	
		//닉네임 정규식 패턴(글자수)
		$("#nickName").change(function(){
	    	checkNickName($('#nickName').val());
		});
		
		function checkNickName(nickName){
		    
	    	if(!/^[a-zA-Zㄱ-힣0-9]{4,16}$/.test(nickName)){            
	    		alert('닉네임은 한글이나 영어 혹은 숫자를 사용하여  4~16글자 사이로 작성해야 합니다.');
	        	$('#nickName').val('').focus();
	        	return false;
	    	}   
	    	return true;
		}
		
		//닉네임 중복확인
		$('#nickName').change(function(){

			var nickName = $('#nickName');
			
			if(nickName.val() != '') {
				$.ajax({
					url: 'checkNickName.me',
					type: 'post',
					data: {nickName:nickName.val()}, 
					success: function(data){
						console.log(data);
						if(data == "0"){
							$('#nickNameGuide').text('사용 가능한 닉네임 입니다.').css({'color':'green', 'display':'inline-block'});
							
						} else if(data == "1"){
							$('#nickNameGuide').text('이미 사용중인 닉네임 입니다.').css({'color':'red', 'display':'inline-block'});
							nickName.val('').focus();
						}
					},
					error: function(data){
						alert("통신실패");
						console.log(data);
					}	
				});
			}		
		});
		
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
		
				
		//비밀번호 정규식패턴 
		$(".password").change(function(){
	    	checkPassword($('.password').val());
		});
		
		function checkPassword(password){
	    
	    	if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/.test(password)){            
	    		alert('비밀번호는 숫자+영문자+특수문자 조합으로 6~16자리를 입력해야 합니다.');
	        	$('#password1').val('').focus();
	        	return false;
	    	}   
	    	
			else if(/(\w)\1\1\1/.test(password)){
	        	alert('보안성을 위해 같은 문자를 4번 이상 사용하실 수 없습니다.');
	        	$('#password1').val('').focus();
	        	return false;
	    	}
	    	
	    	else if($('#password1').val() != '' && $('#password2').val() != ''){
	    		if($('#password1').val() != $('#password2').val()) {
		    		alert('비밀번호가 서로 일치하지 않습니다. 다시 입력하여 주십시오.');
		    		$('.password').val('').focus();
		    		return false;
		    	}
		    	
	    	}
	    	
		    return true;
		} 
		
		
		//휴대폰 번호 정규식(글자수)
		//휴대폰 앞 3자리
		$("#phoneNumber1").change(function(){
	    	checkPhoneNumber($('#phoneNumber1').val());
		});
		
		function checkPhoneNumber(phoneNumber){
		    
	    	if(!/^[0-9-]{3,3}$/.test(phoneNumber)){            
	    		alert("휴대폰 앞 자리 번호를 모두 입력하여 주십시오.");
	        	$('#phoneNumber1').val('').focus();
	        	return false;
	    	}   
	    	return true;
		}
		
		//휴대폰 중간 4자리
		$("#phoneNumber2").change(function(){
	    	checkPhoneNumber2($('#phoneNumber2').val());
		});
		
		function checkPhoneNumber2(phoneNumber){
		    
	    	if(!/^[0-9-]{4,4}$/.test(phoneNumber)){            
	    		alert("휴대폰 중간 자리 번호를 모두 입력하여 주십시오.");
	        	$('#phoneNumber2').val('').focus();
	        	return false;
	    	}   
	    	return true;
		}
		
		//휴대폰 뒤 4자리
		$("#phoneNumber3").change(function(){
	    	checkPhoneNumber3($('#phoneNumber3').val());
		});
		
		function checkPhoneNumber3(phoneNumber){
		    
	    	if(!/^[0-9]{4,4}$/.test(phoneNumber)){            
	    		alert("휴대폰 마지막 자리 번호를 모두 입력하여 주십시오.");
	        	$('#phoneNumber3').val('').focus();
	        	return false;
	    	}   
	    	return true;
		}	
		
		//이메일 아이디 정규식패턴
// 		$("#email1").change(function(){
// 			checkEmailId($('#email1').val());
// 		});
		
// 		function checkEmailId(email1){
		    
// 	    	if(!/^[a-zA-Z0-9]{4,12}$/.test(email1)){            
// 	    		alert("4~12글자 사이의 이메일 ID를 입력하여 주십시오.");
// 	        	$('#email1').val('').focus();
// 	        	return false;
// 	    	}   
// 	    	return true;
// 		}
		
		//첨부한 이미지파일 미리보기
		function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		     
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  }
		}
		
		//카카오 주소검색 API
		$("#searchAddress").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	$("#address1").val(data.zonecode);
		        	$("#address2").val(data.address);
		        	$("#address3").focus();
		        }
		    }).open();
		});
		
		//이메일 발송  
		$('#sendEmailBtn').click(function(){
			var emailId = $('#email1');
			var emailAddress = $('#email2');
			
			if(emailId.val() != '' && emailAddress.val() != '') {
				$.ajax({
					url: 'sendEmail.me',
					type: 'post',
					data: {emailId:emailId.val(), emailAddress:emailAddress.val()}, 
					success: function(data){
						alert("인증번호가 해당 이메일로 발송되었습니다. 이메일을 확인하여 주십시오.");
						
						$('#checkNumber').change(function(){
							
							var checkNumber = $('#checkNumber');
							console.log(data.checkNumber);
							
							if(checkNumber.val() == data.checkNumber) {
								alert("인증에 성공하였습니다.");
								$('#sendEmailBtn').attr('type','hidden');
							} else{
								alert("인증에 실패 하였습니다. 다시 시도해 주세요.");
								checkNumber.val('').focus();
							}
						});	
					},
					error: function(data){
						alert("통신실패");
						console.log(data);
					}	
				});
			} else{
				alert("이메일 아이디와 이메일 주소를 모두 입력해 주십시오.");
			}
		});
</script>
</body>
</html>