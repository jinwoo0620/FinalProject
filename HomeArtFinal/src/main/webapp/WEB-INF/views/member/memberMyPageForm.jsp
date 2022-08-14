<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.kh.homeArt.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	Member loginUser = (Member)session.getAttribute("loginUser");  
	String address = loginUser.getAddress();
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');
@import url("https://fonts.googleapis.com/css?family=DM+Sans:400,500,700|Source+Sans+Pro:300,400,600,700&display=swap");

* {
  outline: none;
  box-sizing: border-box;
}

html {
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
}

body {
  font-family: 'Noto Sans KR', sans-serif;
  background-color: #EBF2FE;
  color: black;
}

#alignBtn{
	text-align: center;
}

.container {
  background-color: #EBF2FE;
  display: flex;
  max-width: 1600px;
  height: 100vh;
  overflow: hidden;
  margin: 0 auto;
}

.left-side { /*왼쪽 사이드바*/
  width: 380px;
  border-right: 1px solid black;
  display: flex;
  flex-direction: column;
  transition: 0.3s;
  background-color: #92b7e0; 
  overflow: auto;
  flex-shrink: 0;
}
@media screen and (max-width: 930px) {
  .left-side.active {
    z-index: 4;
  }
  .left-side.active > *:not(.logo) {
    opacity: 1;
    transition: 0.3s 0.2s;
  }
  .left-side.active .left-side-button svg:first-child {
    opacity: 0;
  }
  .left-side.active .left-side-button svg:last-child {
    transform: translate(-50%, -50%);
    opacity: 1;
  }
  .left-side:not(.active) {
    width: 56px;
    overflow: hidden;
  }
  .left-side:not(.active) > *:not(.logo):not(.left-side-button) {
    opacity: 0;
  }
  .left-side:not(.active) .logo {
    writing-mode: vertical-lr;
    transform: rotate(180deg);
    transform-origin: bottom;
    display: flex;
    align-items: center;
    margin-top: -10px;
  }
}

.right-side { /*오른쪽 사이드바*/
  width: 340px;
  flex-shrink: 0;
  margin-left: auto;
  overflow: auto;
  background-color: #92b7e0;
  display: flex; 
  flex-direction: column;
}
@media screen and (max-width: 1210px) {
  .right-side {
    position: fixed;
    right: 0;
    top: 0;
    transition: 0.3s;
    height: 100%;
    transform: translateX(280px);
    z-index: 4;
  }
  .right-side.active {
    transform: translatex(0);
  }
}

.main {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  background-color: #181d2f;
}

.logo { /*ì¼ìª½ ìë¨*/
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 17px;
  color: #fff;
  font-weight: 600;
  text-align: center;
  height: 68px;
  line-height: 68px;
  letter-spacing: 4px;
  position: sticky;
  top: 0;
  background: #4F8CD1;
}

.side-title {
  font-family: 'Noto Sans KR', sans-serif;
  color: black;
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 20px;
  
}

.side-wrapper {/*ì¢ì°ììª½ì°½css*/
  padding: 30px;
  color: white;
   /*êµ¬ê¸ ì¹í°í¸*/
}

.side-menu {
  display: flex;
  flex-direction: column;
  font-size: 15px;
  white-space: nowrap;
  
}

.side-menu a {
  text-decoration: none;
  color: white; /*ì¼ìª½ ë©ë´ë°*/
  display: flex;
  align-items: center;
}

.side-menu a:not(:last-child) {
  margin-bottom: 20px;
}

.follow-me {
  text-decoration: none;
  font-size: 14px;
  display: flex;
  align-items: center;
  margin-top: auto;
  overflow: hidden;
  color: #9c9cab;
  padding: 0 20px;
  height: 52px;
  flex-shrink: 0;
  border-top: 1px solid #272a3a;
  position: relative;
}
.follow-me svg {
  width: 16px;
  height: 16px;
  margin-right: 8px;
}

.follow-text {
  display: flex;
  align-items: center;
  transition: 0.3s;
}

.follow-me:hover .follow-text {
  transform: translateY(100%);
}
.follow-me:hover .developer {
  top: 0;
}

