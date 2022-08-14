<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');

  * {
    font-family: 'Noto Sans KR', sans-serif;
  }

  /* navbar */
  header {

  }

  header > nav ul {
    background: #f5f5f5;
    padding: 10px;
    box-shadow: 20px 40px 40px #00000033;
  }

  header > nav ul a {
    padding: 0.6em 2em;
    font-size: 18px;
    z-index: 3;
    color: #333;
    display: inline-block;
    z-index: 3;
    border: none;
    outline: none;
  }

  .color {
    background-color: #4F8CD1;
  }

  header > nav ul .slide1,
  header > nav ul .slide2 {
    position: absolute;
    height: 48px;
    border-radius: 10em;
    transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1.05);
  }

  header > nav ul .slide1 {
    background-color: yellowgreen;
    z-index: 2;
  }

  header ul .slide2 {
    opacity: 0;
    background: #ddd;
    z-index: 1;
  }

  header .squeeze {
    transform: scale(0.9);
  }

  .content {
    width: 1500px;
  }

  #expert-search {
    width: 600px;
  }

  #expert-search input {
    border: none;
    outline: none;
  }

  .menu-color {
    background: #F6F6F6
  }

  #menu>li {
    width: 500px;
    text-align: center;
    font-size: 1.5rem;
    position: relative;
    z-index: 2;
  }

  #menu>li:hover {
    cursor: Pointer;
  }

  #menu>li:first-of-type {
    height: 100%;
    border-bottom: 2px solid #4f8cd1;
    transition: all 0.6s cubic-bezier(0.18, 1.03, 0.18, 1.1);
    z-index: 1;
  }

  .menu-click {
    color: #4f8cd1;
  }

  .card {
    width: 400px;
  }

  #slide-view {
    overflow: hidden;
    transition: height 1s cubic-bezier(0.18, 1.03, 0.18, 1.1);
  }

  #slide-wrap {
    transition: transform .2s linear;
  }

  #slide-wrap li {
    margin-right: 100px;
  }

  #product .box > .card,
  #board .box > .card,
  #expert .box > .card{
    margin: 50px;
    box-shadow: rgb(100 111 124 / 20%) 0px 2px 8px;
    transition: transform 0.2s linear;
  }

  #product .box > .card > .card-body {
    height: 180px;
  }

  #board .box > .card .board-profile {
    width: 50px;
    height: 50px;
  }

  #board .box > .card .card-body {
    height: 150px;
  }

  #product .box > .card:hover,
  #board .box > .card:hover,
  #expert .box > .card:hover {
    transform: scale(1.05);
    border: 1px solid #4f8cd1;
    box-shadow: #4f8cd1 0px 0px 3px 0px;
  }

  #product .box:nth-child(1),
  #board .box:nth-child(1),
  #expert .box:nth-child(1){
    position: relative;
    background: white;
  }

  #product .box:not(:nth-child(1)),
  #board .box:not(:nth-child(1)),
  #expert .box:not(:nth-child(1)){
    position: absolute;
    background: white;
    top: 0;
    transition: top 0.5s cubic-bezier(0.18, 1.03, 0.18, 1.1);
  }

  #usermenu-dropdown {
    position: absolute;
    right: 0;
    bottom: 0;
    width: 21rem;
    border: 1px solid #e1e1e1;
    background-color: white;
    transform: translateY(102%);
    z-index: 1021;
    padding: 30px;
  }

  #usermenu-dropdown > ul{
    border-top: 1px solid #e1e1e1;
    border-bottom: 1px solid #e1e1e1;
  }

  #dropdown-chat-circle {
    border-bottom: 1px solid #e1e1e1;
    margin-top: .5rem;
  }

  .chat-circle {
    width: 50px;
    height: 50px;
  }

  .chat-circle:not(:nth-child(4n)) {
    margin-right: 1.5rem;
    margin-bottom: .5rem;
  }

  #usermenu-dropdown button:nth-last-child(1) {
    border: 1px solid #4f8cd1;
    background-color: #4f8cd1;
    color: white;
  }

  #usermenu-dropdown button:nth-last-child(1):hover {
    box-shadow: 0px 0px 5px #4f8cd1;
  }

  #profile {
    width: 3.7rem;
    height: 3.7rem;
  }

  .box-wrapper, .slide-view {
    transition: all 0.5s linear;
    transition-delay: .2s;
  }

  #product-page-wrap {
    height: 3.7rem;
  }

  #product-page-wrap > .pageCount {
    box-sizing: border-box;
    width: 3.7rem;
    height: 3.7rem;
    transition: all 1s linear;
    background-color: #4f8cd1;
    cursor: pointer;
    color: white;
  }

  #product-page-wrap > .pageCount:not(:nth-child(1)){
    position: absolute;
  }

  #notice {
    border: 1px solid red;
    width: 20rem;
    height: 24rem;
    position: absolute;
    z-index: 1023;
    right: 0;
    bottom: 0;
    transform: translateY(102%);
    background-color: white;
  }

  #notice > li:not(:nth-child(1)) {
    border: 1px solid blue;
    height: 6rem;
    padding: 10px
  }

  #loginModal {
    background-color: white;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 100;
    width: 1000px;
    display: flex;
    box-shadow: 0px 0px 20px #e1e1e1;
  }

  #loginModal .member {
    width: 50%;
  }

  img {
    object-fit: cover;
  }
  
  .expert-profile {
     height: 100px; 
     width: 100px;
     left : 285px;
     bottom: 159px;
  }
