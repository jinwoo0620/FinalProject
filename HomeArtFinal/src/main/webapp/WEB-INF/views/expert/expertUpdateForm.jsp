<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomeArt</title>
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
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
	.profile{
		width: 1130px;
		margin: auto;
	    padding-top: 4rem;
   	 	padding-bottom: 4rem;
	}
	
	/************ 프로필 사진  ***************/
	.photo{
	    padding: 1.5rem 0px;
    	border-bottom: 0.0625rem solid rgb(242, 242, 242);
		display: block;
	}
	.thumb-container{
	    text-align: center;
	    padding: 1.25rem 0;
	    margin: 0 1.25rem;
	    border-bottom: 0.0625rem solid rgb(242, 242, 242);
	}
	.thumb{
	    margin: 0;
	    float: inherit;
	    display: inline-block;
	}
	.thumb{
	    position: relative;
	}
	.user-profile-picture{
	    width: 7.5rem;
	    height: 7.5rem;
	    border-radius: 12px;
	    overflow: hidden;
	    border: 0.0625rem solid #f2f2f2;
	}
	.user-profile-picture{
	    position: relative;
	}
	.user-profile-picture div.is-square{
	    border-radius: 0.75rem;
	    padding: 0;
	    height: 100%;
	}
	.user-profile-picture div{
	    position: relative;
	    width: 100%;
	    border: 0.0625rem solid #f2f2f2;
	    overflow: hidden;
	    background-size: cover;
	    background-position: 50% 50%;
	    background-color: #e1e1e1;
	}
	.user-profile-picture div img{
		width: 100%;
	    vertical-align: middle;
	}
	.click-icon{
	    position: absolute;
	    right: 0;
	    bottom: 0;
	    width: 1.875rem;
	    height: 1.875rem;
/* 	    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMCIgaGVpZ2h0PSIzMCI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBmaWxsPSIjMDBDN0FFIiBkPSJNMTkgMzBIMFYxMUMwIDQuOTI1IDQuOTI1IDAgMTEgMGgxOXYxOWMwIDYuMDc1LTQuOTI1IDExLTExIDExeiIvPjxwYXRoIGQ9Ik01IDI1aDIwVjVINXoiLz48cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIyIiBkPSJNMTkuNDExIDEwLjc0TDE3LjU1NSA4aC01LjExbC0xLjg1NyAyLjc0SDdWMjBoMTZ2LTkuMjZ6Ii8+PHBhdGggc3Ryb2tlPSIjRkZGIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTE3LjUgMTQuNzVhMi4yNSAyLjI1IDAgMTEtNC41IDAgMi4yNSAyLjI1IDAgMDE0LjUgMHoiLz48L2c+PC9zdmc+) no-repeat; */
	    cursor: pointer;
	}
	
	/************ 이름, 한줄소개, 연락가능   ***************/