.developer {
  position: absolute;
  color: #fff;
  left: 0;
  top: -100%;
  display: flex;
  transition: 0.3s;
  padding: 0 20px;
  align-items: center;
  background-color: #272a3a;
  width: 100%;
  height: 100%;
}

.developer img {
  border-radius: 50%;
  width: 26px;
  height: 26px;
  object-fit: cover;
  margin-right: 10px;
}

.search-bar {
  height: 60px;
  background-color: #EBF2FE; /*ìì¹ë°*/
  z-index: 3;
  position: relative;
}
.search-bar input {/*ìì¹ë°(ê²ì)*/
  height: 100%;
  width: 100%;
  display: block;
  background-color: transparent;
  border: none;
  padding: 0 54px;
/*   background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='512' height='512'%3e%3cpath d='M508.9 478.7L360 330a201.6 201.6 0 0045.2-127.3C405.3 90.9 314.4 0 202.7 0S0 91 0 202.7s91 202.6 202.7 202.6c48.2 0 92.4-17 127.3-45.2L478.7 509c4.2 4.1 11 4.1 15 0l15.2-15.1c4.1-4.2 4.1-11 0-15zm-306.2-116c-88.3 0-160-71.8-160-160s71.7-160 160-160 160 71.7 160 160-71.8 160-160 160z' data-original='%23000000' class='active-path' data-old_color='%23000000' fill='%235C5D71'/%3e%3c/svg%3e"); */
  background-repeat: no-repeat;
  background-size: 16px;
  background-position: 25px 50%;
  color: black;
  font-family: "Source Sans Pro", sans-serif;
  font-weight: 600;
}
.search-bar input::placeholder {
  color: gray; /*ìì¹ë° íë ì´ì¤íë ìê¹*/
}

.main-container {
  padding: 20px;
  flex-grow: 1;
  overflow: auto;
  background-color: white; /*ë©ì¸ ë°±ê·¸ë¼ì´ë ì»¬ë¬*/
  
}

.profile {
  position: relative;
  height: 40vh;
  min-height: 250px;
  max-height: 350px;
/*   z-index: 1; íë¡í ë·ë°°ê²½ì */
}
.profile-cover {
  position: relative;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
  border-radius: 4px;
}
.profile:before {
  content: "";
  width: 100%;
  height: 100%;
  position: absolute;
  z-index: -1;
  left: 0;
  top: 0;
  background-image: url("https://images.unsplash.com/photo-1508247967583-7d982ea01526?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80");
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  filter: blur(50px);
  opacity: 0.7;
}



.profile-menu-link {
  padding: 20px 41px;
  color: white;
  transition: 0.3s;
  cursor: pointer;
}
.profile-menu-link.active, .profile-menu-link:hover {
  color: #fff;
  background-color:  #abc9ed;
  border-bottom: 3px solid #1488fa;
}

.profile-avatar {
  position: absolute;
  align-items: center;
  display: flex;
  z-index: 1;
  bottom: 16px;
  left: 24px;
}

.profile-img {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid #4F8CD1;
}

/*  íë¡íì´ë¦ */
.profile-name {
  margin-left: 24px;
  margin-bottom: 24px;
  font-size: 22px;
  color: #fff;
  font-weight: 600;
  font-family: 'Noto Sans KR', sans-serif;
  text-shadow: -1px 0px black, 0px 1px black, 1px 0px black, 0px -1px black; /*ê¸ì¨ íëë¦¬*/
}

.timeline {
  display: flex;
  padding-top: 20px;
  position: relative;
  z-index: 2; 
}

.timeline-left {
  width: 100%;
  flex-shrink: 0;
  height: 400px;
  
}

@media screen and (max-width: 768px) {
  .timeline {
    flex-wrap: wrap;
    flex-direction: column-reverse;
  }
  .timeline-right {
    padding-left: 0;
    margin-bottom: 20px;
  }
  .timeline-left {
    width: 100%;
  }
}

/* 메인(중간) 박스들  */
.box {
  background-color: #EBF2FE;
  border-radius: 4px;
  width:100%;
  
}

