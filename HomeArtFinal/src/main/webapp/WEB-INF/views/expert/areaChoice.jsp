<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomeArt</title>
<script src="../js/jquery-3.6.0.min.js"></script>
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
	*, :after, :before {
	    box-sizing: border-box;
	}
	* {
	    word-break: break-word;
	}
	
	/*********** 전체 큰 틀 div **********/
	.fade {
	    transition: opacity .15s linear;
	}
	.modal{
		position: fixed;
		top: 0;
		left: 0;
		z-index: 1050;
		width: 100%;
		height: 100%;
		outline: 0;
	}
	.modal{
		padding-left: 0!important;
	}
	.modal{
		overflow-x: hidden;
		overflow-y: auto; 
	}
	
	/********** 전체 작은 틀 div **********/
	.modal-dialog {
	    position: relative;
	    width: auto;
	    margin: 0.5rem;
	    pointer-events: none;
	}
	.modal-dialog-centered {
	    display: flex;
	    align-items: center;
	    min-height: calc(100% - 1rem);
	}
	.modal .modal-dialog {
	    max-width: none;
	}
	.modal.fade .modal-dialog {
	    transition: transform .3s ease-out;
	    transform: translateY(-3.125rem);
	}
	.modal.show .modal-dialog {
	    transform: none;
	}
	
	.modal .modal-dialog.mobile-full-modal {
	    min-height: 100%;
	    margin: 0;
	}
	.modal .modal-dialog.modal-dialog-centered {
	    min-height: 100%;
	    flex-direction: column;
	    justify-content: center;
	}
	.modal .modal-dialog.modal-dialog-centered.mobile-full-modal {
	    justify-content: normal;
	}
	
	/********** 서비스 선택 폼 **********/
	.modal-content {
	    position: relative;
	    display: flex;
	    flex-direction: column;
	    width: 100%;
	    pointer-events: auto;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: .0625remsolidrgba(0,0,0,.2);
	    border-radius: 0.3rem;
	    outline: 0;
	}
	.modal .modal-content, .modal .modal-header {
	    border-radius: 0;
	    border: none;
	}
	.search-service-modal .modal-content {
	    border: none;
	    background-clip: initial;
	}
	.modal-dialog.mobile-full-modal .modal-content {
	    flex: 1;
	}
	
	/********** 서비스 선택(헤더) **********/
	.modal .modal-header {
	    padding: 1.75rem 1.75rem 0;
	}
	.search-service-modal .modal-header {
	    padding: 1.75rem 1.75rem 0.5625rem;
	}
	.modal-header {
	    display: flex;
	    align-items: flex-start;
	    justify-content: space-between;
	    padding: 1rem;
	    border-bottom: 0.0625rem solid #e1e1e1;
	    border-top-left-radius: 0.2375rem;
	    border-top-right-radius: 0.2375rem;
	}
	
	/********** h5 **********/
	.search-service-modal .modal-header .modal-title {
	    font-size: 1.125rem;
	    font-weight: 500;
	    line-height: 1.56;
	    letter-spacing: -.01875rem;
	    margin: 0 auto;
	    color: #2d2d2d;
	    padding-left: 1.125rem;
	    padding-top: 0.875rem;
	}
	
	/********** x버튼 **********/
	button {
	    border-radius: 0;
	}
	button, input, optgroup, select, textarea {
	    margin: 0;
	    font-family: 'Noto Sans KR', sans-serif;
	    font-size: inherit;
	    line-height: inherit;
	}
	button, input {
	    overflow: visible;
	}
	button, select {
	    text-transform: none;
	}
	.close {
	    float: right;
	    font-size: 1.5rem;
	    font-weight: 700;
	    line-height: 1;
	    color: #000;
	    text-shadow: 0 0.0625rem 0 #fff;
	    opacity: .5;
	}
	button.close {
	    padding: 0;
	    background-color: transparent;
	    border: 0;
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    appearance: none;
	}
	[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
	    cursor: pointer;
	}
	.modal .modal-header button.close {
	    width: 1.125rem;
	    height: 1.125rem;
	    padding: 0;
	    margin: 0;
	    font-size: 0;
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTgiIGhlaWdodD0iMTgiPjxkZWZzPjxwYXRoIGlkPSJhIiBkPSJNOSA3Ljg2OUwxNi40MzQuNDM0bDEuMTMyIDEuMTMyTDEwLjEzIDlsNy40MzUgNy40MzQtMS4xMzIgMS4xMzJMOSAxMC4xM2wtNy40MzQgNy40MzUtMS4xMzItMS4xMzJMNy44NyA5IC40MzQgMS41NjYgMS41NjYuNDM0IDkgNy44N3oiLz48L2RlZnM+PHVzZSBmaWxsPSIjMzIzMjMyIiB4bGluazpocmVmPSIjYSIvPjwvc3ZnPg==);
	    background-repeat: no-repeat;
	}
	
	/********** 검색 및 보기 **********/
	p {
	    margin-top: 0;
	    margin-bottom: 1rem;
	}
	p {
	    font-size: .875rem;
	    line-height: 1.3125rem;
	    font-weight: 400;
	    letter-spacing: -.0125rem;
	}
	
	.indicator-body {
	    border-radius: 50%;
	    -webkit-animation: spin-data-v-fc3fcce8 1s ease-in-out infinite;
	    animation: spin-data-v-fc3fcce8 1s ease-in-out infinite;
	}
	.indicator-body.center {
	    margin: 0 auto;
	}
	
	*, :after, :before {
	    box-sizing: border-box;
	}
