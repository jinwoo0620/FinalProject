<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Product example · Bootstrap v5.2</title>
  <style>
    /* 폰트 */
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');

    * {
      font-family: 'Noto Sans KR', sans-serif;
    }

    /* banner */
    img {
      object-fit: cover;
    }

    .carousel-item>img {
      width: 100%;
      height: 600px;
    }

    /* content */
    .content {
      max-width: 1500px;
    }

    #purchase-list {
      width: 1300px;
      overflow: hidden;
      padding: 10px 0;
    }

    #purchase-list ul {
      transition: transform 1.2s cubic-bezier(0.41, 1.29, 0.4, 1.3);
      background-color: transparent;
      box-shadow: none;
      margin: 0;
    }

    #purchase-list ul:nth-of-type(1) {
      margin-bottom: 20px;
    }

    .purchase {
      min-width: 270px;
      height: 100px;
      border-radius: 7px;
      overflow: hidden;
      margin: 0 27px;
      transition: transform 0.07s linear;
    }

    .purchase:hover {
      transform: scale(1.1);
    }

    .purchase img {
      display: block;
      width: 100%
    }

    @keyframes shake-ani {
      0% {
        transform: translateX(0);
      }

      50% {
        transform: translateX(-6px);
      }

      100% {
        transform: translateX(6px);
      }
    }

    .shake {
      animation: shake-ani 0.1s linear alternate;
    }

    #expert-category {
      width: 100%;
    }

    #expert-category img {
      -webkit-mask-image: url(#mask-circle);
      mask-image: url(#mask-circle);
    }

    #expert-category .picture-area {
      background-image: url(${pageContext.request.contextPath }/resources/images/expert1.jpg);
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;

    }

    #expert-search input {
      border: none;
      outline: none;
    }

    #expert-search:hover {
      box-shadow: 0px 0px 20px #ced4da;
    }

    #purchase-slide>svg {
      transform: scale(1.5);
    }

    #today-pick {
      padding-top: 100px;
      height: 700px;
    }

    #today-pick ul.today-pick-ani {
      transition: transform 0.7s cubic-bezier(0.18, 1.03, 0.18, 1.1);
    }

    #today-pick ul li {
      min-width: 448px;
      height: 500px;
      margin-right: 500px;
    }

    .card {
      height: 100%;
    }

    #best-home .card {
      width: 480px;
    }

    #best-home>div {
      margin-bottom: 50px;
    }

    #today-list {
      width: 100%;
      z-index: 1;
    }

    #today-list>#box {
      max-height: 1644px;
    }

    #today-list.Ymove-ani {
      transition: all 0.5s cubic-bezier(0.18, 1.03, 0.18, 1.1);
    }

    #expert-category,
    #search,
    #purchase-slide,
    #today-pick {
      position: relative;
      z-index: 5;
      background: white;
    }

    #today-list .card {
      width: 448px;
      height: 500px;
    }

    #today-list .card img {
      height: 70%;
    }

    #up-and-down svg {
      margin-left: 20px;
      margin-right: 20px;
    }

    #youtube {
      padding: 80px 0;
    }

    #youtube ul.Ymove {
      transition: all 1s cubic-bezier(0.18, 1.03, 0.18, 1.1);
    }

    #aaa:hover {
      fill: red;
    }

    #youtube>div:nth-of-type(3) svg:hover {
      fill: #4f8cd1;
    }

    #youtube ul li {
      width: 100%;
      height: 200px;
      margin-bottom: 50px;
      background: white;
    }

    .card-ani {
      box-shadow: rgb(100 111 124 / 20%) 0px 2px 8px;
      transition: all 0.2s linear;
    }

    .card-ani:hover {
      transform: scale(1.05);
      border: 1px solid #4f8cd1;
      box-shadow: #4f8cd1 0px 0px 3px 0px;
    }

    .modal {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 50px;
      height: 50px;
      border: 1px solid red;
      z-index: 1024;
      background-color: red;
    }

    .wrap {
      background: white;
      position: relative;
      z-index: 10;
    }

    #today-list .card {
      margin-right: 26px;
      margin-left: 26px;
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
  </style>
</head>