/* 	.my-profile-name input[data-v-631b2564] { */
/* 	    border-radius: 4px; */
/* 	    padding: 0.75rem; */
/* 	    height: auto; */
/* 	} */
	.my-profile{
		border-bottom: 0.0625rem solid rgb(242, 242, 242);
		padding: 1.25rem 0;
	    margin: 0 1.25rem;
	}
	.comp-header{
		display: block;
		margin-bottom: 1rem;
	}
	.heading{
		display: flex;
	}
	.comp-header h2{
		font-size: 1.125rem;
	    font-weight: 700;
	    line-height: 1.44;
	    letter-spacing: -.01875rem;
	    margin: 0;
	}
	.action-group{
		cursor: pointer;
	    font-size: .875rem;
	    font-weight: 500;
	    line-height: 1.43;
	    letter-spacing: -.0125rem;
	    text-align: right;
	    flex: 1;
	}
	.update{
		color: #4f8cd1;
	}
	
	/************ 본인인증  ***************/
	.percentage-badge{
		display: inline-block;
	    width: 2.6875rem;
	    height: 1.4375rem;
	    line-height: 1.4375rem;
	    font-size: .75rem;
	    text-align: center;
	    color: #b5b5b5;
	    background-color: #f2f2f2;
	    border-radius: 17px;
	    margin-top: 0.125rem;
	    margin-left: 0.5rem;
	}
	.auth{
		color: #ff3131;
	}
	
	/************ 사업자등록증 등록   ***************/
	.new{
		color: #ff3131;
	}
	.subtitle{
		margin-top: 0.25rem;
	    margin-bottom: 0;
	    font-size: .75rem;
	    color: #737373;
	}
	
	/************ 제공 분야   ***************/
	.info{
		font-size: 1rem;
	}
	.view{
		font-size: 0;
	}
	.view ul{
		display: inline-block;
		margin-bottom: 0;
		width: 100%;
	}
	.view ul li.add{
		background: #4f8cd1;
	    color: #fff;
	    cursor: pointer;
	    border: 0.0625rem solid #4f8cd1;
	}
	
	.view ul li{
    font-size: .875rem;
    letter-spacing: -.0125rem;
    padding: 0.4375rem 0.875rem;
    position: relative;
    float: left;
    border-radius: 1.3125rem;
    border: 0.0625rem solid #e1e1e1;
    margin-right: 0.5rem;
    margin-bottom: 0.75rem;
    line-height: 1.5;
    color: #737373;
    list-style: none;
	}
	
	/************ 자격증 및 기타 서류 등록 ***************/
	.my-profile .comp-header{
	    display: block;
	    margin-bottom: 1rem;
	}
	.heading{
	    display: flex;
	}
	.my-profile .comp-header h2{
	    font-size: 1.125rem;
	    font-weight: 700;
	    line-height: 1.44;
	    letter-spacing: -.01875rem;
	    margin: 0;
    }
    .my-profile .info{
	    font-size: 1rem;
	}
	.my-profile .alert{
	    padding: 1.25rem 1rem;
	}
	.sign-container.secondary{
	    background-color: #f2f2f2;
	}
	.sign-container{
	    border-radius: 8px;
	}
	.alert {
	    position: relative;
	    padding: 1.25rem 1rem;
	    margin-bottom: 1rem;
	    border: 0.0625rem solid transparent;
	}
	.header{
	    flex: 1;
	}
	.sign-container.secondary .title{
	    color: #323232;
	}
	.title{
	    display: flex;
	    align-items: flex-start;
	    font-size: .875rem;
	}
	.title img{
	    align-self: center;
	}
	.my-profile .alert .title span {
	    padding-left: 0.5rem;
	}
	.title span{
	    white-space: pre-line;
	}
	.my-profile .media-body{
	    display: flex;
	    flex-direction: column;
	}
	.media-body {
	    flex: 1;
	}
	.my-profile .media-body>ul{
	    display: flex;
	    margin: 0.75rem -0.5rem -0.5rem;
	    flex: 1;
	    flex-wrap: wrap;
	}
	ul {
	    padding: 0;
	}
	.my-profile edia-body>ul>li{
	    flex: 0 0 33.33333%;
	    max-width: 33.33333%;
	}
	.my-profile .media-body>ul>li{
	    flex: 0 0 20%;
	    max-width: 20%;
	    position: relative;
	}
	ul li {
	    list-style: none;
	}
	.my-profile .media-body>ul>li:before {
	    content: "";
	    cursor: pointer;
	    margin: 0.5rem;
	    border: 0.0625rem dashed #e1e1e1;
	    border-radius: 0.5rem;
	    display: block;
	    padding-top: calc(100% - 1rem);
	    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNiIgaGVpZ2h0PSIzNiI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMCAwaDM2djM2SDB6Ii8+PGcgc3Ryb2tlPSIjMDBDN0FFIiBzdHJva2Utd2lkdGg9IjEuNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNCA0KSI+PHBhdGggc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBkPSJNMTQgN3YxNG03LTdINyIvPjxjaXJjbGUgY3g9IjE0IiBjeT0iMTQiIHI9IjE0Ii8+PC9nPjwvZz48L3N2Zz4=) no-repeat 50%;
	}
	.my-profile .media-body>ul>li .file-input{
	    overflow: hidden;
	    border: unset;
	}
	.my-profile .media-body>ul>li>div{
	    cursor: pointer;
	    background-size: cover;
	    background-position: 50% 50%;
	    position: absolute;
	    top: 0;
	    width: calc(100% - 1rem);
	    height: calc(100% - 1rem);
	    margin: 0.5rem;
	    border-radius: 0.5rem;
	    border: 0.0625rem solid #f2f2f2;
	}
	.custom-file {
	    display: inline-block;
	    margin-bottom: 0;
	}
	.custom-file-input {
	    z-index: 2;
	    margin: 0;
	    opacity: 0;
	    position: relative;
	    width: 100%;
	    height: calc(1.5em + 1.5rem);
	}
	.my-profile .media-body>ul>li .file-input label.custom-file-label {
	    width: 100%;
	    height: 100%;
	    opacity: 0;
	    cursor: pointer;
	}
	.custom-file-label {
	    white-space: nowrap;
	    overflow-x: hidden;
	}
	.custom-control-label:before, .custom-file-label, .custom-select {
	    transition: background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	}
	.custom-file-label, .custom-file-label:after {
	    position: absolute;
	    top: 0;
	    right: 0;
	    padding: 0.6875rem 1rem;
	    line-height: 1.5;
	    color: #323232;
	}
	.custom-file-label {
	    left: 0;
	    z-index: 1;
	    height: calc(1.5em + 1.5rem);
	    font-weight: 400;
	    background-color: #fff;
	    border: 0.0625rem solid #e1e1e1;
	    border-radius: 0.25rem;
	}
	label {
	    display: inline-block;
	    margin-bottom: 0.5rem;
	}
	.custom-file-input~.custom-file-label:after {
	    content: attr(data-browse);
	}
	.custom-file-label:after {
	    bottom: 0;
	    z-index: 3;
	    display: block;
	    height: calc(1.5em + 1.375rem);
	    content: "Browse";
	    background-color: #f2f2f2;
	    border-left: inherit;
	    border-radius: 0 0.25rem 0.25rem 0;
	}
	.my-profile .media-body>ul>li+li:before {
	    cursor: default;
	    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNiIgaGVpZ2h0PSIzNiI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48ZyBzdHJva2U9IiNCNUI1QjUiIHN0cm9rZS13aWR0aD0iMS41IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSg0IDQpIj48cmVjdCB3aWR0aD0iMjgiIGhlaWdodD0iMjgiIHJ4PSIzLjUiLz48Y2lyY2xlIGN4PSI4LjU1NiIgY3k9IjguNTU2IiByPSIyLjMzMyIvPjxwYXRoIGQ9Ik0yOCAxOC42NjdsLTcuNzc3LTcuNzc4TDMuMTExIDI4Ii8+PC9nPjxwYXRoIGQ9Ik0wIDBoMzZ2MzZIMHoiLz48L2c+PC9zdmc+) no-repeat 50% #f2f2f2;
	}
	.my-profile .media-body>ul>li:before {
	    content: "";
	    cursor: pointer;
	    margin: 0.5rem;
	    border: 0.0625rem dashed #e1e1e1;
	    border-radius: 0.5rem;
	    display: block;
	    padding-top: calc(100% - 1rem);
	    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNiIgaGVpZ2h0PSIzNiI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMCAwaDM2djM2SDB6Ii8+PGcgc3Ryb2tlPSIjMDBDN0FFIiBzdHJva2Utd2lkdGg9IjEuNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNCA0KSI+PHBhdGggc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBkPSJNMTQgN3YxNG03LTdINyIvPjxjaXJjbGUgY3g9IjE0IiBjeT0iMTQiIHI9IjE0Ii8+PC9nPjwvZz48L3N2Zz4=) no-repeat 50%;
	}
	/************ 리뷰 ***************/
	.comp-header h2{
		font-size: 1.125rem;
	    font-weight: 700;
	    line-height: 1.44;
	    letter-spacing: -.01875rem;
	    margin: 0;
	}
	.percentage-badge{
		display: inline-block;
	    width: 2.6875rem;
	    height: 1.4375rem;
	    line-height: 1.4375rem;
	    font-size: .75rem;
	    text-align: center;
	    color: #b5b5b5;
	    background-color: #f2f2f2;
	    border-radius: 17px;
	    margin-top: 0.125rem;
	    margin-left: 0.5rem;
	}
	.profile-review-list .summary{
	    width: 100%;
	    display: inline-block;
	}
	.profile-review-list .summary .avg{
	    font-size: 2.5rem;
	    font-weight: 500;
	    line-height: 1.45;
	    letter-spacing: -.05rem;
	    color: #323232;
	    float: left;
	    margin-right: 0.9375rem;
	}
	.profile-review-list .summary .info{
	    font-size: .875rem;
	    line-height: 1.43;
	    letter-spacing: -.0125rem;
	    color: #737373;
	    display: inline-block;
	    position: relative;
	    top: 0.8125rem;
	}
	.profile-review-list .summary .info .star-rate{
	    margin-top: 0.625rem;
	}
	.star-rate{
	    padding: 0;
	    margin: 0;
	    line-height: 0;
	    display: table-row;
	}
	.profile-review-list .summary .info .star-rate li {
	    margin-right: 0.25rem;
	}
	.star-rate.readonly li{
	    cursor: default;
	}
	.star-rate li{
	    display: table-cell;
	    vertical-align: middle;
	    width: auto;
	    cursor: pointer;
	    line-height: 0;
	    transition: opacity .2s ease-in-out;
	}
	ul li {
	    list-style: none;
	}
	.star-rate.isBig li img{
	    width: 1.25rem;
	    height: 1.125rem;
	    margin-right: 0.25rem;
	}
	img{
		vertical-align: middle;
		border-style: none;
	}
	
	/************  저장하기, 취소하기  ***************/
	button {
	    border-radius: 0;
	}
	button, input, optgroup, select, textarea {
	    margin: 0;
	    font-family: inherit;
	    font-size: inherit;
	    line-height: inherit;
	}
 	.save_cancel{ 
 		text-align: center; 
 		padding: 1.5rem 0px;  
 	} 
 	.save_cancel button{
 		color: #FFFFFF; 
  		background: #4f8cd1;
  		border-radius: 4rem;
  		border:  1px solid #4f8cd1;
  		cursor: pointer;
/*   		width: 100px; */
  	}
  	textarea{
  		width: 100%;
  		font-size: 1rem;
  	}
  	
  	.info select{
  		padding: 0.25rem 0;
	    min-width: 7.8125rem;
	    border: none;
	    border-bottom: 0.0625rem solid #e1e1e1;
	    height: auto;
	    font-size: 1rem;
	    line-height: 1.3;
	    border-radius: 0;
  	}
  	
  	.info_2 input{
  		width: 80px;
  		text-align: center;
  	}
  	
  	.info_3 input{
  		width: 100%;
  		height: 2rem;
  		font-size: 1rem;
  	}
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	<form action="eupdate.ex" method="post" enctype="Multipart/form-data">
		<input type="hidden" name="page" value="${ page }"><!-- page 넘겨준 거 받아오고 -->
      	<input type="hidden" name="expertProfileNo" value="${ expert.expertProfileNo }">
      	<input type="hidden" name="renameFileName" value="${ expert.renameFileName }">
		<div class="profile">
			<!-- 프로필 사진 -->
			<div class="thumb-container">
				<div class="thumb">
					<div class="user-profile-picture no-padding">
						<div class="is-square">
							<c:if test="${ !empty expert.originalFileName }">
								<img id="preview" class="memberPhoto" src="${ pageContext.servletContext.contextPath }/resources/buploadFiles/${ expert.renameFileName }" alt="프로필 사진이 없는 사용자 기본 이미지">
							</c:if>
						</div>
					</div>
					<input type="file" name="reloadFile" multiple accept="image/*" onchange="readURL(this);">
				</div>
			</div>
			
			<!-- 이름 및 제목 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2 class="name">이름 및 제목</h2>
						<span class="percentage-badge">5%</span>
					</div>
				</div>
				<div class="info_3">
					<input type="text" name="expertTitle" value="${ expert.expertTitle }">
				</div>
			</div>
			
			<!-- 닉네임 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2 class="name">닉네임</h2>