.intro {
  padding: 20px;
}
.intro-title {
  font-family: 'Noto Sans KR', sans-serif;
  color: #5c5e6e;
  font-weight: 600;
  font-size: 18px;
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}
.intro-menu {
  background-color: #8f98a9;
  box-shadow: -8px 0 0 0 #8f98a9, 8px 0 0 0 #8f98a9;
  width: 5px;
  height: 5px;
  border: 0;
  padding: 0;
  border-radius: 50%;
  margin-left: auto;
  margin-right: 8px;
}

.info {
  font-size: 15px;
  color: black;
}
.info-item {
/*   display: flex; */
  
}
.info-item + .info-item {
  margin-top: 14px;
}
.info-item a {
  margin-left: 6px;
  color: #1771d6;
  text-decoration: none;
}
.info-item svg {
  width: 16px;
  margin-right: 10px;
}

.event {
  position: relative;
  margin-top: 20px;
  padding: 10px;
}

.event-wrapper {
  position: relative;
}

.event-img {
  max-width: 100%;
  display: block;
  padding-bottom: 12px;
}

.event-date {
  position: absolute;
  left: 20px;
  top: 15px;
}

.event-month {
  background-color: #1687fa;
  padding: 7px 20px;
  font-weight: 600;
  font-family: 'Noto Sans KR', sans-serif;
  color: #fff;
  text-align: center;
  border-radius: 4px 4px 0 0;
}

.event-day {
  width: 100%;
  backdrop-filter: blur(4px);
  color: #fff;
  font-size: 22px;
  font-weight: 600;
  font-family: 'Noto Sans KR', sans-serif;
  background-color: rgba(0, 0, 0, 0.4);
  padding: 6px 0;
  text-align: center;
}

.event-title {
  color: #c3c5d5;
  margin-bottom: 5px;
  font-family: 'Noto Sans KR', sans-serif;
  font-weight: 600;
  padding: 0 14px;
}

.event-subtitle {
  color: #5c5e6e;
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 13px;
  font-weight: 500;
  padding: 0 14px;
}

.pages {
  margin-top: 20px;
  padding: 20px;
}

.user { 
   display: flex; 
   align-items: center;
   cursor: pointer; 
} 

.user + .user {
  margin-top: 18px;
}

.user-img {
  border-radius: 50%;
  width: 45px;
  height: 45px;
  margin-right: 15px;
  object-fit: cover;
  object-position: center;
}

.username {
  font-size: 15px;
  font-family: 'Noto Sans KR', sans-serif;
}

.status-menu {
  padding: 20px;
  display: flex;
  align-items: center;
}
.status-menu-item {
  text-decoration: none;
  color: #ccc8db;
  padding: 10px 14px;
  line-height: 0.7;
  font-family: 'Noto Sans KR', sans-serif;
  font-weight: 500;
  border-radius: 20px;
}
.status-menu-item.active, .status-menu-item:hover {
  background-color: #2e2e40;
  color: #fff;
}
.status-menu-item + .status-menu-item {
  margin-left: 10px;
}
@media screen and (max-width: 500px) {
  .status-menu {
    font-size: 14px;
  }
  .status-menu-item + .status-menu-item {
    margin-left: 0;
  }
}

.status-img {
  width: 50px;
  height: 50px;
  object-fit: cover;
  border-radius: 50%;
  margin-right: 20px;
}

.status-main {
  padding: 20px;
  display: flex;
  align-items: center;
  border-bottom: 1px solid #272a3a;
  padding-bottom: 20px;
  flex-wrap: wrap;
}

.status-textarea {
  flex-grow: 1;
  background-color: transparent;
  border: none;
  resize: none;
  margin-top: 15px;
  color: #fff;
  max-width: calc(100% - 70px);
}
.status-textarea::placeholder {
  color: #5c5d71;
}

.status-actions {
  display: flex;
  padding: 10px 20px;
}

.status-action {
  text-decoration: none;
  color: #ccc8db;
  margin-right: 20px;
  display: flex;
  align-items: center;
}
.status-action svg {
  width: 16px;
  flex-shrink: 0;
  margin-right: 8px;
}
@media screen and (max-width: 1320px) {
  .status-action {
    width: 16px;
    overflow: hidden;
    color: transparent;
    white-space: nowrap;
  }
}