<body>
 <c:import url="common/menubar.jsp"/>

  <div id="carouselExampleFade" class="banner carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="${pageContext.request.contextPath }/resources/images/banner1.jpg.png" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="${pageContext.request.contextPath }/resources/images/banner2.jpg.png" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="${pageContext.request.contextPath }/resources/images/banner3.jpg.png" class="d-block w-100" alt="...">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
      <svg width="50px" height="50px" xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='black'>
        <path d='M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z' />
      </svg>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
      <svg width="50px" height="50px" xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='black'>
        <path d='M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z' />
      </svg>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  <div class="content mx-auto mb-5 position-relative">

    <div class="wrap">
      <!-- expert, product guide -->
      <div id="expert-category" class="row py-5 my-5">
        <div class="col-md-7 d-flex justify-content-center align-items-center p-0">
          <div class="text-center">
            <h1 style="font-size: 3.5rem">필요한 정보를 검색하세요.</h1>
            <br>
            <p class="fs-3">
              HomeArt에는 홈 인테리어에 도움이 되는 수많은 정보들이 있습니다.<br />
              상품 혹은 전문가 등을 검색하여 당신의 집을 아름답게 꾸며보세요.
            </p>
          </div>
        </div>
        <div class="picture-area col-md-5 position-relative p-0 d-flex" style="height: 500px;">
          <svg xmlns="http://www.w3.org/2000/svg" class="position-absolute top-0 start-0 w-100 h-100">
            <defs>
              <mask id="mask-circle">
                <rect x="0" y="0" width="100%" height="100%" fill="white"></rect>

                <svg id="sw-js-blob-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" version="1.1">
                  <path
                    d="M22.3,-38.9C29,-34.7,34.6,-29,36.4,-22.2C38.2,-15.5,36.1,-7.8,35,-0.6C33.9,6.5,33.9,13,32.1,19.7C30.3,26.4,26.7,33.2,21.1,38.1C15.4,43,7.7,46,0.6,45C-6.6,44,-13.1,39,-19.5,34.6C-25.9,30.1,-32.1,26.1,-36.6,20.4C-41.1,14.8,-43.9,7.4,-43.3,0.4C-42.6,-6.7,-38.6,-13.3,-34.1,-19C-29.6,-24.6,-24.6,-29.3,-18.8,-34C-13.1,-38.7,-6.5,-43.4,0.6,-44.5C7.8,-45.6,15.6,-43,22.3,-38.9Z"
                    width="100%" height="100%" transform="translate(50 50)" stroke-width="0" style="transition: all 0.3s ease 0s; fill: black;"></path>
                </svg>
              </mask>
            </defs>
            <g mask="url(#mask-circle)">
              <rect x="0" y="0" width="100%" height="100%" fill="white"></rect>
            </g>
          </svg>
        </div>
      </div>

      <!-- expert, product search -->
      <div id="search" class="d-flex justify-content-center align-items-center py-5 mt-5">
        <svg width="25" height="25" class="position-relative" style="left: 40px;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
          <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
          <path
            d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z" />
        </svg>
        <div id="expert-search" style="width: 600px;" class="form-control p-0 rounded-pill">
          <input style="font-size: 18px; width: 550px" type="text" class="float-end py-2 pe-4 rounded-pill" />
        </div>
      </div>

      <div id="test" class="row my-5">
        <div class="col-md-6 d-flex justify-content-center align-items-center" style="background-color">
          <div class="text-center">
            <h1 style="font-size: 3.5rem">Home Story</h1>
            <br>
            <p class="fs-3" style="">
              당신의 인테리어 이야기를 모두와 공유해보세요. <br />
              아직 갈피를 못 찾았다면, 훌륭한 이야기를 참고할 수도 있죠.
            </p>
            <input type="checkbox" class="btn-check" id="allview-check2" autocomplete="off">
            <label onclick="location.href='communityList.bo'" class="btn btn-outline-primary rounded-pill fs-4 p-3" for="allview-check2" style="width: 400px;">
              전체 보기
            </label>
          </div>
        </div>
        <div class="col-md-6 position-relative p-0">
          <img class="position-absolute top-0 start-0 w-100 h-100" src="${pageContext.request.contextPath }/resources/images/go-top9.jpg" alt="">
          <svg class="position-relative" id="sw-js-blob-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
            <defs>
              <mask id="mask-top9">
                <rect mask="url(#mask-top9)" x="0" y="0" class="w-100 h-100" fill="white"></rect>
                <path fill="black" d="M21.4,-38C26.4,-34.1,28.4,-25.8,29.8,-18.7C31.2,-11.7,32,-5.8,33.9,1.1C35.8,8,38.8,16.1,37,22.6C35.3,29.1,28.9,34.1,22,35.5C15,37,7.5,34.9,-0.1,35C-7.7,35.1,-15.3,37.4,-20.2,34.8C-25.1,32.2,-27.3,24.6,-30.7,18C-34.1,11.3,-38.8,5.7,-39.7,-0.5C-40.5,-6.7,-37.5,-13.3,-33,-18C-28.5,-22.7,-22.4,-25.4,-16.6,-29C-10.8,-32.5,-5.4,-36.8,1.4,-39.2C8.2,-41.5,16.3,-42,21.4,-38Z"
                  width="100%" height="100%" transform="translate(50 50)" stroke-width="0" style="transition: all 0.3s ease 0s;">
                </path>
              </mask>
            </defs>
            <rect mask="url(#mask-top9)" x="0" y="0" class="w-100 h-100" fill="white"></rect>
            <text x="50%" y="50%"  text-anchor="middle" dominant-baseline="central" fill="white">Top-9</text>
          </svg>
        </div>
      </div>

      <div id="best-home" class="mb-5">
        <div class="d-flex flex-wrap">
        <c:forEach items="${boardList }" var="board">
           <div class="card card-ani" style="margin-left: 10px; margin-right: 10px;">
            <img style="height: 350px;" src="${pageContext.request.contextPath }/resources/buploadFiles/${board.changeName}" class="card-img-top" alt="...">
            <div class="card-body" style="height: 150px;">
              <div class="d-flex align-items-center">
                <div style="width: 50px; height: 50px;" class="rounded-circle overflow-hidden">
                   <img class="h-100 w-100" src="${pageContext.request.contextPath }/resources/muploadFiles/${board.profilePath}"/>
                </div>
                <span class="fs-5 ms-3">
                  ${board.writer }
                </span>
              </div>
              <p class="mb-0 fs-4 mt-3">
                     ${board.boardTitle }
              </p>
            </div>
          </div>
        </c:forEach>
      </div>
      </div>

      <!-- today pick silde -->
      <div id="today-pick" class="row d-flex justify-content-center">
        <div class="col-md-5 d-flex justify-content-center align-items-center">
          <div class="overflow-hidden" style="width: 28rem; height: 500px;">
            <ul class="list-unstyled d-flex p-0 today-pick-ani">
               <c:forEach items="${purchaseList }" var="pc" varStatus="v">
               <li onclick="location.href='gdetail.go?gId=${v.count}'">
                   <div class="card">
                     <div class="w-100 overflow-hidden">
                         <img style="height: 350px;" src="${pageContext.request.contextPath }/resources/buploadFiles/${pc.reNameFileName}" class="card-img-top card-ani" alt="...">
                     </div>
                  <div class="card-body" style="height: 148px;">
                    <div class="company fw-light mb-2">${pc.goodsCompay }</div>
                    <h5>${pc.goodsTitle }</h5>
                    <div>
                      <span class="fs-1 text-danger fw-bold me-3">${pc.goodsPrice }원</span>
                    </div>
                  </div>
                </div>
              </li>
               </c:forEach>

            </ul>
          </div>
        </div>
        <div class="col-md-7 d-flex justify-content-center align-items-center">
          <div class="text-center">
            <h1 style="font-size: 3.5rem">today's pick</h1>
            <br>
            <p class="fs-3">
              당신을 위해, 새로운 상품들을 준비했습니다. <br />
              어딘가에는 당신의 방에 딱 어울리는 가구가 있을지도 몰라요!
            </p>
            <input type="checkbox" class="btn-check" id="allview-check" autocomplete="off">
            <label onclick="location.href='glist.go'" class="btn btn-outline-primary rounded-pill fs-4 p-3" for="allview-check" style="width: 400px;">바로가기</label>
          </div>
        </div>
      </div>
    </div>

  </div>
  <div style="height: 270px;" class="position-relative">
    <video class="w-100 h-100" autoplay playsinline muted loop preload>
      <source src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4">
    </video>
    <svg class="position-absolute top-0 start-0 w-100 h-100" style="font-size: 5rem;">
      <defs>
        <mask id="mask-text">
          <rect x="0" y="0" width="100%" height="100%" fill="white"></rect>
          <text x="50%" y="50%" text-anchor="middle" dominant-baseline="central" fill="black">꿀팁 TV</text>
        </mask>
      </defs>
      <rect mask="url(#mask-text)" x="0" y="0" width="100%" height="100%" fill="white"></rect>
    </svg>
  </div>

  <div style="background: rgb(238, 243, 250);">
    <div id="youtube" class="row mx-auto" style="width: 1500px;">
      <div class="text-start p-0">
        <svg id="aaa" width="72" height="56" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
          <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
          <path
            d="M549.655 124.083c-6.281-23.65-24.787-42.276-48.284-48.597C458.781 64 288 64 288 64S117.22 64 74.629 75.486c-23.497 6.322-42.003 24.947-48.284 48.597-11.412 42.867-11.412 132.305-11.412 132.305s0 89.438 11.412 132.305c6.281 23.65 24.787 41.5 48.284 47.821C117.22 448 288 448 288 448s170.78 0 213.371-11.486c23.497-6.321 42.003-24.171 48.284-47.821 11.412-42.867 11.412-132.305 11.412-132.305s0-89.438-11.412-132.305zm-317.51 213.508V175.185l142.739 81.205-142.739 81.201z" />
        </svg>
        유튜브 바로가기
      </div>
      <div class="col-md-7 p-0">
        <iframe class="rounded" width="100%" height="100%" src="https://www.youtube.com/embed/ZMYrfd0SPdc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
          allowfullscreen></iframe>
      </div>
      <div class="col-md-5 p-0 text-center">
        <svg width="40" height="60" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
          <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
          <path d="M352 352c-8.188 0-16.38-3.125-22.62-9.375L192 205.3l-137.4 137.4c-12.5 12.5-32.75 12.5-45.25 0s-12.5-32.75 0-45.25l160-160c12.5-12.5 32.75-12.5 45.25 0l160 160c12.5 12.5 12.5 32.75 0 45.25C368.4 348.9 360.2 352 352 352z" />
        </svg>
        <div class="slide-wrap overflow-hidden py-3 px-4" style="height: 736px;">
          <ul class="list-unstyled h-100 p-0 m-0 position-relative Ymove">
            <li class="rounded d-flex align-content-center p-3 card-ani">

              <div class="w-100 h-100 d-flex align-items-center">
                <div class="row">
                  <div class="col-md-6">
                    <img class="w-100 h-100 rounded" src="https://img.youtube.com/vi/jZ-5EQk8bQw/maxresdefault.jpg" alt="">
                    <span class="d-none">jZ-5EQk8bQw</span>
                  </div>
                  <div class="col-md-6">
                    <h4>2평 학생방 꾸미기</h4>
                    <p>
                   		  집꾸미기 인테리어
                    </p>
                  </div>
                </div>
              </div>
            </li>
            <li class="rounded d-flex align-content-center p-3 card-ani">

              <div class="w-100 h-100 d-flex align-items-center">
                <div class="row">
                  <div class="col-md-6">
                    <img class="w-100 h-100 rounded" src="https://img.youtube.com/vi/vIP-ecxf6DI/maxresdefault.jpg" alt="">
                    <span class="d-none">vIP-ecxf6DI</span>
                  </div>
                  <div class="col-md-6">
                    <h4>33평 아파트 인테리어 거실 배치 꿀팀</h4>
                    <p>
                      		House Room Tour
                    </p>
                  </div>
                </div>
              </div>


            </li>
            <li class="rounded d-flex align-content-center p-3 card-ani">

              <div class="w-100 h-100 d-flex align-items-center">
                <div class="row">
                  <div class="col-md-6">
                    <img class="w-100 h-100 rounded" src="https://img.youtube.com/vi/nby0k5LwgU8/maxresdefault.jpg" alt="">
                    <span class="d-none">nby0k5LwgU8</span>
                  </div>
                  <div class="col-md-6">
                    <h4>디자이너 부부의 요리 주방!</h4>
                    <p>
                         	주방 중심 인테리어
                    </p>
                  </div>
                </div>
              </div>

            </li>

            <li class="rounded d-flex align-content-center p-3 card-ani">

              <div class="w-100 h-100 d-flex align-items-center">
                <div class="row">
                  <div class="col-md-6">
                    <img class="w-100 h-100 rounded" src="https://img.youtube.com/vi/XlI3aeqGmQc/maxresdefault.jpg" alt="">
                    <span class="d-none">XlI3aeqGmQc</span>
                  </div>
                  <div class="col-md-6">
                    <h4>테라스 + 다락방 탑층 인테리어</h4>
                    <p>
                      	힐링 테라스와 함께
                    </p>
                  </div>
                </div>
              </div>

            </li>
          </ul>
        </div>
        <svg width="40" height="60" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
          <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
          <path d="M192 384c-8.188 0-16.38-3.125-22.62-9.375l-160-160c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L192 306.8l137.4-137.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-160 160C208.4 380.9 200.2 384 192 384z" />
        </svg>
      </div>
    </div>
  </div>

  <%@ include file="common/footer.jsp" %>
  <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js"></script>
  <script>
    var up = $('#youtube').find('svg').eq(1);
    var down = $('#youtube').find('svg').eq(2);
    var currentY = 0;
    var youtubeCurrentSlide = 1;
    var youtubeMaxSlide = $('#youtube ul li').length;
    //addClone($('#youtube ul li'));
    initialSlide();

    $('#youtube ul li').on('click', function() {
      var name = $(this).find('span').eq(0).text();
      $('#youtube iframe').attr('src', "https://www.youtube.com/embed/" + name);
    });

    up.on('click', goUp);

    function goUp() {
      if (!$('#youtube ul').hasClass('Ymove')) {
        $('#youtube ul').addClass('Ymove')
      }
      currentY = currentY - 250;

      if (youtubeCurrentSlide === youtubeMaxSlide) {
        setTimeout(function() {
          $('#youtube ul').removeClass('Ymove');
          currentY = 0;

          $('#youtube ul').css({
            'transform': 'translateY(' + currentY + 'px)'
          });
          youtubeCurrentSlide = 1;
        }, 1000);
      }

      $('#youtube ul').css({
        'transform': 'translateY(' + currentY + 'px)'
      });
      youtubeCurrentSlide++;
      console.log(youtubeCurrentSlide + ", " + youtubeMaxSlide);

      up.off('click'); //이벤트를 없애고
      setTimeout(function() {
        up.on('click', goUp);
      }, 1000);
    }

    down.on('click', goDown);

    function goDown() {
      console.log(youtubeCurrentSlide + ", " + youtubeMaxSlide);
      if (!$('#youtube ul').hasClass('Ymove')) {
        $('#youtube ul').addClass('Ymove')
      }
      currentY = currentY + 250;

      if (youtubeCurrentSlide === -(youtubeMaxSlide - 2)) {
        setTimeout(function() {
          $('#youtube ul').removeClass('Ymove');
          currentY = 0;

          $('#youtube ul').css({
            'transform': 'translateY(' + currentY + 'px)'
          });
          youtubeCurrentSlide = 1;
        }, 1000);
      }

      $('#youtube ul').css({
        'transform': 'translateY(' + currentY + 'px)'
      });
      youtubeCurrentSlide--;

      down.off('click'); //이벤트를 없애고
      setTimeout(function() {
        down.on('click', goDown);
      }, 1000);
    }

    function initialSlide() {
      var clone1 = $('#youtube ul li').clone(true);
      var clone2 = $('#youtube ul li').clone(true);

      $('.slide-wrap ul').prepend(clone1.addClass('clone'));
      $('.slide-wrap ul').append(clone2.addClass('clone'));

      $('.slide-wrap ul').css({
        'top': '-1000px'
      });
    }
  </script>
    
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
  <script>
    var today_x = 0;
    var maxSlideCount = $('#today-pick ul li').length;
    var today_currentSlide = 1;
    var today_SlideMargin = 500;
    var today_SlideWidth = 448;
    var today_moveWidth = today_SlideMargin + today_SlideWidth;
    var ul = $('#today-pick ul');

    makeClone(ul);

    setInterval(todayMove, 3000);

    function makeClone(tag) {
      tag.append(tag.children().first().clone(true));
    }

    function moveTranslateX(tag, x) {
      tag.css({
        'transform': 'translateX(' + x + 'px)'
      });
    }

    function todayMove() {
      if (!ul.hasClass('today-pick-ani')) {
        ul.addClass('today-pick-ani');
      }

      today_x = today_x - today_moveWidth;

      if (today_currentSlide === maxSlideCount) {
        setTimeout(function() {
          ul.removeClass('today-pick-ani');
          today_x = 0;
          moveTranslateX(ul, today_x);
        }, 700);

        today_currentSlide = 0;
      }

      moveTranslateX(ul, today_x);

      today_currentSlide = today_currentSlide + 1;
    }
  </script>
  <script>
    var x = 0;
    var maxSlide = $(".purchase").length / 8;
    var currentSlide = 1;

    if (!Number.isInteger(maxSlide)) {
      maxSlide = parseInt(maxSlide) + 1;
    }

    $("#go_left").on('click', function() {
      console.log("left : " + currentSlide);
      if (currentSlide > 1) {
        currentSlide = currentSlide - 1;
        x = x + 1000;
        console.log("x : " + x);
        $("#purchase-list ul").css({
          'transform': 'translateX(' + x + 'px)'
        });
      } else {
        $("#go_left").removeClass('shake');
        $("#go_left").offset().left;
        $("#go_left").addClass('shake');
      }
    });

    $("#go_right").on('click', function() {
      console.log("right : " + currentSlide);
      if (currentSlide < maxSlide) {
        currentSlide = currentSlide + 1;
        x = x - 1000;
        console.log("x : " + x);
        $("#purchase-list ul").css({
          'transform': 'translateX(' + x + 'px)'
        });
      } else {
        $("#go_right").removeClass('shake');
        $("#go_right").offset().left;
        $("#go_right").addClass('shake');
      }
    });
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