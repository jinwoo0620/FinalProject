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
	<link href="${pageContext.request.contextPath}/resources/images/favicon.ico" rel="shortcut icon"/>

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
		<form action="communityUpdateForm.bo" method="post">
		<div class="container">
			<div class="course-meta-area">
				<div class="row">
					<div class="course-meta-top">
						<div class="course-metas">
							<div class="course-meta">
								<div class="course-author">
									<%-- <c:if test="${ !board.renameFileName eq null }">
									<div class="ca-pic set-bg" data-setbg="${pageContext.request.contextPath}/resources/muploadFiles/${ board.renameFileName }"></div>
									</c:if>
									<c:if test="${ board.renameFileName eq null }">
									<div class="ca-pic set-bg" data-setbg="${pageContext.request.contextPath}/resources/muploadFiles/empty_profile.png"></div>
									</c:if> --%>
									<p>${ board.nickName }</p>
									<input type="hidden" value="${ board.nickName }" name="nickName">
									<input type="hidden" value="${ board.boardNo }" name="boardNo">
								</div>
							</div>
							<div class="course-meta">
								<div class="cm-info">
									<p id="cm-info"><img class="info-img" src="${pageContext.request.contextPath}/resources/images/comment.png"> ${ board.rCount }</p>
								</div>
							</div>
							<div class="course-meta">
								<div class="cm-info">
									<c:if test="${ !empty sessionScope.loginUser }">
									<p id="cm-info"><img class="info-heart" src="${pageContext.request.contextPath}/resources/images/heart_blank.png"> <a class="likesCount">${ board.lCount }</a></p>
									</c:if>
									<c:if test="${ empty sessionScope.loginUser }">
									<p id="cm-info"><img src="${pageContext.request.contextPath}/resources/images/heart_blank.png"> <a class="likesCount">${ board.lCount }</a></p>
									</c:if>
								</div>
							</div>
							<div class="course-meta">
								<div class="cm-info">
									<p id="cm-info"><img class="info-img" src="${pageContext.request.contextPath}/resources/images/eye.png"> ${ board.views }</p>
									<input type="hidden" value="${ board.views }" name="views">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="course-meta-area">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<br>
						<h4>${ board.boardTitle }</h4>
						<input type="hidden" value="${ board.boardTitle }" name="boardTitle">
						
						<c:forEach var="a" items="${att}">
						<input type="hidden" value="${ a.changeName }" name="uploadFile1">
						<c:if test="${ a.boardNo == board.boardNo && a.fileLevel == 0 }">
						<img class="detail_image" src="${ pageContext.servletContext.contextPath }/resources/buploadFiles/${ a.changeName }" alt="" class="course-preview">
						<input type="hidden" name="fileId1" id="fileId1" value="${ a.fileId }">
						</c:if>
						</c:forEach>
						<c:forEach var="a" items="${att}">
						<input type="hidden" value="${ a.changeName }" name="uploadFile2">
						<c:if test="${ a.boardNo == board.boardNo && a.fileLevel == 1 }">
						<img class="detail_image" src="${ pageContext.servletContext.contextPath }/resources/buploadFiles/${ a.changeName }" alt="" class="course-preview">
						<input type="hidden" name="fileId2" id="fileId2" value="${ a.fileId }">
						</c:if>
						</c:forEach>
						<p id="detail_content">${ board.boardContent }</p>
						<input type="hidden" value="${ board.boardContent }" name="boardContent">
						<br>
						<div class="community_btn">
							<c:if test="${ loginUser.id == board.writer }">
								<button class="site-btn buy-btn">수정</button>
							</c:if>
							<c:if test="${ loginUser.power == 2 || loginUser.id == board.writer }">
								<button type="button" onclick="deleteConfirm()" class="site-btn buy-btn">삭제</button>
							</c:if>
							<a href="communityList.bo" class="site-btn price-btn">목록으로</a>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		<br>
		<div class="container">
			<div class="row">
				<div>
					<div class="contact-form-warp">
						<span id="reply_title">댓글</span>
						<form class="contact-form">
							<c:if test="${ !empty sessionScope.loginUser }">
								<input type="text" placeholder="댓글을 남겨보세요" id="reply_content_area">
								<button class="write-btn" id="insertReply">등록</button>
							</c:if>
							<c:if test="${ empty sessionScope.loginUser }">
								<input type="text" placeholder="로그인 후 작성 가능합니다." id="reply_content_area" disabled>
							</c:if>
						</form>
						<div class="course-author">
							<table class="course-reply" id="reply_table" style="text-align:left">
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="floating-button" style="position:fixed; bottom:40px; right:30px;">
			<a href="#top" class="top-btn">TOP</a>
		</div>
	</section>
	<!-- single course section end -->
	
	<!--====== Javascripts & Jquery ======-->
	
	
	
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/community.js"></script>
	<script>
	
	
	
	
		$('#insertReply').click(function(){
			var rContent = $('#reply_content_area').val();
			var bId = ${board.boardNo};
			console.log(bId);
			
			$.ajax({
				url: 'insertReply.bo',
				data: {replyContent:rContent, boardNo:bId},
				success: function(data){
					console.log(data);
					if(data == 'success'){
						$('#reply_content_area').val('');
					}
				},
				error: function(data){
					console.log(data);
				}
			});
		});
		
		function getReplyList(){
			$.ajax({
				url: 'replyList.bo',
				data: {bId:${board.boardNo}},
				success: function(data){
					console.log(data);
					
					$tableBody = $('#reply_table tbody');
					$tableBody.html('');
					
					var $tr;
					/* var $image1;
					var $image2; */
					var $writer;
					var $content;
					var $date;
					/* var $if1;
					var $if2;
					var $ifEnd1;
					var $ifEnd2; */
					
					$('#rCount').text(data.length);
					
					if(data.length > 0){
						for(var i in data){
							$tr = $('<tr>');
							
							/* $if1 = $('<c:if test="${ !board.renameFileName eq null }">');
							$image1 = $('<img src="${pageContext.request.contextPath}/resources/muploadFiles/${ board.renameFileName }" alt="">');
							$ifEnd1 =  $('</c:if>');
							$if2 = $('<c:if test="${ board.renameFileName eq null }">');
							$image2 = $('<img src="${pageContext.request.contextPath}/resources/muploadFiles/empty_profile.png" alt="">');
							$ifEnd2 =  $('</c:if>'); */
							$writer = $('<td id="reply_writer">').text(data[i].nickName);
							$content = $('<td id="reply_content">').text(data[i].replyContent);
							$date = $('<td id="reply_date">').text(data[i].createDate);
							$deleteBtn = $('<td id="deleteReply" onclick="deleteReply()">').text("X");
							$replyHidden = $('<a class="delete_rId" style="display:none">').text(data[i].replyNo);
							$deleteBtn.append($replyHidden);
							
							/* $tr.append($if1);
							$tr.append($image1);
							$tr.append($ifEnd1);
							$tr.append($if2);
							$tr.append($image2);
							$tr.append($ifEnd2); */
							$tr.append($writer);
							$tr.append($content);
							$tr.append($date);
							$tableBody.append($tr);
							
						}
					} else{
						$tr = $('<tr>');
						$content = $('<td id="reply_content">').text('등록된 댓글이 없습니다.');
						
						$tr.append($content);
						$tableBody.append($tr);
					}
				},
				error: function(data){
					console.log(data);
				}
			});
		}
		
		$(function(){
			getReplyList();
			
			setInterval(function(){
				getReplyList();
			}, 1000);
		});
		
		function deleteReply(){
			var rId = $(this).find('a').text();
			console.log(rId);
// 			$.ajax({
// 				url: 'deleteReply.bo',
// 				data: {rId:rId},
// 				success: function(data){
// 					console.log(data);
// 					if(data == 'success'){
// 						console.log(data);
// 					}
// 				},
// 				error: function(data){
// 					console.log(data);
// 				}
// 			});
		}
		
		$(".info-heart").click(function(){
			var bId = ${board.boardNo};
			console.log(bId);
			$.ajax({
				url: 'likesCheck.bo',
				data: {bId: ${board.boardNo}},
				type: "POST",
				success: function(data) {
					var haveCount = $(".likesCount").text(); 
					
					if(haveCount > data){
						$(".likesCount").text(data);
						$(".info-heart").attr("src","${pageContext.request.contextPath}/resources/images/heart_blank.png");
					} else{
						$(".likesCount").text(data);
						$(".info-heart").attr("src","${pageContext.request.contextPath}/resources/images/heart.png");
					}
				},
				error: function(data){
					console.log(data);
				}
			});
		});
		
		function likesYN() {
			console.log('실행확인');
			$.ajax({
				url: 'likesYN.bo',
				data: {bId:${board.boardNo}},
				success: function(data){
					if(data.equals('y')){
						$(".info-heart").attr("src","${pageContext.request.contextPath}/resources/images/heart.png");
					} else{
						$(".info-heart").attr("src","${pageContext.request.contextPath}/resources/images/heart_blank.png");
					}
					console.log(data);
// 					if(data.equals('1')){
// 						$(".info-heart").attr("src","${pageContext.request.contextPath}/resources/images/heart.png");
// 					} else{
// 						$(".info-heart").attr("src","${pageContext.request.contextPath}/resources/images/heart_blank.png");
// 					}
				},
				error: function(data){
					console.log(data);
				}
			});
		}
		
		function likesCount(){
			$.ajax({
				url: 'likesCount.bo',
				data: {bId:${board.boardNo}},
				success: function(data){
					$('.likesCount').text(data);
				},
				error: function(data){
					console.log(data);
				}
			});
	    };
	    
	    function deleteConfirm(){
	    	var bId = ${board.boardNo};
	    	if(confirm('삭제하시겠습니까?')){
	    		alert('삭제되었습니다.');
	    		location.href = 'communityDelete.bo?bId=' + bId;
	    	} else{
	    		return false;
	    	}
	    }
	</script>
</body>
</html>