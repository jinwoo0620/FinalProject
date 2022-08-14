<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>HomeArt - 커뮤니티</title>
	<meta charset="UTF-8">
	<meta name="description" content="WebUni Education Template">
	<meta name="keywords" content="webuni, education, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->   
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css"/>
</head>
<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	

	<!-- single course section -->
	<section class="single-course spad pb-0">
		<div class="container">
			<div class="course-warp-title">
				<h2 id="top">HomeArt 커뮤니티 게시판입니다!</h2>
				<p>정성들여 꾸민 집의 인테리어 사진을 공유해서 모두와 소통해봅시다!</p>
				<br>
			</div>
			<form action="communityUpdate.bo" method="post" enctype="Multipart/form-data">
			<div class="course-meta-area">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<br>
						<div id="course-title">
							<input type="hidden" name="writer" value="${ loginUser.id }"> <!-- 로그인유저 닉네임 -->
							<input type="hidden" name="boardNo" value="${board.boardNo}"> <!-- 게시판번호 -->
							<input type="text" name="boardTitle" id="course-input" value="${board.boardTitle}" placeholder="제목을 입력하세요." required="required">
						</div>
						<div class="course-img">
							<label for="uploadFile1" id="inputLabel1">사진을 변경하려면 클릭하세요</label>
							<input type="file" name="uploadFile1" id="uploadFile1" style="display:none" accept="image/*" value="${ uploadFile1 }" required="required">
							<input type="hidden" name="fileId1" value="${ fileId1 }">
							<div id="preview1"></div>
						</div>
						<div class="course-img">
							<label for="uploadFile2" id="inputLabel2">사진을 변경하려면 클릭하세요</label>
							<input type="file" name="uploadFile2" id="uploadFile2" style="display:none" accept="image/*" value="${ uploadFile2 }" required="required">
							<input type="hidden" name="fileId2" value="${ fileId2 }">
							<div id="preview2"></div>
						</div>
						<div class="contact-form-warp">
							<textarea id="course-textarea" name="boardContent" placeholder="내용을 입력하세요." required="required">${board.boardContent}</textarea>
						</div>
						<div class="community_btn">
							<input type="submit" value="등록" id="submitBtn" class="site-btn buy-btn">
							<a href="javascript:history.go(-1)" class="site-btn price-btn">취소</a>
							<br>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
				</div>
			</div>
		</div>
		<div class="floating-button" style="position:fixed; bottom:40px; right:30px;">
			<a href="#top" class="top-btn">TOP</a>
		</div>
	</section>
	<!-- single course section end -->
	<%@ include file="../common/footer.jsp" %>
	<!--====== Javascripts & Jquery ======-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/community.js"></script>
	<script type="text/javascript">
		$(document).ready(function (e){
	    	$("#uploadFile1").change(function(e){
	
			//div 내용 비워주기
			$('#inputLabel1').empty();
			
			var files = e.target.files;
			var arr = Array.prototype.slice.call(files);
			
			//업로드 가능 파일인지 체크
			for(var i=0;i<files.length;i++){
				if(!checkExtension(files[i].name,files[i].size)){
				return false;
				}
			}
			
			preview(arr);
			});//file change
	    
			function checkExtension(fileName,fileSize){
				var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
				var maxSize = 20971520;  //20MB
				
				if(fileSize >= maxSize){
					alert('파일 사이즈 초과');
					$("#uploadFile1").val("");  //파일 초기화
					return false;
				}
				
				if(regex.test(fileName)){
					alert('업로드 불가능한 파일이 있습니다.');
					$("#uploadFile1").val("");  //파일 초기화
					return false;
				}
				return true;
			}
			
			function preview(arr){
				arr.forEach(function(f){
					//div에 이미지 추가
					var str = '<div class="added" style="display: inline-block; padding: 10px;">';
					
					//이미지 파일 미리보기
					if(f.type.match('image.*')){
						var reader = new FileReader();
						reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
							str += '<button type="button" class="delBtn" onclick="delImg(this)">X</button>';
							str += '<img src="'+e.target.result+'" width=400 height=300 />';
							str += '</div>';
							$(str).appendTo('#preview1');
						} 
						reader.readAsDataURL(f);
					} else{
						str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=400 height=300 />';
						$(str).appendTo('#preview1');
					}
				});//arr.forEach
			}
			
			function delImg(_this){
				$(_this).parent('div').remove()
			}
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function (e){
	    	$("#uploadFile2").change(function(e){
	
			//div 내용 비워주기
			$('#inputLabel2').empty();
			
			var files = e.target.files;
			var arr = Array.prototype.slice.call(files);
			
			//업로드 가능 파일인지 체크
			for(var i=0;i<files.length;i++){
				if(!checkExtension(files[i].name,files[i].size)){
				return false;
				}
			}
			
			preview(arr);
			});//file change
	    
			function checkExtension(fileName,fileSize){
				var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
				var maxSize = 20971520;  //20MB
				
				if(fileSize >= maxSize){
					alert('파일 사이즈 초과');
					$("#uploadFile2").val("");  //파일 초기화
					return false;
				}
				
				if(regex.test(fileName)){
					alert('업로드 불가능한 파일이 있습니다.');
					$("#uploadFile2").val("");  //파일 초기화
					return false;
				}
				return true;
			}
			
			function preview(arr){
				arr.forEach(function(f){
					//div에 이미지 추가
					var str = '<div class="added" style="display: inline-block; padding: 10px;">';
					
					//이미지 파일 미리보기
					if(f.type.match('image.*')){
						var reader = new FileReader();
						reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
							str += '<button type="button" class="delBtn" onclick="delImg(this)">X</button>';
							str += '<img src="'+e.target.result+'" width=400 height=300 />';
							str += '</div>';
							$(str).appendTo('#preview2');
						} 
						reader.readAsDataURL(f);
					} else{
						str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=400 height=300 />';
						$(str).appendTo('#preview2');
					}
				});//arr.forEach
			}
			
			function delImg(_this){
				$(_this).parent('div').remove()
			}
		});
		
		$("#submitBtn").click(function(){
			if($("#course-input").val().length < 1){
				alert("제목을 입력해 주세요");
				return false;
			}
			if($("#course-textarea").val().length < 1){
				alert("내용을 입력해 주세요");
				return false;
			}

			if(!$("#uploadFile1").val()){
				alert("첫번째 사진을 첨부해 주세요");
				return false;
			}
			
			if(!$("#uploadFile2").val()){
				alert("두번째 사진을 첨부해 주세요");
				return false;
			}
		});
	</script>
</body>
</html>