.status-share {
  background-color: #1b86f9;
  border: none;
  color: #fff;
  border-radius: 4px;
  padding: 10px 20px;
  margin-left: auto;
  box-shadow: 0 0 20px #1b86f9;
  cursor: pointer;
}

.album {
  padding-top: 20px;
  
}
.album .status-main {
  border: none;
  display: flex;
}
.album .intro-menu {
  margin-bottom: auto;
  margin-top: 5px;
}

.album-detail {
  width: calc(100% - 110px);
}

.album-title span {
  color: #1771d6;
  cursor: pointer;
}

.album-content {
  padding: 0 20px 20px;
  font-size: 15px;
}

.album-photo {
  width: 100%;
  object-fit: cover;
  object-position: center;
  border-radius: 4px;
  margin-top: 10px;
}

.album-photos {
  display: flex;
  margin-top: 20px;
  max-height: 30vh;
}

.album-photos > .album-photo {
  width: 50%;
}

.album-right {
  width: 50%;
  margin-left: 10px;
  line-height: 0;
  display: flex;
  flex-direction: column;
}
.album-right .album-photo {
  height: calc(50% - 10px);
}

.album-actions {
  padding: 0 20px 20px;
}

.album-action {
  margin-right: 20px;
  text-decoration: none;
  color: #a2a4b4;
  display: inline-flex;
  align-items: center;
  font-weight: 600;
}
.album-action:hover {
  color: #fff;
}
.album-action svg {
  width: 16px;
  margin-right: 6px;
}

.account-button {
  border: 0;
  background: 0;
  color: #64677a;
  padding: 0;
  cursor: pointer;
  position: relative;
}

.account-button svg {
  width: 20px;
}

.account-button:not(.right-side-button) + .account-button:before {
  position: absolute;
  right: 0px;
  top: -2px;
  background-color: #1b86f8;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  content: "";
  border: 2px solid #EBF2FE;
}

.account-profile {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  margin: 0 10px;
}

.account-user {
  display: inline-flex;
  align-items: center;
  color: black;
  font-size: 18px;
  font-weight: 600;
}
.account-user span {
  font-size: 10px;
  font-weight: normal;
}

.account { /* 오른쪽 상단 계정 */
  height: 60px;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  position: sticky;
  top: 0;
  background-color: #4F8CD1;
  z-index: 3;
  flex-shrink: 0;
}

.stories .user-img {
  border: 2px solid #e2b96c;
}

.stories .album-date {
  font-family: "Source Sans Pro", sans-serif;
}


.contacts .username {
/*   display: flex;  */
/*   flex: 1; */
/*   align-items: center; */
}

.right-search svg {
  width: 16px;
  height: 16px;
}

.right-search {
  padding-right: 10px;
  display: flex;
  align-items: center;
  border-top: 1px solid #272a3a;
  position: sticky;
  bottom: 0;
  margin-top: auto;
}

.right-search input {
  padding-right: 10px;
}

.search-bar-svgs {
  color: #656679;
  display: flex;
}

.search-bar-svgs svg {
  margin-right: 16px;
}

.overlay {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  background-color: rgba(36, 39, 59, 0.8);
  opacity: 0;
  visibility: hidden;
  pointer-events: none;
  transition: 0.3s;
}
@media screen and (max-width: 1210px) {
  .overlay.active {
    z-index: 3;
    opacity: 1;
    visibility: visible;
    pointer-events: all;
  }
}

.right-side-button {
  position: absolute;
  right: 0;
  top: 0;
  height: 100%;
  border: 0;
  width: 52px;
  background-color: #1e2031;
  border-left: 1px solid #272a3a;
  color: #fff;
  display: none;
  cursor: pointer;
}
.right-side-button:before {
  content: "";
  width: 10px;
  height: 10px;
  border-radius: 50%;
  position: absolute;
  background-color: #1b86f8;
  border: 2px solid #1e2031;
  top: 13px;
  right: 12px;
}
.right-side-button svg {
  width: 22px;
}
@media screen and (max-width: 1210px) {
  .right-side-button {
    display: block;
  }
}

