<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/css/header.css" rel="stylesheet">
<body>
<header class="sticky-top">
    <div style="background: white">
      <div style="background: white" class="row content mx-auto py-3">
        <div class="col-md-6 d-flex">
         	<img class="me-4" style="width: 60px;" src="${pageContext.request.contextPath}/resources/images/로고.png" alt=""  onclick="location.href='${pageContext.request.contextPath}/home.do'">    
          	<a href='#' class="text-decoration-none"><h1 style="color: #4f8cd1; line-height: 60px;"  onclick="location.href='${pageContext.request.contextPath}/home.do'">HomeArt</h1></a>
        </div>
        <div class="col-md-6 text-end d-flex align-items-center justify-content-end position-relative">
        <c:if test="${!empty loginUser }">
         <svg class="me-3" fill="#4f8cd1" width="50" height="50" onclick = "location.href = 'list.ca'" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M171.7 191.1H404.3L322.7 35.07C316.6 23.31 321.2 8.821 332.9 2.706C344.7-3.409 359.2 1.167 365.3 12.93L458.4 191.1H544C561.7 191.1 576 206.3 576 223.1C576 241.7 561.7 255.1 544 255.1L492.1 463.5C484.1 492 459.4 512 430 512H145.1C116.6 512 91 492 83.88 463.5L32 255.1C14.33 255.1 0 241.7 0 223.1C0 206.3 14.33 191.1 32 191.1H117.6L210.7 12.93C216.8 1.167 231.3-3.409 243.1 2.706C254.8 8.821 259.4 23.31 253.3 35.07L171.7 191.1zM191.1 303.1C191.1 295.1 184.8 287.1 175.1 287.1C167.2 287.1 159.1 295.1 159.1 303.1V399.1C159.1 408.8 167.2 415.1 175.1 415.1C184.8 415.1 191.1 408.8 191.1 399.1V303.1zM271.1 303.1V399.1C271.1 408.8 279.2 415.1 287.1 415.1C296.8 415.1 304 408.8 304 399.1V303.1C304 295.1 296.8 287.1 287.1 287.1C279.2 287.1 271.1 295.1 271.1 303.1zM416 303.1C416 295.1 408.8 287.1 400 287.1C391.2 287.1 384 295.1 384 303.1V399.1C384 408.8 391.2 415.1 400 415.1C408.8 415.1 416 408.8 416 399.1V303.1z"/></svg>
           <div id="profile-click" class="d-flex align-items-center">
            <div id="profile">
               <c:if test="${!empty loginUser.renameFileName }">
               
                  <img src="${pageContext.request.contextPath }/resources/muploadFiles/${loginUser.renameFileName}" class="w-100 h-100 rounded-circle">
                  
               </c:if>
                 
            </div>
            <svg fill="#4f8cd1" class="ms-2 controlDropdown" width="14" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
              <path d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"/>
            </svg>
            <svg fill="#4f8cd1" class="ms-2 controlDropdown" width="14" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
              <path d="M416 352c-8.188 0-16.38-3.125-22.62-9.375L224 173.3l-169.4 169.4c-12.5 12.5-32.75 12.5-45.25 0s-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25C432.4 348.9 424.2 352 416 352z"/>
            </svg>
          </div>
          <div id="usermenu-dropdown" class="text-start rounded">
            <div class="fs-4 fw-bold">
            
            </div>
           <ul id="dropdown-content" class="fs-5 m-0 mt-4 list-unstyled py-3">
              <li class="mb-3">
                ${loginUser.name }
              </li>
              <li class="mt-3">
               <c:if test="${loginUser.power eq 1 }">
                   <a href="expertMyPage.me" class="text-decoration-none text text-dark">전문가 마이페이지</a>
                </c:if>
                <c:if test="${loginUser.power eq 0 }">
                   <a href="memberMyPage.me" class="text-decoration-none text text-dark">일반회원 마이페이지</a>
                </c:if>
              </li>
            </ul>   
            
