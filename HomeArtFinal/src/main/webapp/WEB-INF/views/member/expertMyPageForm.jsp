<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	
<%@ page import="com.kh.homeArt.member.model.vo.Member" %>
<%@ page import="org.json.JSONArray" %>

<% 
	Member loginUser = (Member)session.getAttribute("loginUser");  
	String address = loginUser.getAddress();
	String workingTime = loginUser.getWorkingTime();
	
// 	JSONArray jArr = (JSONArray)session.getAttribute("jArr");
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

.left-side { /* 왼쪽 사이드바 */
  width: 360px;
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

.right-side { /* 오른쪽 사이드바 */
  width: 350px;
  flex-shrink: 0;
  margin-left: auto;
  padding-right: 15px;
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

.logo { /*Ã¬ÂÂ¼Ã¬ÂªÂ½ Ã¬ÂÂÃ«ÂÂ¨*/
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

.side-wrapper {/*Ã¬Â¢ÂÃ¬ÂÂ°Ã¬ÂÂÃ¬ÂªÂ½Ã¬Â°Â½css*/
  padding: 30px;
  color: white;
   /*ÃªÂµÂ¬ÃªÂ¸Â Ã¬ÂÂ¹Ã­ÂÂ°Ã­ÂÂ¸*/
}

.side-menu {
  display: flex;
  flex-direction: column;
  font-size: 15px;
  white-space: nowrap;
  
}

.side-menu a {
  text-decoration: none;
  color: white; /*Ã¬ÂÂ¼Ã¬ÂªÂ½ Ã«Â©ÂÃ«ÂÂ´Ã«Â°Â*/
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
  background-color: #EBF2FE; /*Ã¬ÂÂÃ¬Â¹ÂÃ«Â°Â*/
  z-index: 3;
  position: relative;
}
.search-bar input {/*Ã¬ÂÂÃ¬Â¹ÂÃ«Â°Â(ÃªÂ²ÂÃ¬ÂÂ)*/
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
  font-family: 'Noto Sans KR', sans-serif;
  font-weight: 600;
}
.search-bar input::placeholder {
  color: gray; /*Ã¬ÂÂÃ¬Â¹ÂÃ«Â°Â Ã­ÂÂÃ«Â ÂÃ¬ÂÂ´Ã¬ÂÂ¤Ã­ÂÂÃ«ÂÂ Ã¬ÂÂÃªÂ¹Â*/
}

.main-container {
  padding: 20px;
  flex-grow: 1;
  overflow: auto;
  background-color: white; /*Ã«Â©ÂÃ¬ÂÂ¸ Ã«Â°Â±ÃªÂ·Â¸Ã«ÂÂ¼Ã¬ÂÂ´Ã«ÂÂ Ã¬Â»Â¬Ã«ÂÂ¬*/
  
}

.profile {
  position: relative;
  height: 40vh;
  min-height: 250px;
  max-height: 350px;
  /*   z-index: 1;  그림자 효과 */
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

/*  프로필 사진 옆 이름 */
.profile-name {
  margin-left: 24px;
  margin-bottom: 24px;
  font-size: 22px;
  color: #fff;
  font-weight: 600;
  font-family: 'Noto Sans KR', sans-serif;
  text-shadow: -1px 0px black, 0px 1px black, 1px 0px black, 0px -1px black; /*ÃªÂ¸ÂÃ¬ÂÂ¨ Ã­ÂÂÃ«ÂÂÃ«Â¦Â¬*/
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

/* 메인 box  */
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

.user-rank{
  border-radius: 50%;
  width: 45px;
  height: 45px;
  margin-right: 15px;
  object-fit: cover;
  object-position: center;
  border: 2px solid #0D6EFD;
  background-color:#4F8CD1;
  color: #EBF2FE;
  box-shadow: 2px 3px grey;
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
  padding: 0 20px;
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

.account { /*Ã¬ÂÂ¤Ã«Â¥Â¸Ã¬ÂªÂ½ Ã¬ÂÂÃ«ÂÂ¨ ÃªÂ³ÂÃ¬Â Â*/
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
  font-family: 'Noto Sans KR', sans-serif;
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

/* MemberInfo 테이블 셀 css  */
.memberInfo td{
	font-size:15px;
	padding:10px;
}
/* 내 전문가 테이블 셀 css */
.myExpert td{
	font-size:15px;
	padding-right:5px;
	padding-top:20px;
}

/* 내가 받은 의뢰 요청 테이블*/
.requestStatus td{
	font-size:15px;
	padding-right:4px;
	padding-top:20px;
}

.expertInfo td{
	padding:10px;
}

</style>

<!-- ÃªÂµÂ¬ÃªÂ¸Â Ã¬ÂÂ¹ Ã­ÂÂ°Ã­ÂÂ¸ -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<div class="container" x-data="{ rightSide: false, leftSide: false }">
  <div class="left-side" :class="{'active' : leftSide}">
    <div class="left-side-button" @click="leftSide = !leftSide">
      <svg viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
      <svg stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
  <path d="M19 12H5M12 19l-7-7 7-7"/>
</svg>
    </div>
    <div class="logo">EXPERT MY PAGE</div>
    <div class="side-wrapper">
      <div class="side-title">MENU</div>
      <div class="side-menu">
        <a href="home.do">
        	Home으로 이동하기
        </a>
        <input type="hidden" value="${ expertProfile.expertProfileNo }">
        <a href="edetail.ex?eId="${ expertProfile.expertProfileNo }>  <!--    현재 로그인한 전문가 유저의 expertId로 전물가 프로필 레코드 조회하고 거기서 전문가 프로필 번호 받아와서 파라미터로 넘겨서 자신이 작성한 전문가 프로필로 넘어가게 해야함 -->     
           	내 프로필 보기
        </a>
        <a href="expertModifyForm.me">      
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
	      			<td width="160px">
	      				<div id="requester${ vs.index }" class="username">${ m.name } 전문가님</div>
	      				<div id="requesterAd${ vs.index }" style="font-size:14px; color:gray;">
	      					<c:if test="${ !empty m.field }">${ m.field } |</c:if> ${ m.career }년
	      				</div>
	      			</td>
	      			<td>
	      				<input id="memberId1" type="hidden" value="${ m.id }">
	      				<input id="memberName1" type="hidden" value="${ m.name }">
	      			</td>   
	      			<td>
<%-- 	      				<button name="cancel1" type="button" value="${ m.id }/${ m.name }" class="btn btn-outline-light" style="width:60px; font-size:12px;">프로필</button> --%>
	      				<button type="button" class="user-rank" >${vs.count}위</button>
	      			</td>  	   
	      		</tr> 
      		</c:forEach>
      		<tr>
				<td id="myRankCheck" colspan="4" style="font-family: 'Nanum Brush Script', cursive; font-size:24px;">내 순위를 실시간으로 확인하세요!<svg width="25" height="35" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-index-thumb" viewBox="0 0 16 16">
				  <path d="M6.75 1a.75.75 0 0 1 .75.75V8a.5.5 0 0 0 1 0V5.467l.086-.004c.317-.012.637-.008.816.027.134.027.294.096.448.182.077.042.15.147.15.314V8a.5.5 0 0 0 1 0V6.435l.106-.01c.316-.024.584-.01.708.04.118.046.3.207.486.43.081.096.15.19.2.259V8.5a.5.5 0 1 0 1 0v-1h.342a1 1 0 0 1 .995 1.1l-.271 2.715a2.5 2.5 0 0 1-.317.991l-1.395 2.442a.5.5 0 0 1-.434.252H6.118a.5.5 0 0 1-.447-.276l-1.232-2.465-2.512-4.185a.517.517 0 0 1 .809-.631l2.41 2.41A.5.5 0 0 0 6 9.5V1.75A.75.75 0 0 1 6.75 1zM8.5 4.466V1.75a1.75 1.75 0 1 0-3.5 0v6.543L3.443 6.736A1.517 1.517 0 0 0 1.07 8.588l2.491 4.153 1.215 2.43A1.5 1.5 0 0 0 6.118 16h6.302a1.5 1.5 0 0 0 1.302-.756l1.395-2.441a3.5 3.5 0 0 0 .444-1.389l.271-2.715a2 2 0 0 0-1.99-2.199h-.581a5.114 5.114 0 0 0-.195-.248c-.191-.229-.51-.568-.88-.716-.364-.146-.846-.132-1.158-.108l-.132.012a1.26 1.26 0 0 0-.56-.642 2.632 2.632 0 0 0-.738-.288c-.31-.062-.739-.058-1.05-.046l-.048.002zm2.094 2.025z"/></svg>
				</td>
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
        
          <div class="profile-name">${ loginUser.name} 전문가님</div>
        </div>
        <img src="https://cdn.imweb.me/upload/S201806205b29f106af506/5b9b070d042c9.png" alt="" class="profile-cover">
        
        <div class="btn-group" role="group" aria-label="Basic example" style="background-color: #4F8CD1; height:50px; width:100%;  position: absolute; bottom:0; left:0;">
<!-- 		  	<h5 style="margin-left:300px; margin-top:10px; font-size:25px; color:#fff; ">Your Art Our Art Home Art!</h5>  -->
		  
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
                
                	<strong>${ loginUser.name}</strong>&nbsp;<span><strong>전문가님의</strong></span>&nbsp;&nbsp;&nbsp;<span style="font-size: 35px; font-family: 'Nanum Brush Script', cursive;"><strong>Expert Information</strong></span>
                </div>
<!--                 <div class="album-date">2022-06-19</div>       -->
              </div>           
              <button class="intro-menu"></button>
            </div>              
            <div class="album-content">
            
            <br>
            
            <table class="expertInfo">
	            <tr>
					<td><label style="color:#1771d6;">이름</label></td>
					<td>${ loginUser.name}</td>
				</tr>
				<tr>
					<td><label style="color:#1771d6;">성별</label></td>
					<td>${loginUser.gender }</td>
				</tr>
				<tr>
					<td><label style="color:#1771d6;">닉네임</label></td>
					<td>${ loginUser.nickName }</td>
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
				<%
					if(loginUser.getField() != null) {
				%>
				<tr>
					<td><label style="color:#1771d6;">전문분야</label></td>
					<td>${ loginUser.field }</td>
				</tr>
				<% } %>
				<c:if test="${ !empty loginUser.career }">
				<tr>
					<td><label style="color:#1771d6;">경력</label></td>
					<td>${ loginUser.career }년</td>
				</tr>
				</c:if>	
				<%
					if(loginUser.getWorkingDay() != null) {
				%>	
				<tr>
					<td><label style="color:#1771d6;">근무요일</label></td>
					<td>${ loginUser.workingDay }</td>
				</tr> 
				<% } %>
				<%
					if(loginUser.getWorkingTime() != null) {	
					String[] strArr = workingTime.split("~");					
				%>	
				<tr>
					<td><label style="color:#1771d6;">연락 가능시간</label></td>
					<td>AM<%= strArr[0] %> ~ PM<%= strArr[1].trim() %></td>
				</tr> 
				<% } %>			
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
			<c:if test="${ !empty requesterList }">
			<span title="새로운 의뢰요청이 들어왔습니다. 아래의 메뉴에서 수락해주세요!" style="color:#e2b96c;">
				<svg style="cursor: pointer" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
				  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
				</svg>&nbsp; 
			</span>
			</c:if>
			<c:if test="${ empty requesterList }">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
				  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
				</svg>&nbsp; 		
			</c:if>
				${ loginUser.name}&nbsp; 
				<span style=" color: white; font-size: 18px; font-weight: 600;">전문가님</span>
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
    
     <div id="side-wrapper stories" class="side-wrapper stories">
      <div id="acceptRequest" class="side-title">나와 매칭된 회원(${ myCustomerList.size() })</div>
      <div class="user">
	      <table class="myExpert" style="border:none;">
      		<tbody>
			<c:if test="${ empty myCustomerList }">
				<tr>
					<td colspan="3">내 고객이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${ !empty myCustomerList }">
				<c:forEach items="${ myCustomerList }" var="m" varStatus="vs">
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
	      				<div id="requester${ vs.index }" class="username">${ m.name } 회원님</div>
	      				<div id="requesterAd${ vs.index }" style="font-size:13px; color:gray;">${ m.address }</div>
	      			</td>
	      			<td>
	      				<input id="memberId1" type="hidden" value="${ m.id }">
	      				<input id="memberName1" type="hidden" value="${ m.name }">
	      			</td>   
	      			<td>
	      				<button name="cancel" value="${ m.id }/${ m.name }" type="button" class="btn btn-outline-light" style="width:67px; font-size:11px;">매칭종료</button>
	      			</td>  	   
	      		</tr> 
      		</c:forEach>
      		</c:if>
      		</tbody>
		</table>
    </div>
    <br>
   	<hr>
   	<br>
      <div id="acceptRequest" class="side-title">내가 받은 의뢰 요청(${ requesterList.size() })
      </div>
      <div class="user">
      	<table id="requestStatus" class="requestStatus" style="border:none;">
      		<tbody>
			<c:if test="${ empty requesterList }">
				<tr>
					<td colspan="3">나에게 의뢰를 요청한 회원이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${ !empty requesterList }">
				<c:forEach items="${ requesterList }" var="m" varStatus="vs">
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
	      				<div id="requester${ vs.index }" class="username">${ m.name } 회원님</div>
	      				<div id="requesterAd${ vs.index }" style="font-size:13px; color:gray;">${ m.address }</div>
	      			</td>	      			
	      			<td>
	      				<button name="allow" value="${m.id}/${m.name}" type="button" class="btn btn-outline-light" style="width:47px; font-size:11px;">수락</button>
	      			</td>
	      			<td>
	      				<button name="reject" value="${m.id}/${m.name}" type="button" class="btn btn-outline-light" style="width:47px; font-size:11px;">거절</button>
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

	// 로그아웃 
	$('#logout').click(function(){
		if(confirm("정말로 로그아웃 하시겠습니까?")) {
			location.href='logout.me';
		} 
	});	
	
	//내 전문가 순위 확인하기(경력기준)
	$('#myRankCheck').click(function(){
		
		$.ajax({
			url: 'myRankCheck.me',
			type: 'post', 
			success: function(data){
				console.log(data);
				
				if(data == "0") {
					alert('회원가입시 전문가 추가정보(경력)를 입력하지 않아 순위를 확인할 수 없습니다. 회원정보 수정하기를 눌러 전문가 추가 정보를 입력해주세요!');
				} else {
					alert('전문가님의 현재 순위는 ' + data + ' 위 입니다. ');
				}
				
			},
			error: function(data){
				alert("통신실패");
				console.log(data);
			}	
		});
		
	});
	
	//내가 받은 의뢰요청 수락하기 
	$('button[name=allow]').click(function(){
		
		var memberIdName = $(this).val();
		
		var arr = memberIdName.split('/');
		
		console.log(arr);
		
		var memberId = arr[0];
		var memberName = arr[1];
		
		console.log(memberId);
		console.log(memberName);

		$.ajax({
			url: 'requestAllow.me',
			type: 'post',
			data: {requesterId:memberId}, 
			success: function(data){
				if(data == "success"){
					alert(memberName + ' 회원님의 의뢰요청을 수락했습니다.');
					location.reload();
				} else if( data == "fail"){
					alert('의뢰요청을 수락할 수 없습니다.');
				}
			},
			error: function(data){
				alert("통신실패");
				console.log(data);
			}	
		});
	});
	
	
	// 내가 받은 의뢰요청 거절하기 
	$('button[name=reject]').click(function(){
		
		if(confirm("정말로 전문님에게 온 의뢰를 거절 하시겠습니까?(의뢰를 취소하시면 다시 되돌릴 수 없습니다.)")){
		
			var memberIdName = $(this).val();
			
			var arr = memberIdName.split('/');
			
			console.log(arr);
			
			var memberId = arr[0];
			var memberName = arr[1];
			
			console.log(memberId);
			console.log(memberName);
		
			$.ajax({
				url: 'requestReject.me',
				type: 'post',
				data: {requesterId:memberId}, 
				success: function(data){
					if(data == "success"){
						alert(memberName + ' 회원님의 의뢰요청을 거절했습니다.');
						location.reload();
					} else if( data == "fail"){
						alert('의뢰요청을 거절할 수 없습니다.');
					}
				},
				error: function(data){
					alert("통신실패");
					console.log(data);
				}	
			});
		}
	});
	
	// 내 회원과 매칭끊기 
	$('button[name=cancel]').click(function(){
		
		if(confirm("정말로 회원님과의 매칭을 종료 하시겠습니까?(종료한 매칭은 다시 되돌릴 수 없습니다.)")){
			var memberIdName = $(this).val();
			
			var arr = memberIdName.split('/');
			
			console.log(arr);
			
			var memberId = arr[0];
			var memberName = arr[1];
			
			console.log(memberId);
			console.log(memberName);

			$.ajax({
				url: 'matchCancelE.me',
				type: 'post',
				data: {requesterId:memberId}, 
				success: function(data){
					if(data == "success"){
						alert(memberName + ' 회원과의 매칭을 종료 했습니다.');
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
	
</script>	

</body>
</html>