.left-side-button {
  display: none;
}
@media screen and (max-width: 930px) {
  .left-side-button {
    display: flex;
    flex-shrink: 0;
    align-items: center;
    justify-content: center;
    position: relative;
    cursor: pointer;
    height: 60px;
    background-color: rgba(39, 42, 58, 0.5);
    border: 0;
    padding: 0;
    line-height: 0;
    color: #fff;
    border-bottom: 1px solid #272a3a;
  }
  .left-side-button svg {
    transition: 0.2s;
    width: 24px;
  }
  .left-side-button svg:last-child {
    position: absolute;
    left: 50%;
    transform: translate(100%, -50%);
    top: 50%;
    opacity: 0;
  }
}

@media screen and (max-width: 700px) {
  .profile-avatar {
    top: -25px;
    left: 50%;
    transform: translatex(-50%);
    align-items: center;
    flex-direction: column;
    justify-content: center;
  }

  .profile-img {
    height: 100px;
    width: 100px;
  }

  .profile-name {
    margin: 5px 0;
  }

  .profile-menu {
    padding-left: 0;
    width: 100%;
    overflow: auto;
    justify-content: center;
  }

  .profile-menu-link {
    padding: 16px;
    font-size: 15px;
  }
}
@media screen and (max-width: 480px) {
  .profile-menu-link:nth-last-child(1),
.profile-menu-link:nth-last-child(2) {
    display: none;
  }
}
::-webkit-scrollbar {
  width: 10px;
  border-radius: 10px;
  background-color: #EBF2FE;
}

/* Track */
::-webkit-scrollbar-track {
  background: rgba(255, 255, 255, 0.01);
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: rgba(255, 255, 255, 0.11);
  border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: rgba(255, 255, 255, 0.1);
}

/* memberInformation Box Css  */
.memberInfo td{
	font-size:15px;
	padding:10px;
}
/* 오른쪽 사이드바 내 전문가 메뉴 */
.myExpert td{
	font-size:15px;
	padding-right:5px;
	padding-top:20px;
}

/* 오른쪽 사이드바 전문가 추천 메뉴 */
.expertRecommendation td{
	font-size:15px;
	padding-right:4px;
	padding-top:20px;
}

</style>

<!-- CDN -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<div class="container" x-data="{ rightSide: false, leftSide: false }">
  <div id="myDIV" class="left-side" :class="{'active' : leftSide}">
    <div class="left-side-button" @click="leftSide = !leftSide">
      <svg viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
      <svg stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
  <path d="M19 12H5M12 19l-7-7 7-7"/>