/* 	.search-service-modal .modal-body ul li.parent:after { */
/* 	    content: ""; */
/* 	    position: absolute; */
/* 	    width: 1.125rem; */
/* 	    height: 1.125rem; */
/* 	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCI+PGcgZmlsbD0iI0I1QjVCNSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMTYuMTA3IDUuMjU3bC43MDcuNzA3LTcuNzc5IDcuNzc5LS43MDctLjcwN3oiLz48cGF0aCBkPSJNMS4yNTcgNS45NjRsLjcwNy0uNzA3IDcuNzc5IDcuNzc5LS43MDcuNzA3eiIvPjwvZz48L3N2Zz4=); */
/* 	    background-repeat: no-repeat; */
/* 	    top: 1.25rem; */
/* 	    right: 1.75rem; */
/* 	} */
	
	.search-service-modal .modal-body ul li .loading-indicator {
	    position: absolute;
	    top: 1.125rem;
	    right: 3.75rem;
	}
	
	.search-service-modal .modal-body ul li .bottom-border {
	    background: #f2f2f2;
	    position: absolute;
	    height: 0.0625rem;
	    bottom: 0;
	    left: 0;
	    width: 100%;
	    width: -moz-available;
	    width: -webkit-fill-available;
	    margin: 0 1.75rem;
	}

	ul li {
	    list-style: none;
	}
	.search-service-modal .modal-body ul li {
	    -webkit-touch-callout: none;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    cursor: pointer;
	    width: 100%;
	    position: relative;
	    padding: 0.8125rem 1.75rem;
	    display: inline-block;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: normal;
	    letter-spacing: normal;
	    color: #323232;
	}
	address, dl, ol, ul {
	    margin-bottom: 1rem;
	}
	dl, ol, ul {
	    margin-top: 0;
	}
	ul {
	    padding: 0;
	}
	.search-service-modal .modal-body ul {
	    margin: 0 0 1.75rem;
	    padding: 0;
	    font-size: 0;
	    border-top: 0.0625rem solid #f2f2f2;
	}
	
	[type=button], [type=reset], [type=submit], button {
	    -webkit-appearance: button;
	}
	.remove-button {
	    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBmaWxsPSIjRkZGIiBkPSJNLTczNy00MTdINDMzVjc1M0gtNzM3eiIvPjxwYXRoIGZpbGw9IiMwMDAiIGZpbGwtb3BhY2l0eT0iLjQiIGQ9Ik0tNzM3LTQxN0g0MzNWNzUzSC03Mzd6Ii8+PHBhdGggZmlsbD0iI0ZGRiIgZD0iTS0zNjItMTQ3SDU4djYyMmgtNDIweiIvPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0zMzQgLTEzKSI+PHJlY3Qgd2lkdGg9IjM2NCIgaGVpZ2h0PSI0NCIgZmlsbD0iI0YyRjJGMiIgcng9IjgiLz48cGF0aCBkPSJNMzM0IDMxaDE4VjEzaC0xOHoiLz48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMzYgMTUpIj48Y2lyY2xlIGN4PSI3IiBjeT0iNyIgcj0iNyIgZmlsbD0iI0I1QjVCNSIvPjxwYXRoIHN0cm9rZT0iI0ZGRiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9Ii44MzUiIGQ9Ik00LjUgNC41bDUgNW0wLTVsLTUgNSIvPjwvZz48L2c+PC9nPjwvc3ZnPg==) no-repeat;
	    border: none;
	    width: 1.125rem;
	    height: 1.125rem;
	    position: absolute;
	    right: 2.5rem;
	    top: 0.8125rem;
	}
	
	.form-control {
	    display: block;
	    width: 100%;
	    height: calc(1.5em + 1.5rem);
	    padding: 0.6875rem 1rem;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #323232;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 0.0625rem solid #e1e1e1;
	    border-radius: 0.25rem;
	    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	}
	.autocomplete-input {
	    padding: 0.75rem 0.75rem 0.75rem 2.125rem;
	    background-color: #f2f2f2;
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBmaWxsPSIjRkZGIiBkPSJNLTQxNS00NjlINzU1VjcwMUgtNDE1eiIvPjxwYXRoIGQ9Ik0tMzE1IDE3aDk3MHYxaC05NzB6IiBmaWxsPSIjRjJGMkYyIi8+PHBhdGggZmlsbD0iIzAwMCIgZmlsbC1vcGFjaXR5PSIuNCIgZD0iTS00MTUtNDY5SDc1NVY3MDFILTQxNXoiLz48cGF0aCBmaWxsPSIjRkZGIiBkPSJNLTQwLTE0OGg0MjB2NTIwSC00MHoiLz48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMTIgLTE0KSI+PHJlY3Qgd2lkdGg9IjM2NCIgaGVpZ2h0PSI0NCIgZmlsbD0iI0YyRjJGMiIgcng9IjgiLz48cGF0aCBkPSJNMTIgMzJoMThWMTRIMTJ6Ii8+PHBhdGggc3Ryb2tlPSIjNzM3MzczIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Ik0yMi44NDQgMTguNjU3YTQuMzc2IDQuMzc2IDAgMTEtNi4xOSA2LjE4NyA0LjM3NiA0LjM3NiAwIDAxNi4xOS02LjE4N3ptLjM5MiA2LjU4bDMuMzg5IDMuMzg4Ii8+PC9nPjwvZz48L3N2Zz4=);
	    background-repeat: no-repeat;
	    border-radius: 8px;
	    background-position: 0.75rem 1rem;
	    border: none;
	    margin: 0 1.75rem 1rem;
	    width: auto;
	}
	
	.search-service-autocomplete{
	    display: flex;
	    flex-direction: column;
	}
	
	.modal-body {
	    position: relative;
	    flex: 1 1 auto;
	    padding: 1rem;
	}
	.modal .modal-body {
	    padding: 1.75rem;
	}
	.modal .modal-body {
	    padding: 1.25rem;
	}
	.search-service-modal .modal-body {
	    padding: 0;
	}
	
	/********** 하단의 div **********/
	.modal-backdrop {
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 1040;
	    width: 100vw;
	    height: 100vh;
	    background-color: #000;
	}
	.modal-backdrop {
	    opacity: .5;
	}
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	<div id="__BVID__1682___BV_modal_outer_" style="position: absolute;z-index: 1040;">
		<div id="__BVID__1682" role="dialog" aria-labelledby="__BVID__1682___BV_modal_title_" aria-describedby="__BVID__1682___BV_modal_body_" class="modal fade show search-service-modal" aria-modal="true" style="display: block;">
			<div class="modal-dialog modal-md modal-dialog-centered mobile-full-modal">
				<span tabindex="0"></span>
				<div id="__BVID__1682___BV_modal_content_" tabindex="-1" class="modal-content">
					<header id="__BVID__1682___BV_modal_header_" class="modal-header">
						<h5 id="__BVID__1682___BV_modal_title_" class="modal-title">지역 선택</h5>
						<button type="button" aria-label="Close" class="close">×</button>
					</header>
					<div id="__BVID__1682___BV_modal_body_" class="modal-body">
						<div class="search-service-autocomplete">
							<input type="text" placeholder="어느 지역의 전문가를 찾으세요?" autocomplete="off" class="autocomplete-input form-control" id="__BVID__1687">
							<button class="remove-button" style="display: none;"></button>
							<div class="option-group-selectbox"">
								<ul>
									<li class="level1"> 지역 전체 <!---->
										<div class="bottom-border"></div>
									</li>
									<li class="parent level1"> 경기도
										<div class="loading-indicator" style="display: none;">
											<div class="indicator-body center" style="width: 14px; height: 14px; border-width: 0.25rem; border-style: solid; border-color: rgb(50, 50, 50) rgba(50, 50, 50, 0.2) rgba(50, 50, 50, 0.2); border-image: initial;"></div>
											<p  style="display: none;"></p>
										</div>
										<div class="bottom-border"></div>
									</li>
									<li class="parent level1"> 강원도
										<div class="loading-indicator" style="display: none;">
											<div class="indicator-body center" style="width: 14px; height: 14px; border-width: 0.25rem; border-style: solid; border-color: rgb(50, 50, 50) rgba(50, 50, 50, 0.2) rgba(50, 50, 50, 0.2); border-image: initial;"></div>
											<p style="display: none;"></p>
										</div>
										<div class="bottom-border"></div>
									</li>
									<li class="parent level1"> 충청남도
										<div class="loading-indicator" style="display: none;">
											<div class="indicator-body center" style="width: 14px; height: 14px; border-width: 0.25rem; border-style: solid; border-color: rgb(50, 50, 50) rgba(50, 50, 50, 0.2) rgba(50, 50, 50, 0.2); border-image: initial;"></div>
											<p style="display: none;"></p>
										</div>
										<div class="bottom-border"></div>
									</li>
									<li class="parent level1"> 충청북도 
										<div class="loading-indicator" style="display: none;">
											<div class="indicator-body center" style="width: 14px; height: 14px; border-width: 0.25rem; border-style: solid; border-color: rgb(50, 50, 50) rgba(50, 50, 50, 0.2) rgba(50, 50, 50, 0.2); border-image: initial;"></div>
											<p style="display: none;"></p>
										</div>
										<div class="bottom-border"></div>
									</li>
									<li class="parent level1"> 경상북도
										<div class="loading-indicator" style="display: none;">
											<div class="indicator-body center" style="width: 14px; height: 14px; border-width: 0.25rem; border-style: solid; border-color: rgb(50, 50, 50) rgba(50, 50, 50, 0.2) rgba(50, 50, 50, 0.2); border-image: initial;"></div>
											<p style="display: none;"></p>
										</div>
										<div class="bottom-border"></div>
									</li>
									<li class="parent level1"> 경상남도
										<div class="loading-indicator" style="display: none;">
											<div class="indicator-body center" style="width: 14px; height: 14px; border-width: 0.25rem; border-style: solid; border-color: rgb(50, 50, 50) rgba(50, 50, 50, 0.2) rgba(50, 50, 50, 0.2); border-image: initial;"></div>
											<p style="display: none;"></p>
										</div>
										<div class="bottom-border"></div>
									</li>
									<li class="parent level1"> 전라북도
										<div class="loading-indicator" style="display: none;">
											<div class="indicator-body center" style="width: 14px; height: 14px; border-width: 0.25rem; border-style: solid; border-color: rgb(50, 50, 50) rgba(50, 50, 50, 0.2) rgba(50, 50, 50, 0.2); border-image: initial;"></div>
											<p style="display: none;"></p>
										</div>
										<div class="bottom-border"></div>
									</li>
									<li class="parent level1"> 전라남도
										<div class="loading-indicator" style="display: none;">
											<div class="indicator-body center" style="width: 14px; height: 14px; border-width: 0.25rem; border-style: solid; border-color: rgb(50, 50, 50) rgba(50, 50, 50, 0.2) rgba(50, 50, 50, 0.2); border-image: initial;"></div>
											<p style="display: none;"></p>
										</div>
										<div class="bottom-border"></div>
									</li>
									<li class="parent level1"> 제주도
										<div class="loading-indicator" style="display: none;">
											<div class="indicator-body center" style="width: 14px; height: 14px; border-width: 0.25rem; border-style: solid; border-color: rgb(50, 50, 50) rgba(50, 50, 50, 0.2) rgba(50, 50, 50, 0.2); border-image: initial;"></div>
											<p style="display: none;"></p>
										</div>
										<div class="bottom-border"></div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<span tabindex="0"></span>
			</div>
		</div>
		<div id="__BVID__1682___BV_modal_backdrop_" class="modal-backdrop"></div>
	</div>
		<%@ include file="../common/footer.jsp" %>
	<script>
		$(function(){
			$('.level1').mouseenter(function(){
				$(this).css({'background':'#F2F2F2','color':'#000000'});
			}).mouseleave(function(){
				$(this).css({'background':'#FFFFFF','color':'#000000'});
			});
		});
		
		$(function(){
			$("#__BVID__1687").keyup(function(){
				var k = $(this).val();
				$("li").hide();
				var temp = $("li:contains('" + k + "')");
				
				$(temp).show();
			});
		});
	</script>
</body>
</html>