<!-- 						<span class="percentage-badge"></span> -->
					</div>
				</div>
				<div class="info_3">
					${ loginUser.nickName }
					<input type="hidden" name="expertId" readonly value="${ loginUser.id }">
				</div>
			</div>
			
			<!-- 한줄소개 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2 class="">한줄소개</h2>
						<span class="percentage-badge">10%</span>
					</div>
				</div>
				<div class="info">
					<div class="value">
						<div class="collapsed-text-line">
							<textarea rows="15" cols="" name="expertInfo" style="resize:none;">${ expert.expertInfo }</textarea>
							<div class="collapse-button" style="display: none;"></div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 지역 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2 class="">활동지역</h2>
						<span class="percentage-badge">5%</span>
					</div>
				</div>
				<div class="info">
					<select name="area" style="width: 200px;">
						<option value="경기도" selected="selected" <c:if test="${area eq '경기도'}">selected</c:if>>경기도</option>
						<option value="강원도" <c:if test="${expert.area eq '강원도'}">selected</c:if>>강원도</option>
						<option value="충정남도" <c:if test="${expert.area eq '충청남도'}">selected</c:if>>충청남도</option>
						<option value="충청북도" <c:if test="${expert.area eq '충청북도'}">selected</c:if>>충청북도</option>
						<option value="경상북도" <c:if test="${expert.area eq '경상북도'}">selected</c:if>>경상북도</option>
						<option value="경상남도" <c:if test="${expert.area eq '경상남도'}">selected</c:if>>경상남도</option>
						<option value="전라북도" <c:if test="${expert.area eq '전라북도'}">selected</c:if>>전라북도</option>
						<option value="전라남도" <c:if test="${expert.area eq '전라남도'}">selected</c:if>>전라남도</option>
						<option value="제주도" <c:if test="${expert.area eq '제주도'}">selected</c:if>>제주도</option>
					</select>
				</div>
			</div>
			
			<!-- 직원수 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2 class="">직원수</h2>
						<span class="percentage-badge">5%</span>
					</div>
				</div>
				<div class="info">
					<select name="employeeCount" style="width: 200px;">
						<option value="직원 1명 (본인포함)" selected="selected" <c:if test="${expert.employeeCount eq '직원 1명(본인포함)'}">selected</c:if>>직원 1명(본인포함)</option>
						<option value="직원 2명" <c:if test="${expert.employeeCount eq '직원 2명'}">selected</c:if>>직원 2명</option>
						<option value="직원 3명" <c:if test="${expert.employeeCount eq '직원 3명'}">selected</c:if>>직원 3명</option>
						<option value="직원 4명" <c:if test="${expert.employeeCount eq '직원 4명'}">selected</c:if>>직원 4명</option>
						<option value="직원 5명" <c:if test="${expert.employeeCount eq '직원 5명'}">selected</c:if>>직원 5명</option>
						<option value="직원 10명" <c:if test="${expert.employeeCount eq '직원 10명'}">selected</c:if>>직원 10명</option>
						<option value="직원 20명" <c:if test="${expert.employeeCount eq '직원 20명'}">selected</c:if>>직원 20명</option>
						<option value="직원 30명" <c:if test="${expert.employeeCount eq '직원 30명'}">selected</c:if>>직원 30명</option>
						<option value="직원 40명" <c:if test="${expert.employeeCount eq '직원 40명'}">selected</c:if>>직원 40명</option>
						<option value="직원 50명 이상" <c:if test="${expert.employeeCount eq '직원 50명 이상'}">selected</c:if>>직원 50명 이상</option>
					</select>
				</div>
			</div>
			
			<!-- 고용 횟수 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2>고용 횟수</h2>
						<span class="percentage-badge">10%</span>
					</div>
				</div>
				<div class="info_2">
					<input type="text" name="hireCount" value="${ expert.hireCount }">회
				</div>
			</div>
			
			<!-- 경력 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2 class="">경력</h2>
						<span class="percentage-badge">10%</span>
					</div>
				</div>
				<div class="info_2">
					<input type="text" name="career" value="${ expert.career }">년
				</div>
			</div>
			
			<!-- 근무요일 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2 class="">근무요일</h2>
						<span class="percentage-badge">7%</span>
					</div>
				</div>
				<div class="info_1">
					<c:set var="workingDay" value="${ expert.workingDay }"/>
					<input type="checkbox" name="workingDay" value="월요일" <c:if test="${ fn: contains(workingDay, '월요일') }">checked</c:if>><label>월</label>	&nbsp;
					<input type="checkbox" name="workingDay" value="화요일" <c:if test="${ fn: contains(workingDay, '화요일') }">checked</c:if>><label>화</label>	&nbsp;
					<input type="checkbox" name="workingDay" value="수요일" <c:if test="${ fn: contains(workingDay, '수요일') }">checked</c:if>><label>수</label>	&nbsp;	
					<input type="checkbox" name="workingDay" value="목요일" <c:if test="${ fn: contains(workingDay, '목요일') }">checked</c:if>><label>목</label>	&nbsp;
					<input type="checkbox" name="workingDay" value="금요일" <c:if test="${ fn: contains(workingDay, '금요일') }">checked</c:if>><label>금</label>	&nbsp;
					<input type="checkbox" name="workingDay" value="토요일" <c:if test="${ fn: contains(workingDay, '토요일') }">checked</c:if>><label>토</label>	&nbsp;
					<input type="checkbox" name="workingDay" value="일요일" <c:if test="${ fn: contains(workingDay, '일요일') }">checked</c:if>><label>일</label>
				</div>
			</div>
			
			<!-- 연락 가능 시간 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2 class="">연락 가능 시간</h2>
						<span class="percentage-badge">8%</span>
					</div>
				</div>
				<div class="info_1">
					<c:forEach items="${ expert.workingTime }" var="workingTime" begin="0" end="0">
						<input type="time" name="workingTime" style="width: 110px;" value="${ workingTime }"> ~ 
					</c:forEach>
					<c:forEach items="${ expert.workingTime }" var="workingTime" begin="1" end="1">
						<input type="time" name="workingTime" style="width: 110px;" value="${ workingTime }">
					</c:forEach>
				</div>
			</div>
	
			<!-- 상세 설명 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2>상세 설명</h2>
						<span class="percentage-badge">15%</span>
					</div>
				</div>
				<div class="info">
					<div class="value">
						<div class="collapsed-text-line">
							<textarea rows="15" cols="" name="detailDescription" style="resize:none;">${ expert.detailDescription }</textarea>
							<div class="collapse-button" style="display: none;"></div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 사업자 등록번호 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2 class="">사업자등록증 등록</h2>
						<span class="percentage-badge">20%</span>
					</div>
				</div>
				<div class="info_2">
					<p class="subtitle">허위정보에 대한 모든 책임은 본인에게 있습니다</p>
					<c:forEach items="${ expert.businessLicense }" var="businessLicense" begin="0" end="0">
						<input type="text" name="businessLicense" maxlength="3" value="${ businessLicense }"> - 
					</c:forEach>
					<c:forEach items="${ expert.businessLicense }" var="businessLicense" begin="1" end="1">
						<input type="text" name="businessLicense" maxlength="2" value="${ businessLicense }"> - 
					</c:forEach>
					<c:forEach items="${ expert.businessLicense }" var="businessLicense" begin="2" end="2">
						<input type="text" name="businessLicense" maxlength="5" value="${ businessLicense }">
					</c:forEach>
				</div>
			</div>
			
			<!-- 제공 분야 -->
			<div class="my-profile">
				<div class="comp-header">
					<div class="heading">
						<h2 class="">제공 분야</h2>
						<span class="percentage-badge">5%</span>