</svg>
    </div>
    <div class="logo">MEMBER MY PAGE</div>
    <div class="side-wrapper">
      <div class="side-title">MENU</div>
      <div class="side-menu">
         <a href="home.do">
        	Home으로 이동하기
        </a>
        <a href="memberModifyForm.me">      
     		회원정보 수정하기
        </a>
        <a href="memberDeleteForm.me">       
           	회원 탈퇴하기
        </a>
      </div>
    </div>
    <div class="side-wrapper">
    <hr><br>
      	<div class="side-title">실무 경력&nbsp;<span style="color:white;">TOP3</span>&nbsp;전문가</div>
      <div class="user">
	      <table class="myExpert" style="border:none;">
      		<tbody>
			<c:if test="${ empty topExpertMemberList }">
				<tr>
					<td colspan="3">HomeArt에 프로필을 등록한 전문가가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${ !empty topExpertMemberList }">
				<c:forEach items="${ topExpertMemberList }" var="m" varStatus="vs">
				<tr>
	      			<td width="30px">
	      			<c:if test="${ !empty m.renameFileName }">
	      				<img id="requesterImg${ vs.index }" class="user-img" src="resources/muploadFiles/${ m.renameFileName }">   		
	      			</c:if>
	      			<c:if test="${ empty m.renameFileName }">
	      				<img id="requesterImg${ vs.index }" class="user-img" src="resources/images/basicMemberPhoto.png">
	      			</c:if>
	      			</td>
	      			<td width="170px">
	      				<div id="requester${ vs.index }" class="username">${ m.name } 전문가님</div>
	      				<div id="requesterAd${ vs.index }" style="font-size:14px; color:gray;">
	      					<c:if test="${ !empty m.field }">${ m.field } |</c:if> ${ m.career }년
	      				</div>
	      			</td>
	      			<!-- <td>
	      				<button id="profileDetailBtn" type="button" class="btn btn-outline-light" style="width:83px; font-size:12px;">프로필&nbsp;
	      					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
						</button>
	      			</td>  	    -->
	      		</tr> 
      		</c:forEach>
      		<tr>
				<td colspan="4" style="font-family: 'Nanum Brush Script', cursive; font-size:24px;">풍부한 실무경험으로 무장된 다양한 분야의 전문가들을 지금바로 만나보세요!</td>
			</tr>
      		</c:if>
      		</tbody> 		
		</table>
    </div>
    </div>
  </div>
  <div class="main">
    <div class="main-container">
      <div class="profile">
        <div class="profile-avatar">
	    <% if(loginUser.getRenameFileName() != null){ %>
	      <img src="resources/muploadFiles/${ loginUser.renameFileName}" alt="" class="profile-img">
	    <% }else{ %>
	      <img src="resources/images/basicMemberPhoto.png" alt="" class="profile-img">
	    <% } %>		         
          <div class="profile-name">${loginUser.name} 회원님</div>
        </div>
        <img src="https://cdn.imweb.me/upload/S201806205b29f106af506/5b9b070d042c9.png" alt="" class="profile-cover">
        
        <div class="btn-group" role="group" aria-label="Basic example" style="background-color: #4F8CD1; height:50px; width:100%;  position:absolute; bottom:0; left:0;">
  <!-- 	<div><h5 style="margin-left:300px; margin-top:10px; font-size:25px; color:#fff; ">Your Art Our Art Home Art!</h5></div>  	   -->
		</div>
      </div>
      <div class="timeline">
        <div class="timeline-left">
          
          
          <br>
      
          <div class="album box">
            <div class="status-main">
              <% if(loginUser.getRenameFileName() != null){ %>
		         <img src="resources/muploadFiles/${ loginUser.renameFileName}" alt="" class="status-img">
		      <% }else{ %>
		         <img src="resources/images/basicMemberPhoto.png" alt="" class="status-img">
		      <% } %>
              <div class="album-detail">
                <div class="album-title">
                	<strong>${ loginUser.name }</strong>&nbsp;<span><strong>회원님의</strong></span>&nbsp;&nbsp;&nbsp;<span style="font-size: 35px; font-family: 'Nanum Brush Script', cursive;"><strong>Member Information</strong></span>
                </div>
               
              </div>           
              <button class="intro-menu"></button>
            </div>              
            <div class="album-content">
            <br>
            <table class="memberInfo">
	            <tr>
					<td><label style="color:#1771d6;">이름</label></td>
					<td>${loginUser.name }</td>
				</tr>
				<tr>
					<td><label style="color:#1771d6;">성별</label></td>
					<td>${loginUser.gender }</td>
				</tr>
				<tr>
					<td><label style="color:#1771d6;">닉네임</label></td>
					<td>${loginUser.nickName}</td>
				</tr>	
				<%	
					if(loginUser.getAddress() != null) {	
					
						String[] strArr = address.split("/");							
				%>	
				<tr>
					<td><label style="color:#1771d6;">우편번호</label></td>
					<td>		
						<%= strArr[0] %>
					</td>
				</tr>
				<tr>
					<td><label style="color:#1771d6;">주소</label></td>
					<td>
						<%= strArr[1] %>
					</td>
				</tr>
				<tr>
					<td><label style="color:#1771d6;">상세주소</label></td>
					<td>
						<%= strArr[2]%>
					</td>
				</tr>
				<% } %>
				<tr>
					<td><label style="color:#1771d6;">이메일 주소</label></td>
					<td>${loginUser.email }</td>
				</tr> 
				<tr>
					<td><label style="color:#1771d6;">휴대폰</label></td>
					<td>${loginUser.phone }</td>
				</tr> 
            </table>      	     	
            </div>
          </div>
          
          <br>
          
        </div>
      </div>
    </div>
  </div>
  <div class="right-side" :class="{ 'active': rightSide }">
    <div class="account">
