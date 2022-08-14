<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" /> -->
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<style>
	
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');
	
	body, code {
	    font-size: 14px;
	   /*  font-family: '맑은 고딕', 'Malgun Gothic', 'Dotum', '돋움', 'arial', 'verdana', sans-serif; */
	   	font-family: 'Noto Sans KR', sans-serif;
	    color: #2e3039;
	    -webkit-text-size-adjust: none;
	}
	body {
	    
	    height: 100%;
	    word-spacing: -1px;
	    background: #ecf0f7;
	    padding: 50px;
	}
	
	<!-- div 큰틀(content) -->
	{}
	html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
	    margin: 0;
	    padding: 0;
	}
	#content {
	    min-height: 750px;
	    padding: 0 24px 40px;
	    box-sizing: border-box;
	    vertical-align: top;
	    width: 1130px;
	    margin-left: 400px;
	    margin-top: 50px;
	}
	body.gButtonFixed #content {
	    padding-bottom: 130px;
	}
	
	<!-- div headingArea -->
	{}
	.headingArea {
	    position: relative;
	    margin: 0 0 38px;
	    padding: 20px 0 0;
	}
	
	<!-- mTitle상품등록 -->
	{}
	.mTitle {
	    position: relative;
	    margin: 40px 0 14px;
	}
	
	<!-- h1 상품등록 -->
	{}
	.headingArea h1 {
	    position: relative;
	    display: inline-block;
	    font-size: 30px;
	    line-height: 30px;
	    font-weight: bold;
	    vertical-align: middle;
	}
	.mTitle h1 {
	    color: #2e3039;
	}
	
	<!-- a 태그 -->
	{}
	a {
	    text-decoration: none;
	    color: #2e3039;
	}
	[class^="btn"] {
    cursor: pointer;
}
	.headingArea .btnManual, .mTitle .btnManual, .headingArea .btnVideo {
	    overflow: hidden;
	    display: inline-block;
	    width: 65px;
	    height: 21px;
	    margin: 5px 0 0 7px;
	    font-size: 0;
	    line-height: 0;
	    background: url(//img.echosting.cafe24.com/ec/mode/influencer/common/sfix_btn_heading.png) 0 0 no-repeat;
	    vertical-align: middle;
	}
	.mTitle .btnManual {
	    margin-top: -1px;
	}
	
	<!-- form 기본정보 -->
	{}
	input, select, textarea {
	    font-size: 14px;
	    color: #2e3039;
	    vertical-align: middle;
	    font-family: '맑은 고딕', 'Malgun Gothic', 'Dotum', '돋움', 'arial', 'verdana', sans-serif;
	}
	
	<!-- div 기본정보(mToggleBar eToggle selected ec-product-register-toggle) -->
	{}
	.mToggleBar {
	    margin: 0 0 -1px 0;
	    height: 50px;
	    border: 1px solid #98989b;
	    background-color: #fff;
	    box-sizing: border-box;
	}
	.mToggleBar.selected {
	    border: 1px solid #787d8f;
	    background-color: #8b93a9;
	}

	<!-- h2 기본 정보 -->
	{}
	.mToggleBar h2 {
	    float: left;
	    padding: 13px 0 0 20px;
	    font-size: 16px;
	    color: #535354;
	    font-weight: normal;
	}
	.mToggleBar.selected h2 {
	    color: #fff;
	}
	
	<!-- ctr1기본정보 -->
	{}
	.mToggleBar .ctrl {
	    float: right;
	    height: 100%;
	    line-height: 48px;
	}
	
	<!-- span기본정보  -->
	{}
	.mToggleBar .ctrl span {
	    display: inline-block;
	    height: 100%;
	    vertical-align: top;
	}

	<!-- button기본정보 -->
	{}
	.mToggleBar:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	.mToggleBar .ctrl button:before {
	    content: "";
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    display: block;
	    width: 13px;
	    height: 13px;
	    margin: -9px 0 0 -6px;
	    border-right: 1px solid #7c7c7c;
	    border-bottom: 1px solid #7c7c7c;
	    transform: rotate(45deg);
	    -webkit-transform: rotate(45deg);
	    vertical-align: middle;
	}
	.mToggleBar.selected .ctrl button:before {
	    margin-top: -2px;
	    border-color: #fff;
	    transform: rotate(-135deg);
	    -webkit-transform: rotate(-135deg);
	}
	button {
	    overflow: visible;
	    padding: 0;
	    margin: 0;
	    border: 0;
	    outline: 0;
	    cursor: pointer;
	    background: transparent;
	}
	.mToggleBar .ctrl button {
	    display: inline-block;
	    position: relative;
	    overflow: visible;
	    width: 49px;
	    height: 100%;
	    font-size: 1px;
	    line-height: 0;
	    color: transparent;
	    text-indent: -150%;
	    vertical-align: top;
	    border-left: 1px solid #98989b;
	}
	.mToggleBar.selected .ctrl button {
	    border-color: #787d8f;
	}
	
	<!-- 기본정보내용 -->
	{}
	.toggleArea {
	    display: none;
	}
	.mToggleBar.selected + .toggleArea {
	    display: block;
	    padding: 30px 20px;
	    border-radius: 2px;
	    background: #fff;
	    -webkit-box-shadow: 0px 2px 1px 0px rgb(205 211 222);
	    -moz-box-shadow: 0px 2px 1px 0px rgba(205,211,222,1);
	    box-shadow: 0px 2px 1px 0px rgb(205 211 222);
	}

	<!-- 상품기본정보내용 -->
	{}
	table {
	    table-layout: fixed;
	    width: 100%;
	    border: 0;
	    border-spacing: 0;
	    border-collapse: collapse;
	}
	.mBoard table {
	    line-height: 1.5;
	    background-color: #fff;
	}
	.mBoard table {
	    border-top: 1px solid #dedede;
	}
	
	<!-- -->
	{}
	caption {
	    display: table-caption;
	    text-align: -webkit-center;
	}
	caption {
	    overflow: hidden;
	    width: 1px;
	    font-size: 1px;
	    line-height: 0;
	    text-indent: 150%;
	    white-space: nowrap;
	}
	
	<!-- 상품명th -->
	{}
	th, td {
	    border: 0;
	    word-wrap: break-word;
	}
	.mBoard th {
	    padding: 11px 15px 10px;
	    vertical-align: top;
	    color: #2e3039;
	    background-color: #f3f3f3;
	}
	.mBoard tbody th {
	    border: 1px solid #dedede;
	    text-align: left;
	    word-break: keep-all;
	}
	
	<!-- 상품명(필수) -->
	{}
	.icoRequired:after {
	    content: ")";
	}
	.icoRequired:before, .icoRequired:after {
	    display: inline-block;
	    color: #1b7ffe;
	}
	.icoRequired:before {
	    content: "(";
	}
	.icoRequired {
	    display: inline-block;
	    font-size: 12px;
	    line-height: 12px;
	    vertical-align: baseline;
	    color: #1b7ffe;
	    font-weight: normal;
	    background: none;
	}

	<!-- 상품명 td -->
	{}
	.mBoard td {
	    padding: 10px 15px;
	    line-height: 24px;
	    vertical-align: top;
	}
	.mBoard tbody td {
	    border: 1px solid #dedede;
	}
	.mBoard tfoot > tr > th, .mBoard tbody > tr > td {
	    border-top-width: 0;
	}
	.mBoard th[scope*='row'] + td {
	    height: 32px;
	}
	
	<!-- 상품명overlapTip -->
	{}
	.overlapTip {
	    position: relative;
	    display: inline-block;
	}
	
	<!-- 상품명span -->
	{}
	.mFormRequired {
	    position: relative;
	    display: inline-block;
	    transition: all .2s ease-out;
	}
	
	<!-- 상품명input -->
	{}
	.fText, .fTextarea {
	    max-width: 100%;
	    padding: 0 9px 2px;
	    box-sizing: border-box;
	    border: 1px solid #d4d4d4;
	    font-size: 14px;
	    line-height: 26px;
	    color: #686b6d;
	    outline: 0 none;
	    transition: border .2s ease-out;
	}
	.fText {
	    height: 32px;
	    line-height: 14px;
	}
	
	<!-- 상품명span -->
	{}
	.requiredMsg {
	    display: none;
	    position: absolute;
	    bottom: 25px;
	    right: -8px;
	    padding: 7px 6px;
	    color: #fff;
	    font-size: 11px;
	    font-weight: normal;
	    white-space: nowrap;
	    line-height: 11px;
	    background: #ff6158;
	}
	
	<!-- -->
	{}
	.overlapTip .close {
	    position: absolute;
	    top: 12px;
	    right: 10px;
	    width: 12px;
	    height: 12px;
	    text-indent: 150%;
	    font-size: 0;
	    line-height: 0;
	    white-space: nowrap;
	}
	.icoReference {
	    width: 25px;
	    height: 14px;
	    background-position: -200px -100px;
	}
	.overlapTip .tip {
	    position: absolute;
	    left: 26px;
	    bottom: 28px;
	    padding: 10px 30px 10px 14px;
	    text-align: left;
	    font-weight: normal;
	    letter-spacing: normal;
	    border: 1px solid #4e505d;
	    line-height: 14px;
	    white-space: nowrap;
	    background-color: #fff;
	}
	<!-- 현재글자수,최대글자수 -->
	{}
	.txtByte strong {
	    color: #55a0ff;
	    vertical-align: bottom;
	}
	.txtByte {
	    vertical-align: bottom;
	    color: #97989b;
	}
	span.txtByte {
	    margin-left: 5px;
	}

	<!-- 상품가,과세금액, 과세상품 -->
	{}
	.gSingleSide {
	    margin-left: 11px !important;
	}
	
	<!-- 과세율 설정 -->
	{}
	.btnNormal, .btnCtrl, .btnCtrlEm, .btnGeneral, .btnStrong, .btnSubmit, .btnEm, .btnSearch, .btnDate, .btnToggle, .btnSkinEdit {
	    display: inline-block;
	    position: relative;
	    text-align: center;
	    vertical-align: middle;
	    text-decoration: none;
	    white-space: nowrap;
	    box-sizing: border-box;
	}
	.btnNormal {
	    height: 28px;
	    padding: 0 10px;
	    color: #1c1c1c;
	    font-size: 13px;
	    font-weight: normal;
	    line-height: 26px;
	    border: 1px solid #98989b;
	    background-color: #fff;
	    -webkit-transition: .2s ease-out;
	    transition: .2s ease-out;
	}
	
	<!-- 상품 간략설명 -->
	{}
	ul.txtInfo li:marker {
	    content: "";
	    position: absolute;
	    width: 5px;
	    height: 1px;
	    top: 10px;
	    left: 0;
	    background-color: #a7a8aa;
	}
	ul.txtInfo li {
	    position: relative;
	    margin: 0;
	    padding: 0 0 0 10px;
	    line-height: 21px;
	}
	ul, ol, dl, li {
	    list-style: none;
	}
	.txtInfo {
	    color: #97989b;
	    font-size: 13px;
	    font-style: normal;
	}
	p.txtInfo, ul.txtInfo {
	    margin: 4px 0;
	}
	
	<!-- 상품 상세설명 -->
	
	<!-- 이미지th -->
	{}
	.mTooltip {
	    position: relative;
	    display: inline-block;
	    margin: -2px 0 0;
	    vertical-align: middle;
	    text-align: left;
	}
	.mTooltip .close {
	    overflow: hidden;
	    position: absolute;
	    top: 10px;
	    right: 10px;
	    width: 12px;
	    height: 12px;
	    text-indent: 150%;
	    font-size: 0;
	    line-height: 0;
	    white-space: nowrap;
	}
	.mTooltip .content {
	    padding: 9px 20px 9px 14px;
	    line-height: 22px;
	    font-size: 14px;
	    color: #686b6d;
	    word-break: keep-all;
	    word-wrap: break-word;
	}
	.mTooltip .tooltip {
	    display: none;
	    position: absolute;
	    left: -18px;
	    top: 26px;
	    z-index: 80;
	    width: 298px;
	    min-height: 38px;
	    text-align: left;
	    font-weight: normal;
	    letter-spacing: normal;
	    border: 1px solid #4e505d;
	    background-color: #fff;
	    outline: 0;
	}
	.mTooltip > .icon {
	    display: block;
	    overflow: hidden;
	    width: 14px;
	    height: 14px;
	    border-radius: 50%;
	    text-indent: 150%;
	    white-space: nowrap;
	    cursor: pointer;
	    background: url(//img.echosting.cafe24.com/ec/mode/influencer/common/sfix_tooltip.png) #828ba3 center no-repeat;
	}
	.mTooltip {
	    position: relative;
	    display: inline-block;
	    margin: -2px 0 0;
	    vertical-align: middle;
	    text-align: left;
	}
	.cTip {
	    display: inline-block;
	}
	
	<!-- 이미지td -->
	{}
	div.mForm {
	    margin: 2px 0 0;
	}
	
	<!-- 대표이미지등록 -->
	{}
	input[type="radio"] {
	    position: relative;
	    opacity: 1;
	    width: 20px;
	    height: 20px;
	    cursor: pointer;
	    appearance: none;
	    -webkit-appearance: none;
	    -moz-appearance: none;
	   /*  background: url(//img.echosting.cafe24.com/ec/mode/influencer/common/bg_radio.png) no-repeat 0 0; */
	    background-size: 20px 20px;
	    outline: 0;
	}
	.gLabel .fChk {
	    vertical-align: text-top;
	}
	input[type="radio"]:checked {
	    /* background-image: url(//img.echosting.cafe24.com/ec/mode/influencer/common/bg_radio_checked.png); */
	    -webkit-transition: .2s ease-out;
	    transition: .2s ease-out;
	}
	.gLabel {
	    display: inline-block;
	    margin: 0 28px 0 0;
	}
	label.gLabel {
	    outline: 0;
	}
	
	<!-- 개별이미지등록 -->
	{}
	.gLabel {
	    display: inline-block;
	    margin: 0 28px 0 0;
	}
	
	<!-- 이미지(사진) -->
	{}
	.mThumbList {
	    width: auto;
	}
	.mBoard td .mThumbList:first-child, .mBox .mThumbList:first-child {
	    margin-top: 0;
	}
	.mForm .addForm {
	    margin: 8px 0 0 20px;
	}
	.addForm.show {
	    display: block;
	}

	<!-- 상세이미지 -->
	{}
	.mThumb .button .icoDelete {
	    position: relative;
	    width: 10px;
	    height: 10px;
	}
	.mThumb .button.top .icoDelete, .mThumb.gLarge .icoDelete {
	    -webkit-transform: scale(1.2);
	    -moz-transform: scale(1.2);
	    -ms-transform: scale(1.2);
	    transform: scale(1.2);
	}
	.mThumb .button [class*="btn"] + [class*="btn"] {
	    border-left: 1px solid #949494;
	}
	.mThumb .button [class*="ico"] {
	    display: block;
	    overflow: hidden;
	    margin: 0 auto;
	}
	.mThumb .button .icoEdit {
	    position: relative;
	    width: 12px;
	    height: 12px;
	}
	.mThumb.gLarge .icoEdit {
	    width: 15px;
	    height: 15px;
	}
	.mThumb .button .btnEdit, .mThumb .button .btnDelete, .mThumb .button .btnCrop {
	    overflow: hidden;
	    -webkit-flex: 1;
	    -ms-flex: 1;
	    flex: 1;
	    display: inline-block;
	    height: 32px;
	    text-align: center;
	    text-indent: 150%;
	    font-size: 1px;
	    line-height: 0;
	    color: transparent;
	    white-space: nowrap;
	    background: rgba(0,0,0,0.6);
	    -webkit-transition: .3s ease-out;
	    transition: .3s ease-out;
	}
	.mThumb.gSmall .button [class*="btn"], .mThumb.gLarge .button [class*="btn"] {
	    height: 36px;
	}
	.mThumb .button {
	    position: absolute;
	    bottom: 0;
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: -webkit-flex;
	    display: -ms-flex;
	    display: -moz-flex;
	    width: 100%;
	    opacity: 0;
	    -webkit-transition: .2s ease-out;
	    transition: .2s ease-out;
	}
	.mThumbList.typeHor li .button {
	    display: block;
	    text-align: center;
	}
	.mThumbList.typeHor li .mThumb .button {
	    display: -webkit-flex;
	    display: -ms-flex;
	    display: -moz-flex;
	    display: flex;
	}
	img, fieldset {
	    border: 0;
	    vertical-align: top;
	}
	.mThumb .thumb {
	    display: -webkit-flex;
	    display: -ms-flex;
	    display: -moz-flex;
	    display: flex;
	    -webkit-align-items: center;
	    -ms-align-items: center;
	    -moz-align-items: center;
	    align-items: center;
	    -webkit-justify-content: center;
	    -ms-justify-content: center;
	    -moz-justify-content: center;
	    justify-content: center;
	    width: 100%;
	    height: 100%;
	    text-align: center;
	    border: 1px solid #dedede;
	    background: #fff;
	    box-sizing: border-box;
	    -webkit-transition: .5s ease-out;
	    transition: .5s ease-out;
	}
	.mThumb .btnAdd:after {
	    content: "";
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 2px;
	    height: 16px;
	    margin: -8px 0 0 -1px;
	    background-color: #565656;
	    transform: rotate(180deg);
	    -webkit-transform: rotate(180deg);
	    background-image: none;
	}
	.mThumb .btnAdd:before {
	    content: "";
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    margin: -1px 0 0 -8px;
	    width: 16px;
	    height: 2px;
	    background-color: #565656;
	    background-image: none;
	}
	.mThumb .btnAdd {
	    overflow: hidden;
	    text-indent: -150%;
	    white-space: nowrap;
	    font-size: 1px;
	    line-height: 0;
	    color: transparent;
	    width: 100%;
	    height: 100%;
	    box-sizing: border-box;
	    border: 1px solid #d4d4d4;
	    -webkit-transition: .3s ease-out;
	    transition: .3s ease-out;
	}
	.mThumb {
	    position: relative;
	}
	.mThumb.gLarge {
	    width: 210px;
	    height: 210px;
	}
	.mThumbList.typeHor li .size {
	    display: block;
	    margin: 8px 0 4px;
	    font-size: 13px;
	    line-height: 20px;
	    color: #97989b;
	}
	.txtEm, .txtEm a {
	    color: #55a0ff;
	    font-style: normal;
	}
	.mThumbList.typeHor li .item {
	    display: block;
	    font-size: 14px;
	}
	.mForm li {
	    margin: 5px 0 0;
	}
	.mThumbList li {
	    margin: 8px 0 0 0;
	}
	.mThumbList.typeHor li {
	    display: inline-block;
	    margin: 8px 6px 0 0;
	    vertical-align: top;
	}
	
	<!-- 목록이미지 -->
	{}
	.mThumb .thumb img {
	    max-width: 100%;
	    max-height: 100%;
	    flex-shrink: 0;
	    -webkit-flex-shrink: 0;
	    -ms-flex-shrink: 0;
	    -moz-flex-shrink: 0;
	}
	.mThumb .btnAdd.disabled:before, .mThumb .btnAdd.disabled:after {
	    background-color: #d6dae1;
	}
	.mThumb .btnAdd.disabled:before, .mThumb .btnAdd.disabled:after {
	    background-color: #d6dae1;
	}
	.mThumb .btnAdd:hover, .mThumb .btnAdd.disabled {
	    background-color: #f5f6f8;
	}
	.mTooltip.gLarge .tooltip {
	    width: 558px;
	}
	
	<!-- 추가이미지 -->
	{}
	.mThumbList:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	ul.txtInfo li:before {
	    content: "";
	    position: absolute;
	    width: 5px;
	    height: 1px;
	    top: 10px;
	    left: 0;
	    background-color: #a7a8aa;
	}
	.eImgSort:after {
	    content: '';
	    display: block;
	    clear: both;
	}
	.mThumb.gSmall {
	    width: 100px;
	    height: 100px;
	}
	.mThumbs .mThumb.gSmall {
	    margin: 10px 0 10px 20px;
	}
	.eImgSort li {
	    float: left;
	    cursor: pointer;
	}
	.mThumbs {
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: -webkit-flex;
	    display: -ms-flex;
	    display: -moz-flex;
	    display: flex;
	    -webkit-flex-wrap: wrap;
	    -ms-flex-wrap: wrap;
	    -moz-flex-wrap: wrap;
	    flex-wrap: wrap;
	    margin-left: -20px;
	}
	.txtStrong {
	    color: #2e3039;
	}
	
	<!-- 이미지 사이즈 변경 -->
	{}
	.mBoard .right {
	    text-align: right;
	}
	.fText.right, .fTextarea.center {
	    text-align: right;
	}
	.icoPrint, .icoNew, .icoFile, .icoUp, .icoDown, .icoShop, .icoDot, .icoDepth, .icoFix, .icoChecked, .icoLock {
	    display: inline-block;
	    overflow: hidden;
	    margin: -2px 0 0 0;
	    font-size: 0;
	    line-height: 0;
	    vertical-align: middle;
	    background: url(//img.echosting.cafe24.com/suio/sfix_icon_image.png) 0 0 no-repeat;
	}
	.icoDot {
	    width: 2px;
	    height: 2px;
	    background-position: 0 -50px;
	}
	.mBoard .mBoard.gMedium th, .mBoard.gMedium th {
	    width: 190px;
	}
	.mLayer .mBoard.gMedium th {
	    width: 135px;
	}
	.mCtrl:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	.mCtrl .gRight {
	    float: right;
	    text-align: right;
	}
	.mCtrl {
	    padding: 7px 15px;
	    border: 1px solid #dedede;
	    line-height: 21px;
	    text-align: center;
	    background: #fff;
	}
	.mCtrl.typeHeader {
	    position: relative;
	    margin-bottom: -1px;
	}
	.mLayer .wrap {
	    padding: 20px;
	    word-wrap: break-word;
	}
	.mLayer > h2 {
	    padding: 8px 50px 7px 20px;
	    border-bottom: 1px solid #686868;
	    color: #fff;
	    font-size: 16px;
	    text-align: left;
	    font-weight: normal;
	    background: #2f4363;
	}
	.mLayer {
	    display: none;
	    position: absolute;
	    z-index: 110;
	    left: 50%;
	    border: 1px solid #2f4363;
	    line-height: 1.5;
	    background-color: #fff;
	}
	.mLayer.gMedium {
	    width: 583px;
	}
	
	<!-- 저장,취소 버튼 -->
	{}
	.mLayer .footer:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	.mLayer .footer .btnNormal {
	    min-width: 63px;
	    height: 36px;
	    line-height: 34px;
	    font-size: 14px;
	    color: #55a0ff;
	    border-color: #55a0ff;
	}
	.mLayer .footer .btnNormal {
	    min-width: 63px;
	    height: 36px;
	    line-height: 34px;
	    font-size: 14px;
	    color: #55a0ff;
	    border-color: #55a0ff;
	}
	.mLayer .footer [class*="btn"] + [class*="btn"] {
	    margin-left: 6px;
	}
	.mLayer .footer .btnCtrl {
	    min-width: 63px;
	    height: 36px;
	    line-height: 36px;
	    font-size: 14px;
	    background: #55a0ff;
	}
	.btnCtrl {
	    height: 28px;
	    padding: 0 10px;
	    color: #fff;
	    font-size: 13px;
	    font-weight: normal;
	    line-height: 28px;
	    background-color: #7c7e8c;
	    -webkit-transition: .2s ease-out;
	    transition: .2s ease-out;
	}
	.mLayer .footer .btnCtrl {
	    min-width: 63px;
	    height: 36px;
	    line-height: 36px;
	    font-size: 14px;
	    background: #55a0ff;
	}
	.mLayer .footer {
	    padding: 15px 20px;
	    border-top: 1px solid #dedede;
	    text-align: center;
	    background-color: #fafafa;
	}
	
	<!-- 과세율 설정 -->
	{}
	.mLayer .wrap:after {
	    content: " ";
	    display: block;
	    clear: both;
	}
	.mBox:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	.gDouble {
	    display: block;
	    margin-top: 10px !important;
	}
	.mBox {
	    margin: 20px 0;
	    padding: 20px;
	    line-height: 1.5;
	    box-sizing: border-box;
	    background: #fff;
	}
	.mBox.typeEmpty {
	    padding: 0;
	    border: 0;
	    background: none;
	}
	.mLayer .mBox {
	    margin: 5px 0 0;
	    padding: 7px;
	}
	.mLayer .mBox.typeEmpty, .mLayer .mBox.typeFrame {
	    padding: 0;
	}
	.mTitle h3 {
	    position: relative;
	    display: inline-block;
	    padding: 0 5px 0 10px;
	    color: #2e3039;
	    font-size: 14px;
	    vertical-align: middle;
	}
	.toggleArea h3 {
	    margin: 30px 0 15px;
	    font-size: 16px;
	}
	.mLayer .mTitle h3 {
	    padding: 0;
	    color: #1c1c1c;
	    font-size: 16px;
	    font-weight: normal;
	}
	.toggleArea h3:first-of-type {
	    margin-top: 0;
	}
	.mLayer .mTitle {
	    margin: 15px 0 5px;
	}
	.mLayer .wrap .mTitle:first-child {
	    margin-top: 0;
	}
	
	<!-- 상품등록, 미리보기, 상품 불러오기 -->
	{}
	.mButton:after {
	    content: " ";
	    display: block;
	    clear: both;
	}
/* 	.btnEm {
	    display: inline-block;
	    min-width: 100px;
	    height: 50px;
	    padding: 0 5px;
	    font-size: 20px;
	    line-height: 48px;
	    color: #55a0ff;
	    font-weight: normal;
	    box-sizing: border-box;
	    border: 1px solid #55a0ff;
	    background: #fff;
	    -webkit-transition: .2s ease-out;
	    transition: .2s ease-out;
	    border-radius: 10px;
	} */
	.btnSubmit {
		display: inline-block;
	    min-width: 100px;
	    height: 50px;
	    padding: 15px 20px;
	    color: #fff;
	    font-size: 20px;
	    line-height: 20px;
	    background-color: #55a0ff;
	    -webkit-transition: .2s ease-out;
	    transition: .2s ease-out;
	    border-radius: 10px;
	}
	.mButton a {
	    margin: 0 0 0 10px;
	}
	.mButton a:first-child {
	    margin-left: 0;
	}
	.mButton {
	    margin: 20px 0;
	    padding: 0 4px 0 0;
	    text-align: right;
	}
	.mButton.gCenter {
	    position: relative;
	    text-align: center;
	}
	.mButton.gFixed {
	    z-index: 100;
/* 	    position: fixed; */
/* 	    left: 220px; */
	    right: 0;
	    bottom: 0;
	    margin: 0;
	    padding: 23px 0;
	    border-top: 1px solid #55a0ff;
	    background-color: #fff;
	    -webkit-box-shadow: 0px -5px 15px -2px rgb(0 0 0 / 10%);
	    -moz-box-shadow: 0px -5px 15px -2px rgba(0,0,0,0.1);
	    box-shadow: 0px -5px 15px -2px rgb(0 0 0 / 10%);
	}
	
	/* .thumb ec-product-register-image-upload-thumb{
		width: 500px;
		height: 500px;
	} */
	
	.box{
		border: solid #edf2ff 1px;
		display: flex;
		width: 210px;
		height: 210px;
		background-color: #edf2ff;
		
	}
	
</style>
</head>
<body>

<div id="content">
    <div class="headingArea">
        <div class="mTitle">
            <h1>상품 등록</h1>
            <span class="cManual eSmartMode" code="PT.PE">매뉴얼</a></span>
        </div>

	</div>

    <form name="ec-influencer-product-register" id="ec-influencer-product-register" method="POST" action="ginsert.go" enctype="multipart/form-data">
        <div id="eProductSecureData"></div>
        <!--  이전상품정보 불러오기 체크 파라메타 -->
   

        <!-- 참고: 기본정보 -->
		<style>
		    .mThumbs.eImgSort .highlight { margin:0 0 0 20px; width:100px; height:120px }
		</style>
		<div class="mToggleBar eToggle selected ec-product-register-toggle" bindstatus="true">
		    <h2>기본 정보</h2>
		   
		</div>

		<div class="toggleArea" cssview="on" style="display: block;">
		    <div class="mBoard typeWrite">
		        <table border="1" summary="">
		            <caption>상품 기본 정보</caption>
		            <colgroup>
		                <col style="width:190px;">
		                <col style="width:308px;">
		                <col style="width:auto;">
		            </colgroup>
		            <tbody>
		             
		            <tr>
		                <th scope="row">상품명 <strong class="icoRequired">필수</strong></th>
		                <td colspan="2">
		                    <div class="overlapTip ec-product-auto-translate">
		                        <span class="mFormRequired"><input type="text" name="goodsTitle" required="required" id="product_name" placeholder="예시) 플라워 미니 원피스" class="fText eHasModifyProductAuth eMarketChecker" style="width:500px;"maxcount="250" ><span class="requiredMsg gRightArrow">입력해주세요.</span></span>
		                        
		                                                <div class="tip" style="display:none;">
		                          
		                            <span class="edge"></span>
		                        </div>
		                    </div>
		                    <span class="txtByte" title="현재글자수/최대글자수">[ <strong>0</strong> / 250 ]</span>
		                </td>
		            </tr>
		            <tr>
		                <th scope="row">
		                <!-- 판매가 -->
		                	 판매가
		                	<strong class="icoRequired">필수</strong>
		                </th>
		                <td colspan="2">
		                    
		                    <span class="mFormRequired"><input type="text" class="fText right ePrdPrice eHasModifyProductAuth eMarketChecker ec-product-register-form-basic-price" name="goodsPrice" style="width:150px;"  required="required"><span class="requiredMsg gRightArrow">입력해주세요.</span></span>
                        	원
		            	</td>
		            </tr>
		            <tr>
		                <th scope="row">상품 제조회사</th>
		                <td colspan="2">
		                    <input type="text" class="fText" style="width:150px;" name="goodsCompany" id="ma_product_code"  maxcount="40">
		                    <!-- <a href="#none" class="btnNormal" id="eProductCodeDuplicate"><span>중복확인</span></a> -->
		                    <span class="txtByte" title="현재글자수/최대글자수">[ <strong>0</strong> / 40 ]</span>
		                </td>
		            </tr>
		            <tr>
		                <th scope="row">상품 재고</th>
		                <td colspan="2" class="ec-product-auto-translate">
		                    <input type="text" name="goodsStock" class="fText eMarketChecker" style="width:80%;"  maxcount="10" required="required">
		                   <!--  <span class="txtByte" title="현재글자수/최대글자수">[ <strong>0</strong> / 255 ]</span> -->
		            	</td>
		            </tr>
		            <tr>
		                <th scope="row">상품 종류</th>
		                <td colspan="2">
		                    
		                    <input type="text" name="goodsSort" class="fText eMarketChecker" style="width:80%;"  maxcount="10" required="required">
		                </td>
		            </tr>
		          
		            <tr>
		                <th scope="row" rowspan="2">이미지 
		                <div class="cTip eSmartMode" code="PT.PE.720">
			               
						</div>
					</th>
	                <td colspan="2">
	                    <div class="mForm">
	                       
	
	                        <!-- 마켓 RTQ 전송 시 이미지 기본쇼핑몰 공통사용 체크를 위한 더미 히든 데이터 -->
	
	                        <label class="gLabel eSelected"> 대표이미지등록</label>
	                        <label class="gLabel"> 개별이미지등록</label>
	                        <label class="gLabel"> 파일업로더 등록</label>
	                                               <!--  <a href="#ec-product-register-image-size-layer" class="btnNormal eModal" bindstatus="true"><span>이미지 사이즈 변경</span></a> -->
	                        <div class="addForm show">
	                            <div class="mThumbList typeHor" id="ec-product-register-image-container">
	                                <ul>
	                                    <!-- 상세 이미지 -->
	                                    <li>
	                                        <span class="item"><strong class="txtEm">썸네일</strong>이미지 
		                                       
											</span>
	                                        
	                                            <div id="thumbimgarea">
	                                            	<div class="box" id="thumblayout">
	                                            	
	                                            	</div>
	                                            </div>
	                                            
	                                            <div id="file1">
	                                            	<input type="file" name="uploadFiles1" id="uploadFiles1"class="btnAdd ec-product-register-image-upload-btn" style="cursor: pointer;" accept="image/*" required="required;">
	                                            </div>
	                                            	
	                                            <script>
	                                            	$(function(){
	                                            		$('#file1').hide();
	                                            		$('#thumbimgarea').click(function(){
	                                            			$('#uploadFiles1').click();
	                                            			$('#thumblayout').empty();
	                                            		});
	                                            	});
	                                            	
	                                            	$(document).ready(function(){
	                                            		$('#uploadFiles1').on('change', handleimgfileselect1);
	                                            		
	                                            	});
	                                            
	                                            	function handleimgfileselect1(e){
	                                            		var file = e.target.files;
	                                            		var fileArr = Array.prototype.slice.call(file);
	                                            		fileArr.forEach(function(f){
	                                            			if(!f.type.match("image.*")){
	                                            				alert("이미지 확장자만 가능합니다.");
	                                            				return;
	                                            			}
	                                            			
	                                            			var reader = new FileReader();
	                                            			reader.onload = function(e){
	                                            				var img = $('<img>');
	                                            				img.css({
	                                            					"width": "210px","height": "210px"
	                                            				});
	                                            				
	                                            				img.attr(
	                                            					"src", e.target.result
	                                            				);
	                                            				
	                                            			
	                                            				$('#thumblayout').append(img);
	                                            				
	                                            				
	                                            			}
	                                            			
	                                            			reader.readAsDataURL(f);
	                                            			
	                                            		});
	                                            	}
	                                            </script>
	                                            
	                                            
	                                        
	                                    </li>
	                                    
	                                    <li>
	                                        <span class="item"><strong class="txtEm">상세</strong>이미지 <div class="cTip eSmartMode" code="PT.PE.690"><div class="mTooltip gLarge">
	    
	</div>
	</div></span>
	                   
	                                             <div id="detailimgarea">
	                                            	<div class="box" id="detaillayout">
	                                            	
	                                            	</div>
	                                            </div>
	                                            
	                                            <div id="file2">
	                                            	<input type="file" name="uploadFiles2" id="uploadFiles2"class="btnAdd ec-product-register-image-upload-btn" style="cursor: pointer;" accept="image/*" required="required;">
	                                            </div>
	                                            
	                                            <script>
	                                            	$(function(){
	                                            		$('#file2').hide();
	                                            		$('#detailimgarea').click(function(){
	                                            			$('#uploadFiles2').click();
	                                            			$('#detaillayout').empty();
	                                            		});
	                                            	});
	                                            	
	                                            	$(document).ready(function(){
	                                            		$('#uploadFiles2').on('change', handleimgfileselect2);
	                                            		
	                                            	});
	                                            
	                                            	function handleimgfileselect2(e){
	                                            		var file = e.target.files;
	                                            		var fileArr = Array.prototype.slice.call(file);
	                                            		fileArr.forEach(function(f){
	                                            			if(!f.type.match("image.*")){
	                                            				alert("이미지 확장자만 가능합니다.");
	                                            				return;
	                                            			}
	                                            			
	                                            			var reader = new FileReader();
	                                            			reader.onload = function(e){
	                                            				var img = $('<img>');
	                                            				img.css({
	                                            					"width": "210px","height": "210px"
	                                            				});
	                                            				
	                                            				img.attr(
	                                            					"src", e.target.result
	                                            				);
	                                            				
	                                            			
	                                            				$('#detaillayout').append(img);
	                                            				
	                                            				
	                                            			}
	                                            			
	                                            			reader.readAsDataURL(f);
	                                            			
	                                            		});
	                                            	}
	                                            </script>
	                                            
	                                            
	                                            
	                                            
	                                           
	                                         </div> 
	                                    
	                                        </div>
	                                    </li>  	                                  
	                                </ul>
	                            </div>
	                           
	                        </div>
	                    </div>
	                    
	                </td>
	            </tr>
	          
	            </tbody>
	        </table>
	    </div>
	
	    </div>
	
	<div style="text-align: center; margin-top: 75px;">
	<button class="btnSubmit" id="ec-product-register-submit">상품등록</button>
	</div>
	
    </form>

</body>
</html>