<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');

	.logo{
		width:100%;s
	}
	.main{
		width:700px;
		height:1000px;
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
		padding-left:35%;
		padding-top:5%;
		
	}
	
	body{
		background-color:#EBF2FE;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	td{
		padding:15px;
	}
	
	.left-over-cell{
		width:95px;
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

	<c:import url="memberHeader.jsp"></c:import>	
	<div class="main">
		<form action="expertModify.me" method="post"  enctype="multipart/form-data">
			<div class="title">
				전문가 <span style="color:black;">회원정보 수정</span><br><br>
			</div>
			
				<table style="margin-left:15%;">
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
							<input id="password1" name="password1" class="password" type="password" placeholder="비밀번호를 입력하세요." maxlength="16" required>
							<div id="pwDupCheckResult" style="font-size:15px;"></div>					
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
							<input type="text" name="address1" id="address1" class="address" value="${addressArr[0]}" required/><br>
							<input type="text" name="address2" id="address2" class="address" value="${addressArr[1]}" required/><br>
							<input type="text" name="address3" id="address3" class="address" value="${addressArr[2]}" placeholder="상세주소 입력" required/>
							<button type="button" id="searchAddress">검색</button>						
						</td> 
					</tr>	
					<tr>
						<td>휴대폰</td>
						<td><input id="phoneNumber1" name="phoneNumber1" type="text" value="${phoneArr[0]}" maxlength="3" size="2px;" onKeyup="this.value=this.value.replace( /[^0-9]/g,'');" required>
							- <input id="phoneNumber2" name="phoneNumber2" type="text" value="${phoneArr[1]}" maxlength="4" size="4px;" onKeyup="this.value=this.value.replace( /[^0-9]/g,'');" required>
							- <input id="phoneNumber3" name="phoneNumber3" type="text" value="${phoneArr[2]}" maxlength="4" size="4px;" onKeyup="this.value=this.value.replace( /[^0-9]/g,'');" required>
<!-- 							<button style="border:0px; cursor: pointer; color:white; background-color:#4F8CD1;">인증번호 발송</button> -->
						</td>
					</tr>
					<tr>
						<td>이메일 주소</td>
						<td>
							<input type="text" name="email1" id="email1" class="email" value="${emailArr[0]}" size="10px" maxlength="12" autocomplete="off" placeholder="이메일 아이디" onKeyup="this.value=this.value.replace( /[^a-z|A-Z|0-9]/g,'');" required> 
							<input id="at" value="@" disabled style="width:14px;">
							<input type="text" name="email2" id="email2" class="email" value="${emailArr[1]}" size="10px" autocomplete="off" placeholder="이메일 주소" onKeyup="this.value=this.value.replace( /[^a-z|A-Z|.]/g,'');" required>
							<select  name="selectEmail" id="selectEmail" class="email" required>
								 <option value="1" selected>직접입력</option>
								 <option value="naver.com">naver.com</option>
								 <option value="hanmail.net">daum.net</option>
								 <option value="hanmail.net">nate.com</option>
								 <option value="iei.co.kr">iei.kr</option>
							</select>
							<br>				
							<input id="checkNumber" type="text" size="20px" maxlength="6" placeholder="인증번호를 입력해주세요." required>
							&nbsp;<input type="button" id="sendEmailBtn" value="인증번호 발송" style="border:0px; cursor: pointer; color:white; background-color:#4F8CD1;">
							<input type="button" id="checkNumberBtn" value="확인" style="border:0px; cursor: pointer; color:white; background-color:#4F8CD1;">
							
							
						</td>
					</tr>						
					<tr>
						<td>분야</td>
						<td>				
							<c:set var="field" value="${ field }"/>
							<input type="checkBox" name="field" value="이사/입주청소" <c:if test="${ fn: contains(field, '이사/입주청소') }">checked</c:if>><label>이사/입주청소</label>
							<input type="checkBox" name="field" value="타일시공" <c:if test="${ fn: contains(field, '타일시공') }">checked</c:if>><label>타일시공</label>
							<input type="checkBox" name="field" value="도배/장판" <c:if test="${ fn: contains(field, '도배/장판') }">checked</c:if>><label>도배/장판</label>
							<br>
							<input type="checkBox" name="field" value="에어컨 설치/수리" <c:if test="${ fn: contains(field, '에어컨 설치/수리') }">checked</c:if>><label>에어컨 설치/수리</label>
							<input type="checkBox" name="field" value="실내 인테리어" <c:if test="${ fn: contains(field, '실내 인테리어') }">checked</c:if>><label>실내 인테리어</label>
						</td>
					</tr>
					<tr>
						<td>경력</td>
						<td>
							<input type="text" name="career" id="career" class="career" value="${career}" maxlength="2"/>년
						</td>
					</tr>
					
					<tr>
						<td>근무요일</td>
						<td>
							<c:set var="workingDay" value="${ workingDay }"/>
							<input type="checkBox" name="day" value="월요일" <c:if test="${ fn: contains(workingDay, '월요일') }">checked</c:if>><label>월</label>
							<input type="checkBox" name="day" value="화요일" <c:if test="${ fn: contains(workingDay, '화요일') }">checked</c:if>><label>화</label>
							<input type="checkBox" name="day" value="수요일" <c:if test="${ fn: contains(workingDay, '수요일') }">checked</c:if>><label>수</label>
							<input type="checkBox" name="day" value="목요일" <c:if test="${ fn: contains(workingDay, '목요일') }">checked</c:if>><label>목</label>
							<input type="checkBox" name="day" value="금요일" <c:if test="${ fn: contains(workingDay, '금요일') }">checked</c:if>><label>금</label>
							<input type="checkBox" name="day" value="토요일" <c:if test="${ fn: contains(workingDay, '토요일') }">checked</c:if>><label>토</label>
							<input type="checkBox" name="day" value="일요일" <c:if test="${ fn: contains(workingDay, '일요일') }">checked</c:if>><label>일</label>
						</td>
					</tr>
					<tr>
						<td class="left-over-cell">연락가능 시간</td>
						<td>
							<input type="time" name="workTime1" value="${workingStartArr[0]}:${workingStartArr[1]}:00">
							~
							<input type="time" name="workTime2" value="${workingFinishArr[0]}:${workingFinishArr[1]}:00">
						</td>
					</tr>
		<!-- 			<tr> -->
		<!-- 				<td>보유자격증</td> -->
		<!-- 				<td><input type="file" accept="image/*"></td> -->
		<!-- 			</tr> -->
				</table>
			
			<br>		
			<hr width="80%">
			<div id="btnGroup">
				<input onclick = "history.back(-1);" style="border-radius:5px; width:80px; height:30px; border:0px; cursor: pointer; color:white; background-color:#4F8CD1;" value="이전">
				<button style="border-radius:5px; width:80px; height:30px; border:0px; cursor: pointer; color:white; background-color:#4F8CD1;">확인</button>
			</div>
		</form>
	</div>
		
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
		    reader.onload = function(e) {//이벤트 관련 function은 기본적으로 이벤트를 인자로 넘김.
		     
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
		
		//비밀번호 중복여부 확인
		$('.password').change(function(){

			var password1 = $('#password1');
			var password2 = $('#password2');
			
			if(password1.val() != '' && password2.val() != '' && password1.val() == password2.val()) {
				$.ajax({
					url: 'pwDupCheck.me',
					type: 'post',
					data: {password1:password1.val(), password2:password2.val()}, 
					success: function(data){
						console.log(data);
						if(data == "0"){
							$('#pwDupCheckResult').text('변경 가능한 비밀번호 입니다.').css({'color':'green'});
						} else if(data == "1"){
							$('#pwDupCheckResult').text('현재 사용중인 비밀번호로는 변경할 수 없습니다.').css({'color':'red'});
							$('.password').val('');
							userId.focus();
						}
					},
					error: function(data){
						console.log(data);
					}	
				});
			}		
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