<!--       <button class="account-button"> -->
<!--         <svg stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1" viewBox="0 0 24 24"> -->
<!--           <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z" /> -->
<!--           <path d="M22 6l-10 7L2 6" /> -->
<!--         </svg> -->
<!--       </button> -->
<!--       <button class="account-button"> -->
<!--         <svg stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1" viewBox="0 0 24 24"> -->
<!--           <path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9M13.73 21a2 2 0 01-3.46 0" /> -->
<!--         </svg> -->
<!--       </button> -->
	
			<h3 align="right">
				<span class="account-user">
					<c:if test="${ !empty myExpertList }">
						<span title="새로운 전문가님과 매칭되었습니다! 아래의 메뉴에서  매칭된 전문가를 확인할 수 있습니다." style="color:#e2b96c">
							<svg style="cursor: pointer" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
							  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
							</svg>&nbsp; 
						</span>
					</c:if>
					<c:if test="${ empty myExpertList }">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
						  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
						</svg>&nbsp; 
					</c:if>
					${ loginUser.name}&nbsp; <span style=" color: white; font-size: 18px; font-weight: 600;">회원님</span>
			<c:if test="${ !empty sessionScope.loginUser.renameFileName }">
			        <img src="resources/muploadFiles/${ loginUser.renameFileName}" alt="" class="account-profile"/>
			</c:if>		        
			<c:if test="${ empty sessionScope.loginUser.renameFileName }">
			        <img src="resources/images/basicMemberPhoto.png" alt="" class="account-profile"/>
			</c:if>			        
			    </span>
				 <!-- c:out 활용 -->	
				<button id="logout" class="btn btn-primary" style="font-size:13px;">로그아웃</button>
			</h3>
	
	
     
    </div>
    <div class="side-wrapper stories">
      <div class="side-title">의뢰를 수락한 전문가(${ myExpertList.size() })</div>
      <div class="user">
	      <table class="myExpert" style="border:none;">
      		<tbody>
			<c:if test="${ empty myExpertList }">
				<tr>
					<td colspan="3">내 의뢰를 맡은 전문가가 아직 없습니다. </td>
				</tr>
			</c:if>
			<c:if test="${ !empty myExpertList }">
				<c:forEach items="${ myExpertList }" var="m" varStatus="vs">
				<tr>
	      			<td>
	      			<c:if test="${ empty m.renameFileName }">
	      				<img id="requesterImg${ vs.index }" class="user-img" src="resources/images/basicMemberPhoto.png">
	      			</c:if>
	      				<c:if test="${ !empty m.renameFileName }">
	      				<img id="requesterImg${ vs.index }" class="user-img" src="resources/muploadFiles/${ m.renameFileName }">
	      			</c:if>
	      			</td>
	      			<td>
	      				<div id="requester${ vs.index }" class="username">${ m.name } 전문가님</div>
	      				<div id="requesterAd${ vs.index }" style="font-size:13px; color:gray;">${ m.field }</div>
	      			</td>
	      			<td>
	      				<input id="memberId1" type="hidden" value="${ m.id }">
	      				<input id="memberName1" type="hidden" value="${ m.name }">
	      			</td>   
	      			<td>
	      				<button name="cancel1" type="button" value="${ m.id }/${ m.name }" class="btn btn-outline-light" style="width:80px; font-size:12px;">매칭종료</button>
	      			</td>  	   
	      		</tr> 
      		</c:forEach>
      		</c:if>
      		</tbody> 		
		</table>
    </div>
	  <hr>
	  <br>
      <div class="side-title">내가 보낸 의뢰요청 보기(${ notAnswerList.size() })</div>
      <div class="user">
      	<table class="expertRecommendation" style="border:none;">
      		<tbody>
			<c:if test="${ empty notAnswerList }">
				<tr>
					<td colspan="3"> 내가 보낸 의뢰요청이 없습니다.  </td>
				</tr>
			</c:if>
			<c:if test="${ !empty notAnswerList }">
				<c:forEach items="${ notAnswerList }" var="m" varStatus="vs">
				<tr>
	      			<td>
	      			<c:if test="${ empty m.renameFileName }">
	      				<img id="requesterImg${ vs.index }" class="user-img" src="resources/images/basicMemberPhoto.png">
	      			</c:if>
	      				<c:if test="${ !empty m.renameFileName }">
	      				<img id="requesterImg${ vs.index }" class="user-img" src="resources/muploadFiles/${ m.renameFileName }">
	      			</c:if>
	      			</td>
	      			<td>
	      				<div id="requester${ vs.index }" class="username">${ m.name } 전문가님</div>
	      				<div id="requesterAd${ vs.index }" style="font-size:13px; color:gray;">${ m.field }</div>
	      			</td>
	      			<td>
	      				<input id="memberId2" type="hidden" value="${ m.id }">
	      				<input id="memberName2" type="hidden" value="${ m.name }">
	      			</td>   
	      			<td>
	      				<button name="cancel2" type="button" value="${ m.id }/${ m.name }" class="btn btn-outline-light" style="width:80px; font-size:12px;">의뢰취소</button>
	      			</td>	   
	      		</tr> 
      		</c:forEach>
      		</c:if>
      		</tbody> 
      	</table>  
      </div>   
    
  </div>
  <div class="overlay" @click="rightSide = false; leftSide = false" :class="{ 'active': rightSide || leftSide }"></div>
