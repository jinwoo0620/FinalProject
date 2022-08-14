<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>HomeArt</title>
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<!-- Favicon-->
<!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${ pageContext.servletContext.contextPath }/resources/css/expertBoard.css" rel="stylesheet" />
    
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');
	body{
	    margin: 0 auto;
 	  	font-family: 'Noto Sans KR', sans-serif; 
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #323232;
	    text-align: left;
	    background-color: #fff;
		}
		
	/* --------------전문가 찾기------------- */
  	.search-pro-header-1{
		padding-top: 1.75rem;
		display: block;
		width:1320px;
		margin: auto;
		padding-left: 0.75rem;
	}
	.heading-title{
		font-size: 1.75rem;
		font-weight: 700;
		line-height: 1.64;
		letter-spacing: -.03125rem;
		margin-bottom: 1.5rem;
	}

	.justify-content-between {
	    margin-right: 0;
	    margin-left: 0;
	}
	
	section div[data-name=search-pro-filter][data-v-3b0c0bbc] {
	    flex: 1;
	    position: relative;
	}
	.search-pro-filter-nudge-wrap{
	    position: relative;
	}
	.search-filter{
		background: #c9ddfc;
	}

	/* ------필터------------*/
	.container{
		display: flex;
		margin-top: 3.5rem;
	}
	
	.desktop{
		display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding-bottom: 2rem;
	    border-bottom: 0.0625rem solid #f4f4f4;
	    font-size: .875rem;
	    font-weight: 1000;
	}
	.categories{
		margin-top: 2rem;
	}
	.refresh{
		background-repeat: no-repeat;
	    padding-right: 1.25rem;
	    background-position: 100%;
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTEwLjI2NiAxLjk3NWEuNS41IDAgMDEuMDcuMjU2bC4wMDEgMS4yNDNjMy41MjUuMTg0IDYuMzMgMy4yNTIgNi4zMyA3LjAwOCAwIDMuODc2LTIuOTg1IDcuMDE4LTYuNjY3IDcuMDE4cy02LjY2Ny0zLjE0Mi02LjY2Ny03LjAxOGMwLS40ODQuMzczLS44NzcuODM0LS44NzcuNDYgMCAuODMzLjM5My44MzMuODc3IDAgMi45MDcgMi4yMzkgNS4yNjQgNSA1LjI2NHM1LTIuMzU3IDUtNS4yNjRjMC0yLjc4Ny0yLjA1OS01LjA2OS00LjY2My01LjI1MXYxLjE5MWEuNS41IDAgMDEtLjc1Ni40M0w2LjA2IDQuNzYyYS41LjUgMCAwMTAtLjg2bDMuNTIxLTIuMWEuNS41IDAgMDEuNjg2LjE3M3oiIGZpbGw9IiNDNUM1QzUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==);
		cursor: pointer;
	}
	.refresh span{
	    color: #a9a9a9;
	    font-weight: 500;
	    margin-right: 0.25rem;
	}
	.content{
		margin-top: 1.5rem;
	}
	
	/* 000명의 전문가 / 리뷰순 */
	.count-sort {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding-bottom: 2rem;
	    border-bottom: 0.0625rem solid #f4f4f4;
	    font-size: .875rem;
	    font-weight: 500;
	    margin-top: 2rem;
	}
	.pro-list--footer .list-option {
	    flex: 1;
	}
	.pro-list--footer>div {
	    display: flex;
	    justify-content: space-between;
	    line-height: 1.25rem;
	}
	.pro-list--footer .pro-list--total-count {
	    font-size: .875rem;
	    color: #323232;
	    align-self: center;
	}
	
	/* 명의 전문가 */
	.pro-list--footer .pro-list--total-count>span {
	    color: #737373;
	    font-weight: 400;
	    word-break: keep-all;
	    margin-left: 0.25rem;
	}
	
	/* 리뷰순, 평점순*/
	.pro-list--footer .nudge-wrap {
	    position: relative;
	}
	.pro-list--footer .nudge-wrap .pro-list--sort>button {
	    padding: 0;
	}
	.pro-list--footer .nudge-wrap .pro-list--sort>button>.current-sort {
	    padding-right: 1.25rem;
	    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMCAxOGgxOFYwSDB6Ii8+PHBhdGggc3Ryb2tlPSIjMzIzMjMyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMS41IiBkPSJNMTQgN2wtNSA1LTUtNSIvPjwvZz48L3N2Zz4=) 100% no-repeat;
	}
	.btn {
	    font-weight: 500;
	    transition: opacity .2s ease-in-out;
	}

	/* 바로 답변 가능한 전문가 */
	.inprogress{
	    padding-top: 1.5rem;
	    padding-bottom: 1.5rem;
	}
	.list-header{
	    font-size: .875rem;
	    color: #888;
	}
	.inprogress span{
		width: auto;
		padding-right: 0;
	}
	.auto-quote-info{
		width: auto;
		padding: 0;
	}
	
