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
<%@ include file="../common/menubar.jsp" %>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<!-- course section -->
	<section class="course-section spad pb-0">
		<div class="course-warp">
			<div class="course-warp-title">
				<h2 id="top">HomeArt 커뮤니티 게시판입니다!</h2>
				<p>정성들여 꾸민 집의 인테리어 사진을 공유해서 모두와 소통해봅시다!</p>
				<br>
			</div>
			<div class="course-items-area" style="display:flex; flex-wrap:wrap; justify-content:space-evenly">
				<c:forEach var="b" items="${ bList }">
				<!-- course -->
					<div class="course-item">
						<div class="course-info">
							<div class="course-author">
								<div class="ca-pic set-bg">
								<%-- <c:if test="${ !b.renameFileName eq null }">
									<img class="list_icon" src="${pageContext.request.contextPath}/resources/muploadFiles/${ b.renameFileName }" alt="">
								</c:if>
								<c:if test="${ b.renameFileName eq null }">
									<img class="list_icon" src="${pageContext.request.contextPath}/resources/muploadFiles/empty_profile.png" alt="">
								</c:if> --%>
								
								</div>
								<p class="">${ b.nickName }</p>
							</div>
							<div class="course-photo-area">
								<div class="course-thumb set-bg" style="cursor:pointer">
									<a class="list_board_no" style="display:none">${ b.boardNo }</a>
									<c:forEach var="i" items="${ iList }">
									<c:if test="${ i.fileLevel == 0 && b.boardNo == i.boardNo }">
									<img class="list_image" src="${ pageContext.servletContext.contextPath }/resources/buploadFiles/${ i.changeName }">
									</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="course-info">
							<div class="course-text">
								<h5>${ b.boardTitle }</h5>
								<hr>
								<div class="students">
									<a class="list_board_no" style="display:none">${ b.boardNo }</a>
									<img class="info-img" src="${pageContext.request.contextPath}/resources/images/comment.png">
									<a class="replyCount">${ b.rCount }</a>
									<script>
										function listReply(){
											$.ajax({
												url: 'replyCount.bo',
												data: {bId:${b.boardNo}},
												success: function(data){
													console.log(data);
													$('.replyCount').text(data);
												}
											});
										}
									</script>
									<img class="info-heart" src="${pageContext.request.contextPath}/resources/images/heart_blank.png">
									<a class="likesCount">${ b.lCount }</a>
									<script>
										function likesCount(){
											$.ajax({
												url: 'likesCount.bo',
												data: {bId:${b.boardNo}},
												success: function(data){
													$('.likesCount').text(data);
												}
											});
										};
									</script>
									<img class="info-img" src="${pageContext.request.contextPath}/resources/images/eye.png">${ b.views } 
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<c:if test="${ !empty sessionScope.loginUser }">
			<div class="floating-button" style="position:fixed; bottom:40px; right:120px;">
				<a href="communityInsertForm.bo" class="new-btn">+글쓰기</a>
			</div>
		</c:if>
		<div class="floating-button" style="position:fixed; bottom:40px; right:30px;">
			<a href="#top" class="top-btn">TOP</a>
		</div>
	</section>
	
	<!-- course section end -->
	<%@ include file="../common/footer.jsp" %>
	<!--====== Javascripts & Jquery ======-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/community.js"></script>
	<script>
		$('.list_image').click(function(){
			var bId = $(this).parent().parent().find('a').text();
			location.href = 'communityDetail.bo?bId=' + bId;
			return false;
		});
		
// 		var page = 1;

// 		$(window).scroll(function() {
// 		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
// 		      $("#enters").append("");
		      
// 		    }
// 		});
	</script>
</body>
</html>