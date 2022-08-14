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
	
	<!-- 큰 틀(container) -->
	{}
	*, :after, :before {
	    box-sizing: border-box;
	}
	* {
	    word-break: break-word;
	}
	.container {
	    width: 100%;
	    padding-right: 0.9375rem;
	    padding-left: 0.9375rem;
	    margin-right: auto;
	    margin-left: auto;
	}
	@media (min-width: 576px)
	.container {
	    max-width: 33.75rem;
	}
	@media (min-width: 768px)
	.container {
	    max-width: 45rem;
	}
	@media (min-width: 992px)
	.container {
	    max-width: 60rem;
	}
	@media (min-width: 1200px)
	.container {
	    max-width: 62.5rem;
	}
	@media (min-width: 576px)
	.container, .container-sm {
	    max-width: 33.75rem;
	}
	@media (min-width: 768px)
	.container, .container-md, .container-sm {
	    max-width: 45rem;
	}
	@media (min-width: 992px)
	.container, .container-lg, .container-md, .container-sm {
	    max-width: 60rem;
	}
	@media (min-width: 1200px)
	.container, .container-lg, .container-md, .container-sm, .container-xl {
	    max-width: 62.5rem;
	}
	.container[data-v-03b0e98c] {
	    background-color: #fff;
	    max-width: 73.125rem;
	    padding: 0;
	    padding-top: 5rem;
	    padding-bottom: 5rem;
	}
	
	<!-- 작은 틀(row no-gutters) -->
	{}
	.row {
	    display: flex;
	    flex-wrap: wrap;
	    margin-right: -0.9375rem;
	    margin-left: -0.9375rem;
	}
	.no-gutters {
	    margin-right: 0;
	    margin-left: 0;
	}
	.container>.row[data-v-03b0e98c] {
	    padding: 0 6.25rem;
	}
	
	<!-- profile-section -->
	{}
	.col, .col-1, .col-2, .col-3, .col-4, .col-5, .col-6, .col-7, .col-8, .col-9, .col-10, .col-11, .col-12, .col-auto, .col-lg, .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-auto, .col-md, .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12, .col-md-auto, .col-sm, .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-auto, .col-xl, .col-xl-1, .col-xl-2, .col-xl-3, .col-xl-4, .col-xl-5, .col-xl-6, .col-xl-7, .col-xl-8, .col-xl-9, .col-xl-10, .col-xl-11, .col-xl-12, .col-xl-auto, .modal .modal-footer .btn {
	    position: relative;
	    width: 100%;
	    padding-right: 0.9375rem;
	    padding-left: 0.9375rem;
	}
	.col-12 {
	    flex: 0 0 100%;
	    max-width: 100%;
	}
	@media (min-width: 992px)
	.col-lg-auto {
	    flex: 0 0 auto;
	    width: auto;
	    max-width: 100%;
	}
	.modal .modal-footer .no-gutters>.btn, .no-gutters>.col, .no-gutters>[class*=col-] {
	    padding-right: 0;
	    padding-left: 0;
	}
	.profile-section[data-v-03b0e98c] {
	    width: 1130px;
	    flex: 1 1 auto;
	}
	
	<!-- profile-body -->
	{}
	@media (max-width: 991.98px)
	.profile-body[data-v-448a6b87] {
	    width: 100%;
	}
	
	<!-- thumb -->
	{}
	.profile-overview .thumb[data-v-0bae2f69] {
/* 	    position: absolute; */
		margin-bottom: 2rem;
	    top: -9.5rem;
	}
	
	<!-- user-profile-picture -->
	{}
	.user-profile-picture[data-v-231f963c] {
	    position: relative;
	}
	.profile-overview .thumb[data-v-0bae2f69] .user-profile-picture {
	    width: 7.5rem;
	    height: 7.5rem;
	    border-radius: 18px;
	    overflow: hidden;
	}
	
	<!-- is-square -->
	{}
	.user-profile-picture div[data-name=image][data-v-231f963c] {
	    position: relative;
	    width: 100%;
	    height: 100%;
	    border-radius: 50%;
	    border: 0.0625rem solid #f2f2f2;
	    overflow: hidden;
	    background-size: cover;
	    background-position: 50% 50%;
	    background-color: #e1e1e1;
	}
	.user-profile-picture div[data-name=image].is-square[data-v-231f963c] {
	    border-radius: 0.75rem;
	    padding: 0;
	    height: 100%;
	}
	.profile-overview .thumb[data-v-0bae2f69] .user-profile-picture .is-square {
	    border-radius: 18px;
	}
	
	<!-- 제목, 한줄소개(profile-overview) -->
	{}
	.profile-overview[data-v-0bae2f69] {
	    width: 100%;
	    padding-bottom: 2rem;
	    position: relative;
	}
	@media (min-width: 992px)
	.profile-overview[data-v-0bae2f69] {
	    padding-bottom: 3rem;
	}
	
	<!-- background- block -->
	{}
	.profile-body .background-block[data-v-6fd40724] {
	    display: none;
	}
	
	<!-- 내정보(info) -->
	{}
	.profile-overview .info[data-v-0bae2f69] {
	    flex: 1;
	    overflow: hidden;
	}
	
	<!-- 내정보 제목(info-section-header) -->
	{}
	.profile-overview .info .info-section-header[data-v-0bae2f69] {
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    width: 100%;
	}
	
	<!-- 내정보 제목(nickname) -->
	{}
	.h1, h1 {
	    font-size: 2.5rem;
	    line-height: 3.75rem;
	    letter-spacing: -.04375rem;
	}
	.h1, .h2, h1, h2 {
	    font-weight: 400;
	}
	h1, h2, h3, h4, h5, h6 {
	    margin-top: 0;
	    margin-bottom: 0.5rem;
	}
	.profile-overview .info .info-section-header .nickname[data-v-0bae2f69] {
	    width: 75%;
	    font-size: 1.5rem;
	    font-weight: 700;
	    line-height: 1.8125rem;
	    margin-bottom: 0;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	
	<!-- 다운로드버튼 -->
	{}
	button, input {
	    overflow: visible;
	}
	button, input {
	    overflow: visible;
	}
	button, select {
	    text-transform: none;
	}
	[type=button], [type=reset], [type=submit], button {
	    -webkit-appearance: button;
	}
	.btn {
	    display: inline-block;
	    font-weight: 400;
	    color: #323232;
	    text-align: center;
	    vertical-align: middle;
	    cursor: pointer;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	    background-color: transparent;
	    border: 0.0625rem solid transparent;
	    padding: 0.6875rem 0.75rem;
	    font-size: 1rem;
	    line-height: 1.5;
	    border-radius: 0.25rem;
	    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	}
	.btn {
	    font-weight: 500;
	    transition: opacity .2s ease-in-out;
	}
	[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
	    cursor: pointer;
	}
	.profile-overview .info .info-section-header .share-button[data-v-0bae2f69] {
	    background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMCAwaDI0djI0SDB6Ii8+PHBhdGggZD0iTTQuMDggMTUuNlYyMWgxNS44NHYtNS40TTYuMjQgOC41NzVMMTIgM2w1Ljc2IDUuNTc1TTEyIDE1LjZWMy4wMDIiIHN0cm9rZT0iIzMyMzIzMiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNSIvPjwvZz48L3N2Zz4=) no-repeat 50%/contain;
	}
	
	<!-- 카테고리, 지역(info-section-sub-header) -->
	{}
	.profile-overview .info .info-section-sub-header[data-v-0bae2f69] {
	    display: flex;
	    align-items: center;
	    margin-top: 0.75rem;
	}
	
	<!-- category -->
	{}
	.profile-overview .info .info-section-sub-header .category[data-v-0bae2f69] {
	    font-size: 1rem;
	    line-height: 1.5rem;
	    display: inline;
	    margin-right: 0.5rem;
	    color: #323232;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	<!-- 지역 -->
	{}
	.profile-overview .info .info-section-sub-header .address[data-v-0bae2f69]:after {
	    content: "";
	    width: 1.25rem;
	    height: 1.25rem;
	    position: absolute;
	    left: 0.0625rem;
	    top: 0.125rem;
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMCAyMGgyMFYwSDB6Ii8+PGcgc3Ryb2tlPSIjNzM3MzczIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMiI+PHBhdGggZD0iTTE2LjIxOCA3LjI3NGMwIDQuOTQzLTUuODMzIDEwLjIyNi01LjgzMyAxMC4yMjZTNC41NSAxMi41NDIgNC41NSA3LjI3NGMwLTMuMDk3IDIuNjEyLTUuNjA3IDUuODM0LTUuNjA3IDMuMjIxIDAgNS44MzMgMi41MSA1LjgzMyA1LjYwN3oiLz48cGF0aCBkPSJNMTIuNjI4IDcuOTE3YTIuMDg0IDIuMDg0IDAgMTEtNC4xNjctLjAwMSAyLjA4NCAyLjA4NCAwIDAxNC4xNjcgMHoiLz48L2c+PC9nPjwvc3ZnPg==);
	}
	.profile-overview .info .info-section-sub-header .address[data-v-0bae2f69] {
	    position: relative;
	    line-height: 1.5;
	    letter-spacing: -.01875rem;
	    color: #737373;
	    font-size: .875rem;
	    display: inline;
	    padding-left: 1.4375rem;
	}
	<!-- 한줄 소개 -->
	{}
	.profile-overview .info .introduce[data-v-0bae2f69] {
	    width: 37.5rem;
	    color: #737373;
	    font-size: 1rem;
/* 	    margin-top: 1.25rem; */
	}
	
	<!-- detail-info.badges -->
	{}
	img {
	    border-style: none;
	}
	img, svg {
	    vertical-align: middle;
	}
	.profile-overview .info .badges .badge-item[data-v-0bae2f69] {
	    word-break: keep-all;
	    display: inline-flex;
	    padding: 0.125rem 0.375rem;
	    background-color: #ecfaf1;
	    border-radius: 4px;
	    font-weight: 500;
	    font-size: .75rem;
	    color: #323232;
	}
	.profile-overview .info .badges[data-v-0bae2f69] {
	    display: flex;
	    flex-wrap: wrap;
	    gap: 0.25rem;
	    margin-top: 1.625rem;
	}
	
	<!-- statistics-info -->
	{}
	.profile-overview .info .statistics-info[data-v-0bae2f69] {
	    border-radius: 8px;
	    display: flex;
	    background-color: #fafafa;
	    height: 5.5rem;
	    margin-top: 1.625rem;
	}
	
	<!-- 고용 -->
	{}
	.profile-overview .info .statistics-info .statistics-info-item .statistics-info-item-contents[data-v-0bae2f69] {
	    font-size: 1.25rem;
	    font-weight: 700;
	    display: flex;
	    align-items: center;
	}
	.profile-overview .info .statistics-info .statistics-info-item .statistics-info-item-header[data-v-0bae2f69] {
	    font-size: .875rem;
	    display: flex;
	    align-items: center;
	}
	.profile-overview .info .statistics-info .statistics-info-item[data-v-0bae2f69] {
	    height: 100%;
	    width: 100%;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    flex-direction: column;
	    color: #323232;
	}
	
	<!-- 전문가 정보, 사진, 동영상 -->
	{}
	address, dl, ol, ul {
	    margin-bottom: 1rem;
	}
	dl, ol, ul {
	    margin-top: 0;
	}
	ul {
	    padding: 0;
	}
	.sticky-nav[data-v-79a77614] {
	    margin: 0 -1.25rem;
	    padding: 0 0 0 1.25rem;
	    font-size: .75rem;
	    position: -webkit-sticky;
	    position: sticky;
	    top: 4.5rem;
	    background-color: #fff;
	    z-index: 2;
	    border-bottom: 0.0625rem solid #f2f2f2;
	    display: block;
	}
	
	<!-- 전문가 정보 -->
	{}
	ul li {
	    list-style: none;
	}
	.sticky-nav>li[data-v-79a77614] {
	    cursor: pointer;
	    display: inline-block;
	    padding: 0.75rem 0;
	    font-size: 1rem;
	    font-weight: 400;
	    color: #737373;
	}
	.sticky-nav .active[data-v-79a77614] {
	    border-bottom: 0.125rem solid #323232;
	    font-weight: 700;
	    color: #323232;
	}
	
	<!-- 사진, 동영상 -->
	{}
	.sticky-nav>li+li[data-v-79a77614] {
	    margin-left: 1.25rem;
	}
	
	<!-- about -->
	{}
	article, aside, figcaption, figure, footer, header, hgroup, main, nav, section {
	    display: block;
	}
	<!-- profile-provider-info -->
	.profile-body section>div[data-v-6fd40724] {
	    width: 100%;
	    margin-top: 3.75rem;
	}
	.profile-body section:first-child>div[data-v-6fd40724]:first-child {
	    margin-top: 2.5rem;
	}
	
	<!-- 전문가 정보 -->
	{}
	.profile-provider-info>ul[data-v-b1726300] {
	    margin-bottom: 0;
	}
	<!-- 직원 수 -->
	{}
	.profile-provider-info>ul>li[data-v-b1726300]:before {
	    content: "";
	    width: 1.25rem;
	    height: 1.25rem;
	    position: absolute;
	    left: 0;
	    top: 0.125rem;
	}
	.profile-provider-info>ul>li.business-size[data-v-b1726300]:before {
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMCAyMGgyMFYwSDB6Ii8+PHBhdGggZD0iTTIuMzY3IDE2LjQ5M3YtLjg0YTQuMjE3IDQuMjE3IDAgMDE0LjIxNy00LjIxN2gyLjk0NGE0LjIxNyA0LjIxNyAwIDAxNC4yMTcgNC4yMTd2Ljg0bS0zLjE2LTEwLjI5NWEyLjUyOSAyLjUyOSAwIDExLTUuMDU4LS4wMDEgMi41MjkgMi41MjkgMCAwMTUuMDU4IDB6bTcuOTM1IDguNzU5di0uNTg0YTIuOTM4IDIuOTM4IDAgMDAtMi45MzYtMi45MzhoLTEuMDI2bTEuNzE2LTQuNDdhMS43NjEgMS43NjEgMCAxMS0zLjUyMiAwIDEuNzYxIDEuNzYxIDAgMDEzLjUyMiAweiIgc3Ryb2tlPSIjNzM3MzczIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIvPjwvZz48L3N2Zz4=);
	}
	.profile-provider-info>ul>li[data-v-b1726300] {
	    position: relative;
	    line-height: 1.5rem;
	    letter-spacing: -.01875rem;
	    color: #737373;
	    text-indent: 1.875rem;
	    margin-bottom: 0.75rem;
	    font-size: 1rem;
	}
	<!-- 연락가능 시간 -->
	{}
	.profile-provider-info>ul>li.active-time[data-v-b1726300]:before {
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMCAyMGgyMFYwSDB6Ii8+PGcgc3Ryb2tlPSIjNzM3MzczIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMiI+PHBhdGggZD0iTTE3LjkxNyAxMC4wOTZhNy41IDcuNSAwIDAxLTcuNSA3LjUgNy41IDcuNSAwIDAxLTcuNS03LjUgNy41IDcuNSAwIDAxNy41LTcuNSA3LjUgNy41IDAgMDE3LjUgNy41eiIvPjxwYXRoIGQ9Ik05LjU2NCA2LjEwM3Y0Ljg0NmgzLjQ2MSIvPjwvZz48L2c+PC9zdmc+);
	}
	<!-- 계산 -->
	{}
	.profile-provider-info>ul>li.payment[data-v-b1726300]:before {
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjAiIGhlaWdodD0iMjAiPjxkZWZzPjxwYXRoIGlkPSJhIiBkPSJNMCAyMGgyMFYwSDB6Ii8+PC9kZWZzPjxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+PG1hc2sgaWQ9ImIiIGZpbGw9IiNmZmYiPjx1c2UgeGxpbms6aHJlZj0iI2EiLz48L21hc2s+PGcgc3Ryb2tlPSIjNzM3MzczIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgbWFzaz0idXJsKCNiKSI+PHBhdGggZD0iTTEwLjgzMyAxMS45MjNoMy44NDZNMi41IDguNzE4aDE1TTIuNSAxNWgxNVY1aC0xNXoiLz48L2c+PC9nPjwvc3ZnPg==);
	}
	
	<!-- 상세정보(profile-service-desc collapsed) -->
	{}
	.profile-body section>div[data-v-6fd40724] {
	    width: 100%;
	    margin-top: 3.75rem;
	}
	
	<!-- 상세설명-제목(h2) -->
	{}
	.profile-body section>div[data-v-6fd40724] h2 {
	    font-size: 1.25rem;
	    font-weight: 700;
	    line-height: 1.5;
	    letter-spacing: -.03125rem;
	    margin-bottom: 1rem;
	    color: #323232;
	}
	
	<!-- 상세설명-내용(description) -->
	{}
	.profile-service-desc .description[data-v-0b7cd573] {
	    position: relative;
	    font-size: 1rem;
	    color: #737373;
	    letter-spacing: -.0125rem;
	    line-height: 1.5rem;
	    white-space: pre-line;
	}
	.profile-service-desc.collapsed .description[data-v-0b7cd573] {
	    overflow: hidden;
/* 	    max-height: 25rem; */
	}
	
	<!-- 상세설명-내용 하단(gradient show) -->
	{}
	.profile-service-desc .description .gradient[data-v-0b7cd573] {
	    display: none;
	}
	.profile-service-desc .description .gradient.show[data-v-0b7cd573] {
	    display: block;
	    position: absolute;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    height: 3.125rem;
	    background-image: linear-gradient(180deg,hsla(0,0%,100%,0),hsla(0,0%,100%,.9) 70%,#fff 99%);
	}
	
	<!-- 상세설명 더보기(profile-more-button) -->
	{}
	/* .profile-more-button .more[data-v-0b4042da]:after { */
	/*     width: 1.125rem; */
	/*     height: 1.125rem; */
	/*     margin-left: 0.25rem; */
	/*     background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMCAxOGgxOFYwSDB6Ii8+PHBhdGggc3Ryb2tlPSIjMDBDN0FFIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTE0LjQzNCAxMi4xNTFsLTUuNC01LjQtNS40IDUuNCIvPjwvZz48L3N2Zz4=); */
	/*     display: inline-block; */
	/*     content: ""; */
	/* } */
	/* .profile-more-button .more.collapse[data-v-0b4042da]:after { */
	/*     background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTkiIGhlaWdodD0iMTgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNLjUgMThoMThWMEguNXoiLz48cGF0aCBzdHJva2U9IiMwMEM3QUUiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBkPSJNMTQuOTM0IDYuNzUxbC01LjQgNS40LTUuNC01LjQiLz48L2c+PC9zdmc+); */
	/* } */
	button {
	    border-radius: 0;
	}
	button, input, optgroup, select, textarea {
	    margin: 0;
	    font-family: inherit;
	    font-size: inherit;
	    line-height: inherit;
	}
	.profile-more-button .more[data-v-0b4042da] {
	    color: #4f8cd1;
	    font-size: .875rem;
	    padding: 0;
	    margin: 0 auto;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	.profile-more-button[data-v-0b4042da] {
	    margin-top: 1.5rem;
	    border: 0;
	}
	
	<!-- 제공 서비스(profile-service-list collapsed) -->
	{}
	.profile-service-list .view ul li.cursor-default[data-v-078fce19]:before {
	    content: "";
	    cursor: default;
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    top: 0;
	    left: 0;
	}
	.profile-service-list .view ul li[data-v-078fce19] {
	    font-size: 1rem;
	    position: relative;
	    float: left;
	    padding: 0.5625rem 1.125rem;
	    border-radius: 21px;
	    border: 0.0625rem solid #e1e1e1;
	    margin-right: 0.5rem;
	    line-height: 1.5;
	    letter-spacing: -.01875rem;
	    color: #737373;
	    margin-bottom: 0.625rem;
	}
	.profile-service-list .view ul[data-v-078fce19] {
	    display: inline-block;
	    margin-bottom: 0;
	}
	.profile-service-list.collapsed .view ul[data-v-078fce19] {
	    overflow: hidden;
	    max-height: 10.0625rem;
	}
	.profile-service-list .view[data-v-078fce19] {
	    position: relative;
	    font-size: 0;
	}
	.profile-body section>div[data-v-6fd40724] {
	    width: 100%;
	    margin-top: 3.75rem;
	}
	
	<!-- hr -->
	{}
	hr {
	    box-sizing: content-box;
	    height: 0;
	    overflow: visible;
	}
	hr {
	    margin-top: 1rem;
	    margin-bottom: 1rem;
	    border: 0;
	    border-top: 0.0625rem solid rgba(0,0,0,.1);
	}
	.profile-body hr.section-divider[data-v-6fd40724] {
	    margin: 3.75rem 0;
	    color: #f2f2f2;
	}
	
	<!-- 사진(profile-media) -->
	{}
	ul li div[data-name=thumbnail][data-v-3c5e5f8a] {
	    background-size: cover;
	    background-position: 50% 50%;
	    border: 0.0625rem solid #f2f2f2;
	    border-radius: 8px;
	    width: 100%;
	    padding-bottom: 100%;
	    background-color: #fafafa;
	    position: relative;
	}
	ul li[data-v-3c5e5f8a] {
	    display: inline-block;
	    padding: 0 0.3125rem;
	    margin-bottom: 0.625rem;
	    cursor: pointer;
	}
	.profile-media .view-list[data-v-4c0f08d0] ul li {
	    flex: 0 0 20%;
	    max-width: 20%;
	    padding: 0 0.4375rem;
	    margin-bottom: 0.9375rem;
	}
	ul[data-v-3c5e5f8a] {
	    padding: 0;
	    font-size: 0;
	    margin: 0 -0.3125rem;
	}
	.profile-media .view-list[data-v-4c0f08d0] ul {
	    margin: 0 -0.4375rem -0.9375rem;
	}
	.profile-body section>div[data-v-6fd40724] {
	    width: 100%;
	    margin-top: 3.75rem;
	}
	.profile-body hr+section>div[data-v-6fd40724]:first-child {
	    margin-top: 0;
	}
	
	<!-- 서비스 상세설명  -->
	{}
	details { 
		margin:5px 0 10px; 
	}
	details > summary { 
		background:#4F8CD1; 
		color:#fff; 
		padding:10px; 
		outline:0; 
		border-radius:5px; 
		cursor:pointer; 
		transition:background 0.5s; 
		text-align:left; 
		box-shadow: 1px 1px 2px gray;
	}
	details > summary::-webkit-details-marker {
		background:#444; 
		color:#fff; 
		background-size:contain; 
		transform:rotate3d(0, 0, 1, 90deg); 
		transition:transform 0.25s;
	}
	details[open] > summary::-webkit-details-marker { 
		transform:rotate3d(0, 0, 1, 180deg);
	}
	details[open] > summary { 
		background:#444;
	}
	details[open] > summary ~ * { 
		animation:reveal 0.5s;
	}
	.tpt { 
		background:#444; 
		color:#fff; 
		margin:5px 0 10px; 
		padding:5px 10px; 
		line-height:25px; 
		border-radius:5px; 
		box-shadow: 1px 1px 2px gray;
	}

	@keyframes reveal {
	    from {
		     opacity:0; 
		     transform:translate3d(0, -30px, 0); 
	     }
	    to { 
		    opacity:1; 
		    transform:translate3d(0, 0, 0); 
	    }
	}
	
	<!-- 저장하기, 취소하기 -->
	{}
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
  	
  	<!-- 한줄소개 -->
  	{}
  	#expertInfo{
	  	font-size: 1.25rem;
	    font-weight: 700;
	    line-height: 1.5;
	    letter-spacing: -.03125rem;
	    color: #323232;
	    padding-top: 1rem;
    }
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<form action="eupView.ex" method="post">
<div data-v-03b0e98c="" class="container">
	<div data-v-03b0e98c="" class="row no-gutters">
		<div data-v-03b0e98c="" data-testid="profile-section" class="profile-section col-lg-auto col-12">
			<div data-v-6fd40724="" data-v-03b0e98c="" class="profile-body">
				<div data-v-0bae2f69="" data-v-6fd40724="" class="profile-overview"><!---->
					<div data-v-0bae2f69="" class="thumb">
						<div data-v-231f963c="" data-v-0bae2f69="" class="user-profile-picture">
<%-- 							<c:if test=" ${ !empty expert.originalFileName }"> --%>
								<div data-v-231f963c="" data-name="image" class="is-square" data-src="https://dmmj3ljielax6.cloudfront.net/upload/profile/5a42edb7-3e50-4e1a-b872-80e563072c3d.jpg?h=320&amp;w=320" lazy="loaded" style="background-image: url(${ pageContext.servletContext.contextPath }/resources/buploadFiles/${ expert.renameFileName });">
									<input type="hidden" value="${ expert.originalFileName }" name="originalFileName">
									<input type="hidden" value="${ expert.renameFileName }" name="renameFileName">
								</div>
<%-- 							</c:if> --%>
						</div>
					</div>
					<div data-v-0bae2f69="" class="info">
						<div data-v-0bae2f69="" class="info-section-header">
							<h1 data-v-0bae2f69="" data-testid="profile-nickname" class="nickname"> ${ expert.expertTitle } 
								<input type="hidden" value="${ expert.expertTitle }" name="expertTitle">
							</h1>
							<button data-v-0bae2f69="" type="button" class="btn share-button btn-none"></button>
						</div>
						<div data-v-0bae2f69="" class="info-section-sub-header">
							<div data-v-0bae2f69="" class="address"> ${ expert.area }
								<input type="hidden" value="${ expert.area }" name="area">
							</div>
							<div data-v-0bae2f69="" class="expertProfileNo">
								<input type="hidden" value="${ expert.expertProfileNo }" name="expertProfileNo">   
	           					<input type="hidden" value="${ page }" name="page">
           					</div>
						</div>
						<h2 data-v-b1726300="" id="expertInfo">한줄 소개</h2>
						<div data-v-0bae2f69="" class="introduce">${ expert.expertInfo }
							<input type="hidden" value="${ expert.expertInfo }" name="expertInfo">
						</div>
						<div data-v-0bae2f69="" class="detail-info">
							<div data-v-0bae2f69="" class="badges">
								<span data-v-0bae2f69="" class="badge-item">
									<img data-v-0bae2f69="" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik00IDcuNjI1IDYuODggMTEgMTIgNSIgc3Ryb2tlPSIjMkRDMjYxIiBzdHJva2Utd2lkdGg9IjIiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+Cjwvc3ZnPgo=" alt="Self cert"> 본인인증 
								</span>
<!-- 								<span data-v-0bae2f69="" class="badge-item"> -->
<!-- 									<img data-v-0bae2f69="" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik00IDcuNjI1IDYuODggMTEgMTIgNSIgc3Ryb2tlPSIjMkRDMjYxIiBzdHJva2Utd2lkdGg9IjIiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+Cjwvc3ZnPgo=" alt="BizRegistration cert"> 사업자등록증  -->
<!-- 								</span> -->
							</div>
							<div data-v-0bae2f69="" class="statistics-info">
								<div data-v-0bae2f69="" class="statistics-info-item">
									<div data-v-0bae2f69="" class="statistics-info-item-header">고용</div>
									<div data-v-0bae2f69="" class="statistics-info-item-contents">${ expert.hireCount }회
										<input type="hidden" value="${ expert.hireCount }" name="hireCount">
									</div>
								</div>
								<div data-v-0bae2f69="" class="statistics-info-item">
									<div data-v-0bae2f69="" class="statistics-info-item-header">총 경력</div>
									<div data-v-0bae2f69="" class="statistics-info-item-contents">${ expert.career }년
										<input type="hidden" value="${ expert.career }" name="career">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div data-v-6fd40724="" class="background-block"></div>
				<ul data-v-79a77614="" data-v-6fd40724="" class="sticky-nav">
					<li data-v-79a77614="" tab-id="about" class="about active">
						<span data-v-79a77614="">전문가 정보</span>
					</li>
					<li data-v-79a77614="" tab-id="detail" class="detail">
						<span data-v-79a77614="">서비스 상세설명</span>
					</li>
					<li data-v-79a77614="" tab-id="photos" class="photos">
						<span data-v-79a77614="">제공 분야</span>
					</li>
				</ul>
				<div data-v-b8dbbace="" data-v-6fd40724="" class="observer-container observer-container">
					<section data-v-6fd40724="" data-v-b8dbbace="" data-observe="about" id="about">
						<div data-v-b1726300="" data-v-6fd40724="" class="profile-provider-info" data-v-b8dbbace="">
							<h2 data-v-b1726300="" id="active">전문가 정보</h2>
							<ul data-v-b1726300="">
								<li data-v-b1726300="" class="business-size">${ expert.employeeCount }
									<input type="hidden" value="${ expert.employeeCount }" name="employeeCount">
								</li>
								<li data-v-b1726300="" class="active-time"> 근무 요일 : ${ expert.workingDay } 
									<input type="hidden" value="${ expert.workingDay }" name="workingDay">
								</li>
<%-- 								<% --%>
<!-- // 									if(loginUser.getWorkingTime() != null) { -->
<!-- // 									String[] strArr = workingTime.split("~"); -->
<%-- 								%> --%>
									<li data-v-b1726300="" class="active-time"> 연락 가능 시간 : 
										<c:forEach items="${ expert.workingTime }" var="workingTime" begin="0" end="0">
											AM ${ workingTime } ~ 
										<input type="hidden" value="${ workingTime }" name="workingTime">
										</c:forEach>
										<c:forEach items="${ expert.workingTime }" var="workingTime" begin="1" end="1">
											PM ${ workingTime }
										<input type="hidden" value="${ workingTime }" name="workingTime">
										</c:forEach>
										
									</li>
<%-- 								<% } %> --%>
							</ul>
						</div>
						<div data-v-0b7cd573="" data-v-6fd40724="" class="profile-service-desc collapsed" data-v-b8dbbace="">
							<h2 data-v-0b7cd573="" id="detail">서비스 상세설명</h2>
							<details>
							<summary>상세설명 더보기</summary>
								<div data-v-0b7cd573="" class="description"> ${ expert.detailDescription }
									<input type="hidden" value="${ expert.detailDescription }" name="detailDescription">
									<div data-v-0b7cd573="" class="gradient show"></div>
								</div>
							</details>
						</div>
						<input type="hidden" value="${ expert.businessLicense }" name="businessLicense">
						<div data-v-078fce19="" data-v-6fd40724="" class="profile-service-list collapsed" data-v-b8dbbace="">
							<h2 data-v-078fce19="" id="service">제공 분야</h2>
							<div data-v-078fce19="" class="view">
								<ul data-v-078fce19="">
									<c:forEach items="${ expert.field }" var="field">
										<li data-v-078fce19="" class="cursor-default"> ${ field } 
											<input type="hidden" value="${ field }" name="field">
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</section>
					<hr data-v-6fd40724="" data-v-b8dbbace="" class="section-divider">
				</div>
			</div>
			<c:url var="edelete" value="edelete.ex">
	         	<c:param name="eId" value="${ expert.expertProfileNo }"/>
	         	<c:param name="renameFileName" value="${ expert.renameFileName }"/>
	      	</c:url>
	      	<c:url var="elist" value="elist.ex">
	         	<c:param name="page" value="${ page }"/>
	      	</c:url>
		    
			<div class="save_cancel">
		    <c:if test="${ loginUser.id eq expert.expertId }">
				<button>수정하기</button>
				<button type="button" onclick="location.href='${ edelete }'">삭제하기</button>
			</c:if>
			<button type="button" onclick="location.href='home.do'">시작 페이지</button>
			<button type="button" onclick="location.href='${ elist }'">목록으로</button>
			<button type="button">의뢰요청</button>
			</div>
		</div>
	</div>
</div>
</form>
	<%@ include file="../common/footer.jsp" %>
<!-- <div class="save_cancel"> -->
<!-- </div> -->
	<script>
		$(function(){
			$('.active').click(function(){
				var offset = $('.container').offset();	
				//선택한 태그의 위치를 반환
				$('html, body').animate({scrollTop : offset.top}, 400);	
				//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
			});
		});
		
		$(function(){
			$('.detail').click(function(){
				var offset = $('#active').offset();
				//선택한 태그의 위치를 반환
				$('html, body').animate({scrollTop : offset.top}, 400);
				//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함
			});
		});
		
		$(function(){
			$('.photos').click(function(){
				var offset = $('#service').offset();
				//선택한 태그의 위치를 반환
				$('html, body').animate({scrollTop : offset.top}, 400);
				//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함
			});
		});
	</script>
</body>
</html>