/* 	.mb-4 img{ */
/* 		width: 100%; */
/* 		height: 150px; */
/* 	} */


	/* 상세보기 */
	.btn-primary {
	  	color: #fff;
	  	background-color: #4F8CD1;
  		border-color: #4F8CD1;
	}
	/* 의뢰요청 버튼 */
	.btn-primary1{
		color: #fff;
	  	background-color: #4F8CD1;
	  	border-color: #4F8CD1;
	  	float: right;
	}
	
	.btn-primary1:hover {
	  	color: #fff;
	  	background-color: #0b5ed7;
	  	border-color: #0a58ca;
	}
	
	.request{
		width: 100px;
		height: 38px;
		background-color: #4F8CD1;
	  	border-color: #4F8CD1;
	  	color: #fff;
	  	border-radius : 5%;
	  	float: right;
	  	
	}
	
</style>
</head>
<body>

	<!-- Page header -->
	<form class="service-area-filter">
		<header class="search-pro-header-1">
			<h1 class="heading-title">전문가 찾기</h1>
				<section class="no-gutters align-items-center justify-content-between">
					<div class="col">
						<div class="search-pro-filter-nudge-wrap">
							<div role="group" class="input-group">
								<div class="search-filter">
									<button type="button" class="btn btn-secondary">
										<span>어느 지역의 전문가를 찾으세요?</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</section>
		</header>
		
	    <!-- Page content-->
	    <div class="container">
			<div class="row">
		        <!-- Side widgets-->
				<div class="col-lg-4">
					<div class="header desktop">
						<span>필터</span>
	              		<div class="refresh">
	              			<span class="clear">초기화</span>
	              		</div>
	              	</div>
	
                    <!-- Categories widget -->
					<div class="card mb-4 categories">
						<div class="card-header">카테고리</div>
						<div class="card-body">
	                    	<div class="row">
	                        	<div class="col-sm-6">
	                            	<ul class="list-unstyled mb-0">
	                            		<li><a href='elist.ex'>모든 카테고리</a></li>
	                                	<li><a href='eTile.ex'>타일시공</a></li>
	                                 	<li><a href='eWallPaper.ex'>도배/장판</a></li>
	                                </ul>
	                            </div>
	                            <div class="col-sm-6">
	                                <ul class="list-unstyled mb-0">
	                                	<li><a href='eMove.ex'>이사/입주청소</a></li>
	                                    <li><a href='eAir.ex'>에어컨 설치/수리</a></li>
	                                    <li><a href='eInterior.ex'>실내 인테리어</a></li>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                <!-- Side widget-->
	                <div class="card mb-4 content">
	                    <div class="card-header">서비스 분야를 선택해 주세요.</div>
	                    <div class="card-body">서비스 분야를 선택하면 나에게 딱 맞는 전문가를 필터링해 찾아볼 수 있어요!</div>
	                </div>
		        </div>
		        
	            <!-- Blog entries-->
				<div class="col-lg-8">
	             	<section class="pro-list--footer count-sort">
	             		<div class="list-option">
	             			<div class="pro-list--total-count">
	             				<strong>${ pi.listCount }</strong>
	             				<span>명의 전문가</span>
	             			</div>
	             			<c:if test="${ !empty loginUser }">
	           					<button onclick="location.href='einsertView.ex';" aria-haspopup="true" aria-expanded="false" type="button" class="btn dropdown-toggle btn-link btn-sm dropdown-toggle-no-caret" id="__BVID__77__BV_toggle_">
	           						<span class="current-sort">프로필작성</span>
	           					</button>
           					</c:if>
	               		</div>
	               	</section>
	               	<div class="row list-header inprogress">
	               		<span>바로 답변 가능한 전문가</span>
	               		<div class="auto-quote-info">
               				<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0xMCAxLjY2N2E4LjMzMyA4LjMzMyAwIDEgMSAwIDE2LjY2NiA4LjMzMyA4LjMzMyAwIDAgMSAwLTE2LjY2NnptMCAxLjA4M2E3LjI1IDcuMjUgMCAxIDAgMCAxNC41IDcuMjUgNy4yNSAwIDAgMCAwLTE0LjV6bTAgNi43MDhjLjI3MiAwIC40OTcuMi41MzYuNDYybC4wMDYuMDh2My4xMjVhLjU0Mi41NDIgMCAwIDEtMS4wNzguMDhsLS4wMDYtLjA4VjEwYzAtLjMuMjQzLS41NDIuNTQyLS41NDJ6bS4wMS0zLjQxNmEuODMzLjgzMyAwIDAgMSAuMDk4IDEuNjZMMTAgNy43MDlhLjgzMy44MzMgMCAwIDEtLjA5Ny0xLjY2bC4xMDctLjAwNnoiIGZpbGw9IiM4ODgiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPgo8L3N2Zz4K" alt="바로 답변 가능한 고수 안내">
	               		</div>
	               	</div>
	               	
 	                <!-- Featured blog post -->