</style>
</head>
<body>
   <c:import url="../common/menubar.jsp"/>
     <div class="mx-auto content d-flex justify-content-center" style="height: 16rem;">

    <div id="search" class="d-flex justify-content-center align-items-center py-5">
      <svg width="25" height="25" class="position-relative" style="left: 40px;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
        <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
        <path
          d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z" />
      </svg>
      <div id="expert-search" class="form-control p-0 rounded-pill">
        <input style="font-size: 18px; width: 550px" type="text" class="float-end py-2 pe-4 rounded-pill" />
      </div>
    </div>

  </div>
  <div class="menu-color">
    <ul id="menu" class="content mx-auto list-unstyled d-flex justify-content-center m-0 position-relative">
      <li class="position-absolute">

      </li>
      <li class="py-3 menu-click">
        상품
      </li>
      <li class="py-3">
        커뮤니티
      </li>
      <li class="py-3">
        전문가
      </li>
    </ul>
  </div>
  <div id="slide-view" class="content mx-auto mt-5">
    <ul id="slide-wrap" class="list-unstyled d-flex mb-0">
      <li>
        <div id="product" class="content">
          <div class="box-wrapper position-relative">
            <div class="box down d-flex flex-wrap">
            <c:forEach items="${purchaseList }" var="purchase">
            <div class="card" onclick="location.href='gdetail.go?gId=${purchase.goodsId}'">
                <img style="height: 350px;" src="${pageContext.request.contextPath }/resources/buploadFiles/${purchase.reNameFileName}" class="card-img-top" alt="...">
                <div style="height: 150px;"class="card-body">
                  <div class="company fw-light mb-2">${purchase.goodsCompay }</div>
                  <h5>${purchase.goodsTitle }</h5>
                  <div>
                    <span class="fs-3 fw-bold text-danger">${purchase.goodsPrice }원</span>
                  </div>
                </div>
              </div>
            </c:forEach>
            </div>
          </div>
          <div class="d-flex justify-content-center">
             <c:if test="${fn:length(purchaseList) > 9}">
                <svg width="56" height="64" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
              <path d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"></path>
            </svg>
             </c:if>
          </div>
        </div>
      </li>
      <li>
        <div id="board" class="content">
          <div class="box-wrapper position-relative">
            <div class="box down d-flex flex-wrap">
            <c:forEach items="${boardList }" var="board">
               <div class="card" onclick="location.href='communityDetail.bo?bId=${board.boardNo}'">
                <img style="height: 350px;" src="${pageContext.request.contextPath }/resources/buploadFiles/${board.changeName}" class="card-img-top" alt="...">
                <div style="height: 150px;" class="card-body">
                  <span class="fs-5 mb-4">${board.boardTitle }</span>
                  <div class="d-flex align-items-center">
                    <div class="board-profile rounded-circle overflow-hidden mt-2">
                      <img class="h-100 w-100" src="${pageContext.request.contextPath }/resources/muploadFiles/${board.profilePath}" alt="...">
                    </div>
                    <span class="ms-2 fs-5">${board.writer }</span>
                  </div>
                </div>
              </div>
            </c:forEach>
              
         
            </div>
          </div>
          <div class="d-flex justify-content-center">
            <c:if test="${fn:length(boardList) > 9}">
                <svg width="56" height="64" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
              <path d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"></path>
            </svg>
            </c:if>
          </div>
        </div>
      </li>
      <li>
        <div id="expert" class="content">
          <div class="box-wrapper position-relative">
            <div class="box down d-flex flex-wrap">
            <c:forEach items="${expertList }" var="expert">
               <div class="card" onclick="location.href='edetail.ex?eId=${expert.expertProfileNo}&page=${expert.page }'">
                <img style="height:400px;" src="${pageContext.request.contextPath }/resources/buploadFiles/${expert.ebReName}" class="card-img-top" alt="...">
                <div class="card-body" style="height: 150px;">
                   <div class="expert-profile position-absolute rounded-circle overflow-hidden">
                      <img class="w-100 h-100" src="${pageContext.request.contextPath }/resources/muploadFiles/${expert.mReName}">
                   </div>
                  <div class="expert-info">
                    <h5 class="">${expert.expertTitle }(${expert.field })</h5>
                    <div class="fw-light">
                         경력 : ${expert.career }
                    </div>
                    <div>
                      ${expert.expertInfo }
                    </div>
                  </div>
                </div>
              </div>
              </c:forEach>
            
              
            </div>
          </div>
          <div class="d-flex justify-content-center">
            <c:if test="${fn:length(expertList) > 9}">
                <svg width="56" height="64" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
              <path d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"></path>
            </svg>
         </c:if>          
          </div>
        </div>
      </li>
    </ul>
  </div>
  <script>
     function movePage(no) {
        var path = 'communityDetail.bo?bId=' + no;
        
        location.href = path;
     }
  </script>
   <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
  <!-- 알림 창 껏다 키기 -->
  <script>
    $(function(){
      var noticeClick = $('#noticeClick');
      var notice = $('#notice');

      notice.hide();

      noticeClick.on('click', function(){
        var display = notice.css('display');

        if(display === 'none'){
          notice.show();
        }else {
          notice.hide();
        }
      });
    });
  </script>
  <!-- 로그인 모달 창 껏다 키기 -->
  <script>
    $(function(){
      var loginBtn = $('#login');
      var modal = $('#loginModal');

      modal.hide();

      loginBtn.on('click', function(){
        var display = modal.css('display');

        if(display === 'flex') {
          modal.hide();
        }else if(display === 'none') {
          modal.show();
        }
      });

    });
  </script>
  <!-- 검색 페이지 초기화 처리 -->
  <script>
    $(function(){
      var width = $('.pageCount').width() + 10;

      $('#page-wrap > .pageCount').css({
        'left': -width + 'px'
      });
    });
  </script>
  <!-- 프로필 클릭 시 관리 창 뜨게하기 -->
  <script>
    $(function(){
      var profile_cilck = $('#profile-click');
      var clickShow = $('.controlDropdown').eq(1);
      var clickHide = $('.controlDropdown').eq(0);
      var userMenu = $('#usermenu-dropdown');
      var userProfile = $('#profile > img');

      clickHide.hide();
      userMenu.hide();

      profile_cilck.on('click', function(){
        if(clickShow.css('display') === 'none'){
          //닫아야 함
          clickHide.hide();
          clickShow.show();
          userMenu.hide();
        }else if(clickHide.css('display') === 'none'){
          //열어야 함
          clickShow.hide();
          clickHide.show();
          userMenu.show();
        }
      });
    });
  </script>
  <!-- 다음 글 박스 나타나게 하기 및 스크롤 처리 -->
  <script>
    //product
    var maxBoxCount = $('#product > .box-wrapper > .box').length;
    var currentBoxCount = 1;

    //board
    var boardMaxBoxCount = $('#board > .box-wrapper > .box').length;
    var boardCurrentBoxCount = 1;

    //expert
    var expertMaxBoxCount = $('#expert > .box-wrapper > .box').length;
    var expertCurrentBoxCount = 1;

    calc_z_index($('#product > .box-wrapper > .box'));
    calc_z_index($('#board > .box-wrapper > .box'));
    calc_z_index($('#expert > .box-wrapper > .box'));

    $('#product svg').on('click', function(){
      productDownView($('#product > .box-wrapper > .box'), $('#product > .box-wrapper'), $(this));
    });

    $('#board svg').on('click', function(){
      boardDownView($('#board > .box-wrapper > .box'), $('#board > .box-wrapper'), $(this));
    });

    $('#expert svg').on('click', function(){
      expertDownView($('#expert > .box-wrapper > .box'), $('#expert > .box-wrapper'), $(this));
    });

    function calc_z_index(boxs) {
      boxs.each(function(index, element) { // z-index를 넣어준다.
        $(element).css({
          'z-index': maxBoxCount - index
        });
      });
    }

    function expertDownView(box, box_wrapper, up_and_down){
      var originProductHeight = box_wrapper.height(); //클릭하기 전의 box-wrapper의 높이
      var boxHeight = box.eq(expertCurrentBoxCount).height(); //움직일 box의 높이

      if(expertMaxBoxCount > 1) {//즉, card의 개수가 9개가 넘는다면
        $('#slide-view').css({
          'height': $('#slide-view').height() + boxHeight
        });

        box_wrapper.css({
          'height': originProductHeight + boxHeight
        });

        box.not('.down').css({
          'top': originProductHeight + 'px'
        });

        box.eq(expertCurrentBoxCount).addClass('down');//내려갔다는 뜻의 클래스

        expertCurrentBoxCount = expertCurrentBoxCount + 1;
        //pageClick(currentBoxCount, $('.pageCount'), $('#product-page-wrap'));
      }else {
        //화살표 흔들리는 이벤트
      }
    }

    function productDownView(box, box_wrapper, up_and_down){
      var originProductHeight = box_wrapper.height(); //클릭하기 전의 box-wrapper의 높이
      console.log(box.not('.down'));
      var boxHeight = box.eq(currentBoxCount).height(); //움직일 box의 높이

      console.log('boxHeight' + boxHeight);
      if(maxBoxCount > 1) {//즉, card의 개수가 9개가 넘는다면
        $('#slide-view').css({
          'height': $('#slide-view').height() + boxHeight
        });

        box_wrapper.css({
          'height': originProductHeight + boxHeight
        });

        box.not('.down').css({
          'top': originProductHeight + 'px'
        });

        box.eq(currentBoxCount).addClass('down');//내려갔다는 뜻의 클래스

        currentBoxCount = currentBoxCount + 1;
        //pageClick(currentBoxCount, $('.pageCount'), $('#product-page-wrap'));
      }else {
        //화살표 흔들리는 이벤트
      }
    }

    function boardDownView(box, box_wrapper, up_and_down){
      var originProductHeight = box_wrapper.height(); //클릭하기 전의 box-wrapper의 높이
      var boxHeight = box.eq(boardCurrentBoxCount).height(); //움직일 box의 높이

      console.log('boxHeight' + boxHeight);
      if(boardMaxBoxCount > 1) {//즉, card의 개수가 9개가 넘는다면
        $('#slide-view').css({
          'height': $('#slide-view').height() + boxHeight
        });

        box_wrapper.css({
          'height': originProductHeight + boxHeight
        });

        box.not('.down').css({
          'top': originProductHeight + 'px'
        });

        box.eq(boardCurrentBoxCount).addClass('down');//내려갔다는 뜻의 클래스

        boardCurrentBoxCount = boardCurrentBoxCount + 1;
        //pageClick(boardCurrentBoxCount, $('.pageCount'), $('#page-wrap'));
      }else {
        //화살표 흔들리는 이벤트
      }
    }

    //페이지 숨긱
    function pageClick(count, pageCount, pageWrap){
      var allCountWidth = pageCount.width() * count;
      var moveWidth = pageWrap.width() - allCountWidth;

      if(currentBoxCount >= 2) {
        pageCount.eq(currentBoxCount - 1).css({
          'left': moveWidth + 'px'
        });
      }
    }
  </script>
  <!-- 검색 결과 종류에 나눠 슬라이드 처리(더 수정해야 함) -->
  <script>
    console.log($('#product > .box:nth-child(1)'));

    $(function() {
      var menuBorder = $('#menu > li').eq(0)
      var currentPosition = $('#menu > li').eq(1).position();

      menuBorder.css({
        left: currentPosition.left
      })

      $('#menu > li').on('click', function() {
        var moveLength = 0;
        var menuText = $(this).text().trim();
        var position = $(this).position();

        var productHeight = $('#product').height();
        var boardHeight = $('#board').height();
        var expertHeight = $('#expert').height();
        var height = 0;

        $('#menu > li').removeClass('menu-click');

        if(menuText === '상품'){
          moveLength = 0;
          height = productHeight;
        }else if(menuText === '커뮤니티') {
          moveLength = -1600;
          height = boardHeight;
        }else if(menuText === '전문가') {
          moveLength = -3200;
          height = expertHeight;
        }

        console.log(moveLength);

        menuBorder.css({
          left: position.left
        });

        $('#slide-wrap').css({
          'transform': 'translateX(' + moveLength + 'px)'
        });

        $('#slide-view').css({
          'height': height + 'px'
        })

        $(this).addClass('menu-click');
      });
    });
  </script>
  <!-- 검색창 focus시 효과 -->
  <script>
  $('#expert-search input').on('focus', function() {
      $('#expert-search').css({
        'box-shadow': '0px 0px 5px #4f8cd1'
      });
      if(window.eventkeyCode === 13) {
        console.log('Wlrdma');
       }else{
          console.log('fsdfsdfsdf');
       }
    }).on('blur', function() {
      $('#expert-search').css({
        'box-shadow': 'none',
        'border': '1px solid #ced4da'
      });
    }).on('keypress', function(e){
       if(e.keyCode === 13) {
          location.href = 'search.se?title=' + $(this).val();
       }
    });
  </script>
  <!-- header -->
  <script>
    $(function() {
      $("nav ul a").on("click", function() {
        var position = $(this).parent().position();
        var width = $(this).parent().width();

        $("nav ul .slide1").css({
          opacity: 1,
          left: +position.left,
          width: width
        });
      });

      $("header nav ul a").on("mouseover", function() {
        var position = $(this).parent().position();
        var width = $(this).parent().width();
        $("header nav ul .slide2").css({
          opacity: 1,
          left: +position.left,
          width: width
        }).addClass("squeeze");
      });

      $("header nav ul a").on("mouseout", function() {
        $("ul .slide2").css({
          opacity: 0
        }).removeClass("squeeze");
      });

      var currentWidth = $("header nav ul").find("li:nth-of-type(3) a").parent("li").width();
      var current = $("header nav ul li:nth-of-type(3) a").position();
      console.log("currentWidth  : " + currentWidth);
      console.log("current.left : " + current.left);
      $("header nav .slide1").css({
        'left': current.left,
        'width': currentWidth
      });
    })
  </script>
</body>
</html>