<!--             <div id="showChatList" style="min-height: 100px;"> -->
              
<!--             </div> -->
           
          </div>
        </c:if>
        </div>
      </div>
    </div>
    <nav>
      <ul class="position-relative d-flex justify-content-center list-unstyled">
<!--         <li class="slide1"></li> -->
        <li class="slide2"></li>
        <li><a href="nlist.no" class="position-relative text-decoration-none">공지사항</a></li>
        <li><a href="glist.go" class="position-relative text-decoration-none">상품 게시판</a></li>
        <li><a href="elist.ex" class="position-relative text-decoration-none">전문가 찾기</a></li>
        <li><a href="communityList.bo" class="position-relative text-decoration-none">커뮤니티 게시판</a></li>
        
        
        <c:if test="${empty loginUser }">
           <li><a href="loginView.me" class="position-relative text-decoration-none">로그인</a></li>
        </c:if>
        <c:if test="${!empty loginUser }">
           <li><a href="logout.me" class="position-relative text-decoration-none">로그아웃</a></li>
           <c:if test="${loginUser.power eq 2 }">
              <li><a href="admin.ch" class="position-relative text-decoration-none">관리자</a></li>
           </c:if>
        </c:if>
        
      </ul>
    </nav>
  </header>
  
  <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js" integrity="sha512-tL4PIUsPy+Rks1go4kQG8M8/ItpRMvKnbBjQm4d2DQnFwgcBYRRN00QdyQnWSCwNMsoY/MfJY8nHp2CzlNdtZA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
  <script>
     $(function(){
        var currentPath = window.location.pathname;
        
        if(!(currentPath === '/homeArt/admin.ch')) {
           console.log('안녕');
           var sock = new SockJS('http://localhost:8686/homeArt/admin-chat');
              
              sock.onopen = function(){
                console.log('connected : 연결됨');

                sock.onmessage = function(e){
                   console.log(JSON.parse(e.data));
                }
                
                sock.onclose = function() {
                   console.log('닫힘');
                }
                
                $('#start-chat').on('click', function(){
                     $.ajax({
                          url: 'startChat.ch',
                          success: function(data){
                             console.log("data : " + data);
                             connectChat();
                             if(data >= 1) {
                                sock.send('');
                             }else {
                                console.log('실패 모달창 띄울 예정');
                             }
                          },
                          error: function(data){
                             console.log('error');
                          }
                       });
                  });
                
                function connectChat() {
                   var chatSock = new SockJS('http://localhost:8686/homeArt/chat.ch');
                   
                   chatSock.onopen = function(){
                      console.log('채팅 시작!');
                   }
                }
                
                function showChating() {
                   $('#start-chat').css({
                      'display': 'none'
                   });
                   
                   $('<input>').attr('type')
                }
             }
        }
     });
     
     
     
  //일단 ajax로 서버에 보내서 디비에 채팅방 하나 만듬. 그리고 채팅창 생성 및 websocket 연결;
  </script>
  
  <script>
  $(function(){
    $("ul a").on("click", function() {
      var position = $(this).parent().position();
      console.log($(this).parent());
      var width = $(this).parent().width();

      $("ul .slide1").css({
        opacity: 1,
        left: +position.left,
        width: width
      });
    });

    $("header ul a").on("mouseover", function() {
      var position = $(this).parent().position();
      var width = $(this).parent().width();
      $("header ul .slide2").css({
        opacity: 1,
        left: +position.left,
        width: width
      }).addClass("squeeze");
    });

    $("header ul a").on("mouseout", function() {
      $("ul .slide2").css({
        opacity: 0
      }).removeClass("squeeze");
    });

    var currentWidth = $("header ul").find("li:nth-of-type(3) a").parent("li").width();
    var current = $("header ul li:nth-of-type(3) a").position();
    console.log("currentWidth  : " + currentWidth);
    console.log("current.left : " + current.left);
    $("header .slide1").css({
      'left': current.left,
      'width': currentWidth
    });
  })
  </script>
  
 
</body>
</html>