<%--  	                <c:forEach var="e" items="${ list }"> --%>
<!-- 	                <div class="card mb-4"> -->
<%-- 	                    <a href="#!"><img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/buploadFiles/${ e.renameFileName }" alt="..." /></a> --%>
<!-- 	                    <div class="card-body"> -->
<%-- 	                        <div class="small text-muted">${ e.field }</div> --%>
<%-- 	                        <h2 class="card-title">${ e.expertTitle }</h2> --%>
<%-- 	                        <p class="card-text">${ e.expertInfo }</p> --%>
<!-- 	                        <a class="btn btn-primary" href="#!">Read more →</a> -->
<!-- 	                    </div> -->
<!-- 	                </div> -->
<%-- 	                </c:forEach> --%>

	                <!-- Nested row for non-featured blog posts-->
	                <div class="row">
 	                    <!-- <div class="col-lg-6"> -->
                        <!-- Blog post -->
                        <c:forEach var="e" items="${ list }">
                        <div class="card mb-4" style="width: 45%; margin-left: 1.75rem;">
                            <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/buploadFiles/${ e.renameFileName }" alt="..." />
                            <div class="card-body">
                            	<div class="small text-muted" >${ e.expertProfileNo }</div>
                                <div class="small text-muted">${ e.field }</div>
                                <h2 class="card-title h4">${ e.expertTitle }</h2>
                                <p class="card-text">${ e.expertInfo }</p>
                                <a class="btn btn-primary">상세보기 →</a>
                                <button type="button"  class="request" value="${e.expertProfileNo}">의뢰 요청</button>
                                
                            </div>
                        </div>
                        </c:forEach>
					</div>
					
					<hr class="my-0" />
					
					<!-- 페이징 처리 -->
					<div>
						<ul class="pagination justify-content-center my-4">
							<!-- [이전] -->
							<li class="page-item" style="margin-top: auto;">
								<div class="page-link">
									<c:if test="${ pi.currentPage <= 1 }">
										[이전] &nbsp;
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="elist.ex">
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }">[이전]</a> &nbsp;
									</c:if>
								</div>
							</li>
					
							<!-- 페이지 -->
							<li class="page-item active">
								<div class="page-link" style="background-color: #FFFFFF;">
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="#4f8cd1" size="5"><b>[${ p }]</b></font>
										</c:if>
									
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="elist.ex">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
										</c:if>
									</c:forEach>
								</div>
							</li>
					
							<!-- [다음] -->
							<li class="page-item" style="margin-top: auto;">
								<div class="page-link">
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										[다음]
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="elist.ex">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url> 
										<a href="${ after }">[다음]</a>
									</c:if>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</form>
		
	
<!--         Footer -->
<!--         <footer class="py-5 bg-dark"> -->
<!--             <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div> -->
<!--         </footer> -->

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="resources/js/scripts.js"></script>
    
    <script>
//     	$('.card-body').click(function(){
//     		var eId = $(this).children().eq(0).text();
//     		console.log(eId);
//     		location.href = 'edetail.ex?eId=' +eId + "&page=" + ${pi.currentPage};
//     	});
    	
    	$('.btn-primary').click(function(){
    		var eId = $(this).parent().children().eq(0).text();
    		console.log(eId);
    		location.href = 'edetail.ex?eId=' +eId + "&page=" + ${pi.currentPage};
    	});
    	
    	$('.clear').mouseover(function(){
    		$(this).css("color","#4f8cd1");
    	});
    	
    	$('.clear').mouseout(function(){
    		$(this).css("color","#a9a9a9");
    	});
    	
    	$('.refresh').click(function(){
    		location.href = 'elist.ex';
    	});
    	
    	//전문가 프로필 목록에서 의뢰 요청하기 
        $(".request").click(function(){ //class속성값이 request인 버튼을 클릭하면(의뢰요청 버튼)

           var expertProfileNo = $(this).val();   
        
           console.log(expertProfileNo);
        
           $.ajax({
             url: 'requestToExpert.me',
             type: 'post',
             data: {expertProfileNo:expertProfileNo}, 
             success: function(data){
                if(data == "success") {
                   alert('해당 전문가에게 성공적으로 의뢰를 요청하였습니다.');
                   console.log(data);
                } else if(data == "fail"){
                   alert('의뢰요청에 실패했습니다.');
                   console.log(data);
                } else if(data == "wait"){
                   alert('회원님께서는 해당 전문가에게 이미 의뢰요청을 보냈습니다. 전문가의 수락을 기다려 주세요.')   ;   
                   console.log(data);
                } else if(data == "match"){
                   alert('이미 매칭된 전문가에게는 의뢰요청을 할 수 없습니다.')   ;   
                   console.log(data);
                } else if(data == "notLogin"){
                   alert('의뢰요청 기능은 로그인한 일반회원만 이용하실 수 있습니다. ');
                   console.log(data);
                   location.href="loginView.me";
                }

             },
             error: function(data){
                alert("통신실패");
                console.log(data);
             }   
          });
       });
    	
    	
    	
    	
    	
    	
    	
    </script> 
</body>
</html>