<!-- 						<div class="action-group" id="action-group7"> -->
<!-- 							<div class="update" id="update7">수정</div> -->
<!-- 						</div> -->
					</div>
				</div>
				<div class="info">
					<c:set var="field" value="${ expert.field }"/>
					<input type="checkbox" name="field" value="이사/입주청소 " <c:if test="${ fn: contains(field, '이사/입주청소') }">checked</c:if>><label>이사/입주청소</label>	&nbsp;
					<input type="checkbox" name="field" value="타일시공" <c:if test="${ fn: contains(field, '타일시공') }">checked</c:if>><label>타일시공</label>	&nbsp;
					<input type="checkbox" name="field" value="도배/장판 " <c:if test="${ fn: contains(field, '도배/장판') }">checked</c:if>><label>도배/장판</label>	&nbsp;
					<input type="checkbox" name="field" value="에어컨 설치/수리" <c:if test="${ fn: contains(field, '에어컨 설치/수리') }">checked</c:if>><label>에어컨 설치/수리</label>	&nbsp;
					<input type="checkbox" name="field" value="실내 인테리어" <c:if test="${ fn: contains(field, '실내 인테리어') }">checked</c:if>><label>실내 인테리어</label>
				</div>
			</div>
			<div class="save_cancel">
				<button class="modify" type="submit">수정하기</button>
				<c:url var="elist" value="elist.ex">
               		<c:param name="page" value="${ page }"/>
               	</c:url>
				<button class="onTheList" type="button" onclick="location.href='${ elist }'">목록으로</button>
				<button type="button" onclick="location.href='javascript:history.go(-1);'">이전페이지로</button>
			</div>
		</div>
	</form>
		<%@ include file="../common/footer.jsp" %>
	<script>
		$(function(){
			$('#action-group7').click(function(){
				if($('#update7').text() == '수정'){
					$('#update7').text('저장').css('color', 'red');
				} else{
					$('#update7').text('수정').css('color', '#4f8cd1');	
				}
			});
		});

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
	</script>
</body>
</html>