</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

	
	
	//로그아웃
	$('#logout').click(function(){
		if(confirm("정말로 로그아웃 하시겠습니까?")) {
			location.href='logout.me';
		} 
	});
	
	// 실무 경력 TOP3전문가 프로필 보기
	
	/* 
	     프로필 버튼의 value로 지정한 expertId를 받아와서 컨트롤러로 보내고 컨트롤러에서 expertId로 프로필넘버 조회해서 프로필 넘버 다시
	     에이잭스로 받아와서 해당 프로필로 게시글로 넘어가도 될거 같구 아니면 셀마다 <form>으로 감싸주고 name지정해서 넘겨준다음에 화면으로 
	     뿌려줘도 될거 같음
	*/
	
	// 나와 매칭된 전문가와 매칭취소
	$('button[name=cancel1]').click(function(){
		
		if(confirm("정말로 전문가님과의 매칭을 종료 하시겠습니까?(종료한 매칭은 다시 되돌릴 수 없습니다.)")){
		
			var memberIdName = $(this).val();
			
			var arr = memberIdName.split('/');
			
			console.log(arr);
			
			var memberId = arr[0];
			var memberName = arr[1];
			
			console.log(memberId);
			console.log(memberName);
	
			$.ajax({
				url: 'matchCancelM.me',
				type: 'post',
				data: {requesterId:memberId}, 
				success: function(data){
					if(data == "success"){
						alert(memberName + ' 전문가님과의 매칭을 종료 했습니다.');
						location.reload();
					} else if( data == "fail"){
						alert('매칭을 종료할 수 없습니다.');
					}
				},
				error: function(data){
					alert("통신실패");
					console.log(data);
				}	
			});
		}
	});
	
	// 내가 보낸 의뢰요청에 응답 없는 전문가한테 의뢰취소 하기  
	$('button[name=cancel2]').click(function(){
		
		if(confirm("정말로 전문가님에게 보낸 의뢰요청을 취소하시겠습니까?(의뢰를 취소하시면 다시 되돌릴 수 없습니다.)")){
		
			var memberIdName = $(this).val();
			
			var arr = memberIdName.split('/');
			
			console.log(arr);
			
			var memberId = arr[0];
			var memberName = arr[1];
			
			console.log(memberId);
			console.log(memberName);
	
			$.ajax({
				url: 'requestCancelM.me',
				type: 'post',
				data: {requesterId:memberId}, 
				success: function(data){
					if(data == "success"){
						alert(memberName + ' 전문가님에게 보낸 의뢰요청을 취소하였습니다.');
						location.reload();
					} else if( data == "fail"){
						alert('의뢰요청을 취소할 수 없습니다.');
					}
				},
				error: function(data){
					alert("통신실패");
					console.log(data);
				}	
			});
		}
	});

	
</script>
</body>
</html>