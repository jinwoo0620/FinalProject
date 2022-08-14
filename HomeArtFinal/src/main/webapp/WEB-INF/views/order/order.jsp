<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<link href="${path}/resources/css/order.css" rel="stylesheet" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Order</title>
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<style>
@charset "UTF-8";
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@200;300;400&family=Noto+Serif+KR:wght@500&display=swap');

	* {
	   margin: 0;
	   padding: 0;
	   box-sizing: border-box;
	   font-family: 'Gowun Dodum', sans-serif;
	}
	
	a {
	   text-decoration: none;
	}
	
	
	/* 제품 목록 네비 */
	.navi_bar_area {
	   width: 100%;
	   height: 70px;
	   background-color: #7696fd;
	}
	
	/* 홈페이지 메인 제품 목록  */
	.content_area {
	   margin: 0 auto; 
	   width: 1130px;
	}
	
	table {
	   border-collapse: collapse;
	   width: 100%;
	}
	
	.table_text_align_center {
	   text-align: center;
	}
	
	caption {
	   visibility: hidden;
	   width: 0;
	   height: 0;
	   font-size: 0;
	   line-height: 0;
	   overflow: hidden;
	}
	
	.content_subject {
	   height: 110px;
	   line-height: 110px;
	   background-color: #5080bd;
	   margin-bottom: 60px;
	}
	
	.content_subject span {
	   padding-left: 30 px;
	   display: inline-block;
	   color: white;
	   font-size: 50px;
	   font-weight: bolder;
	}
	
	/* content_main */
	.content_main {
	   min-height: 700px;
	   padding-right: 350px;
	   position: relative;
	}
	
	table {
	   border-collapse: collapse;
	}
	
	/* 사용자 정보  */
	.memberInfo_table {
	   width: 100%;
	   border-spacing: 0;
	   border-top: 2px solid #363636;
	   border-bottom: 1px solid #b6b6b6;
	}
	
	.member_info_div td {
	   padding: 12px;
	   text-align: left;
	}
	
	/* 사용자 주소 정보 */
	.addressInfo_div {
	   margin-top: 30px;
	}
	
	.addressInfo_input_div_wrap {
	   border-bottom: 1px solid #f3f3f3;
	   height: 225px;
	}
	
	.address_btn {
	   background-color: #555;
	   color: white;
	   float: left;
	   border: none;
	   outline: none;
	   cursor: pointer;
	   padding: 14px 16px;
	   font-size: 17px;
	   width: 50%;
	}
	
	.address_btn:hover {
	   background-color: #777;
	}
	
	.addressInfo_button_div::after {
	   content: '';
	   display: block;
	   clear: both;
	}
	
	.addressInfo_input_div {
	   padding: 12px;
	   text-align: left;
	   display: none;
	   line-height: 40px;
	}
	
	.addressInfo_input_div th {
	   border-color: transparent;
	   background-color: transparent;
	}
	
	.addressInfo_input_div th {
	   padding: 12px 5px 12px 20px;
	   vertical-align: top;
	}
	
	.addressInfo_input_div td {
	   padding: 8px 12px;
	}
	
	.addressInfo_input_div_2 input {
	   padding: 6px 5px;
	}
	
	.address_search_btn {
	   vertical-align: middle;
	   display: inline-block;
	   border: 1px solid #aaa;
	   width: 90px;
	   text-align: center;
	   height: 30px;
	   line-height: 30px;
	   color: #555;
	   cursor: pointer;
	}
	/* 주문상품 정보 */
	.orderproducts_div {
	   margin-top: 30px;
	}
	
	.products_kind_div {
	   font-size: 25px;
	   line-height: 35px;
	   font-weight: bold;
	}
	
	.products_subject_table {
	   font-size: 14px;
	   line-height: 20px;
	   width: 100%;
	   text-align: center;
	}
	
	.products_subject_table th {
	   text-align: center;
	   color: #333;
	   border-bottom: 1px solid #e7e7e7;
	   border-top: 2px solid #3084d9;
	   background: #f4f9fd;
	   padding: 2px 0;
	}
	
	.products_table {
	   font-size: 14px;
	   line-height: 20px;
	   border-bottom: 1px solid #e7e7e7;
	}
	
	.products_table tr {
	   height: 110px;
	}
	
	.products_table_price_td {
	   text-align: center;
	}
	
	/* 주문 종합 정보 */
	.total_info_div {
	   position: absolute;
	   top: 0;
	   right: 0;
	   width: 300px;
	   border: 1px solid #333;
	   border-top-width: 2px;
	}
	
	.total_info_price_div {
	   width: 90%;
	   margin: auto;
	   position: relative;
	}
	
	.total_info_div ul {
	   list-style: none;
	}
	
	.total_info_div li {
	   text-align: right;
	   margin-top: 10px;
	}
	
	.price_span_label {
	   float: left;
	}
	
	.price_total_li {
	   border-top: 1px solid #ddd;
	   padding-top: 20px;
	}
	
	.strong_red {
	   color: red;
	}
	
	.total_price_red {
	   font-size: 25px;
	}
	
	.total_price_label {
	   margin-top: 5px;
	}
	
	.point_li {
	   padding: 15px;
	   border-top: 1px solid #ddd;
	   margin: 10px -15px 0;
	}
	
	.total_info_btn_div {
	   border-top: 1px solid #ddd;
	   text-align: center;
	   padding: 15px 20px;
	}
	
	.order_btn {
	   display: inline-block;
	   font-size: 21px;
	   line-height: 50px;
	   width: 200px;
	   height: 50px;
	   background-color: #365fdd;
	   color: #fff;
	   font-weight: bold;
	}
	
	/* 이미지 */
	.image_wrap {
	   width: 100%;
	   height: 100%;
	}
	
	.image_wrap img {
	   max-width: 85%;
	   height: auto;
	   display: block;
	}
	
	/* 검색결과 없음 */
	.table_empty {
	   height: 50px;
	   text-align: center;
	   margin: 200px 0 215px 0px;
	   font-size: 25px;
	}
	
	/* 필터정보 */
	.search_filter {
	   width: 85%;
	   margin: auto;
	   margin-top: 30px;
	   margin-bottom: 50px;
	}
	
	.filter_button_wrap {
	   width: 100%;
	}
	
	.filter_button_wrap button {
	   width: 50%;
	}
	
	.filter_button {
	   background-color: #04AA6D;
	   border: 1px solid green;
	   color: white;
	   padding: 10px 24px;
	   cursor: pointer;
	   float: left;
	}
	
	.filter_button_wrap:after {
	   content: "";
	   clear: both;
	   display: table;
	}
	
	.filter_button_wrap button:not(:last-child) {
	   border-right: none;
	}
	
	.filter_button:hover {
	   background-color: #3e8e41;
	}
	
	.filter_active {
	   background-color: #045d3c;
	}
	
	.filter_content {
	   padding: 20px 50px 20px 50px;
	   border: 1px solid gray;
	}
	
	.filter_content a:not(:first-child) {
	   margin-left: 10px;
	}
	
	.filter_a {
	   display: block;
	}
	
	.filter_b {
	   display: none;
	}
	
	/* float 속성 해제 */
	.clearfix {
	   clear: both;
	}
	
	
	.contentWrap{
	   margin: 80px auto; 
	}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<%@ include file="../common/menubar.jsp" %>

   <div class="content_area">
   		<div class="contentWrap">
      <div class="content_subject">
         <span>장바구니</span>
      </div>

      <div class="content_main">
         <!-- 회원 정보 -->
         <div class="member_info_div">
            <table class="table_text_align_center memberInfo_table">
               <tbody>
                  <tr>
                     <th style="width: 25%;">주문자</th>
                     <td style="width: *">${loginUser.id}</td>
                  </tr>
               </tbody>
            </table>
         </div>

         <!-- 배송지 정보 -->
         <div class="addressInfo_div">
            <div class="addressInfo_button_div">
               <button class="address_btn address_btn_1" onclick="showAdress('1')"
                  style="background-color: #3c3838;">사용자 정보 주소록</button>
               <button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
            </div>
            <div class="addressInfo_input_div_wrap">
               <div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
                  <table>
                     <colgroup>
                        <col width="25%">
                        <col width="*">
                     </colgroup>
                     <tbody>
                        <tr>
                           <th>이름</th>
                           <td>${loginUser.name}</td>
                        </tr>
                        <tr>
                           <th>주소</th>
                           <td>${loginUser.address}
                              <!-- 추후 JS코드를 통해 사용자가 '사용자 정보 주소록' 선택했을 때 가져올 데이터가 저장된  hidden 타입의 <input> 태그 -->
                              <input class="selectAddress" value="T" type="hidden"> 
                              <input class="addressee_input" value="${loginUser.name}" type="hidden"> 
                              <input class="address1_input" type="hidden" value="${loginUser.address}"> 
<%--                               <input class="address2_input" type="hidden" value="${loginUser.address2}"> --%>
                           </td>
                        </tr>
                        <tr>
                           <th>상세 주소</th>
                          <%--  <td>${loginUser.address2}
                              <input class="selectAddress" value="T" type="hidden"> 
                              <input class="addressee_input" value="${memberInfo.name}" type="hidden"> 
                              <input class="address1_input" type="hidden" value="${memberInfo.address}"> 
                              <input class="address2_input" type="hidden" value="${memberInfo.address2}">
                           </td> --%>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div class="addressInfo_input_div addressInfo_input_div_2">
                  <table>
                     <colgroup>
                        <col width="25%">
                        <col width="*">
                     </colgroup>
                     <tbody>
                        <tr>
                           <th>이름</th>
                           <td><input class="addressee_input"></td>
                        </tr>
                        <tr>
                           <th>주소</th>
                           <td>
                              <input class="selectAddress" value="F" type="hidden">
                              <input id="address1_input" readonly="readonly"> 
                              <a onclick="execPostCode();">주소 찾기</a><br> 
                           </td>
                        </tr>
                        <tr>
                           <th>상세 주소</th>
                           <td>
                              <input class="selectAddress" value="F" type="hidden">
                              <input class="address2_input" placeholder="상세 주소">
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
         <!-- 상품 정보 -->
         <div class="orderproducts_div">
            <!-- 상품 종류 -->
            <div class="products_kind_div">
               주문 상품 
               <span class="products_kind_div_kind"></span> 종 
               <span class="products_kind_div_count"></span> 개
            </div>
            <!-- 상품 테이블 -->
            <table class="products_subject_table">
               
               <tbody>
                  <tr>
                     <th>이미지</th>
                     <th>상품 정보</th>
                     <th>판매가</th>
                  </tr>
               </tbody>
            </table>
            <table class="products_table">
               <colgroup>
                  <col width="15%">
                  <col width="45%">
                  <col width="40%">
               </colgroup>
               <tbody>
                  <c:forEach items="${list}" var="ol">
                     <tr>
                        <td>
                        <div class="image_wrap">
                           <img src="${ pageContext.servletContext.contextPath }/resources/buploadFiles/${ ol.renameFileName }">
                        </div>
                        </td>
                        <td>${ol.goodsTitle}</td>
                        <td class="products_table_price_td">
                           <fmt:formatNumber value="${ol.goodsPrice}" pattern="#,### 원" /> | 수량 ${ol.goodsCount}개
                           <br><fmt:formatNumber value="${ ol.goodsPrice }" pattern="#,### 원" />
                           <input type="hidden" class="individual_salePrice_input" value="${ol.goodsPrice}">
                           <input type="hidden" class="individual_productCount_input" value="1">
                           <input type="hidden" class="individual_totalPrice_input" value="${ol.goodsPrice}">
                           <input type="hidden" class="individual_productId_input" value="${ol.goodsId}">
                        </td>
                     </tr>                     
                     </c:forEach>

               </tbody>
            </table>
         </div>


         <!-- 주문 종합 정보 -->
         <div class="total_info_div">
            <!-- 가격 종합 정보 -->
            <div class="total_info_price_div" id="totalInfo">
               <ul>
                  <li>
                  	<span class="price_span_label">상품 금액</span> 
                  	<span class="totalPrice_span"></span> 원
                  </li>
                  <li>
                  	<span class="price_span_label">배송비</span> 
                  	<span class="delivery_price_span"></span> 원
                  </li>
                  <li class="price_total_li">
                  	<strong class="price_span_label total_price_label">최종 결제 금액</strong> 
                  	<strong class="strong_red"> <span class="total_price_red finalTotalPrice_span"> </span> 원</strong>
                  </li>
               </ul>
            </div>
            <!-- 버튼 영역 -->
            <div class="total_info_btn_div">
               <a class="order_btn">결제하기</a>
            </div>
         </div>

      </div>

      <!-- 주문 요청 form -->
<!--       <form class="order_form" action="/orders" method="post"> -->
<!--          주문자 회원번호 -->
<%--          <input name="member_id" value="${loginUser.id}" type="hidden"> --%>
<!--          주소록 & 받는이 -->
<!--          <input name="addressee" type="hidden">  -->
<!--          <input name="address" type="hidden">  -->
<!--          <input name="address2" type="hidden"> -->

         <!-- 상품 정보 -->
      </form>

   </div>
   </div>
   <script>
   
   
   
    $(document).ready(function(){
      
    	
    	
    	
    	
      /* 주문 조합정보란 최신화 */
      setTotalInfo();
       
      /* 이미지 삽입 */
//        $(".image_wrap").each(function(i, obj){
         
//          const pobj = $(obj);
         
//          if(pobj.data("product_id")){
//             const uploadPath = pobj.data("path");
//             const uuid = pobj.data("uuid");
//             const fileName = pobj.data("filename");
            
//             const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
            
//             $(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
//          } else {
//             $(this).find("img").attr('src', '/resources/img/productsNoImage.png');
//          }
         
//       });      
      
      
   }); 
   
   /* 주소입력란 버튼 동작(숨김, 등장) */
   function showAdress(className){
      /* 컨텐츠 동작 */
         /* 모두 숨기기 */
         $(".addressInfo_input_div").css('display', 'none');
         /* 컨텐츠 보이기 */
         $(".addressInfo_input_div_" + className).css('display', 'block');      
      
      /* 버튼 색상 변경 */
         /* 모든 색상 동일 */
            $(".address_btn").css('backgroundColor', '#555');
         /* 지정 색상 변경 */
            $(".address_btn_"+className).css('backgroundColor', '#3c3838');   
      /* selectAddress T/F */
         /* 모든 selectAddress F만들기 */
            $(".addressInfo_input_div").each(function(i, obj){
               $(obj).find(".selectAddress").val("F");
            });
         /* 선택한 selectAdress T만들기 */
            $(".addressInfo_input_div_" + className).find(".selectAddress").val("T");      
   }
   </script>
   
   <!-- 주소 API 가져오기 -->
   <script src=http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false></script>
   <script>   
      function execPostCode() {
         daum.postcode.load(function() {
            new daum.Postcode({
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                  
                  // 각 주소의 노출 규칙에 따라 주소를 조합
                  // 내려오는 변수가 값이 없을 땐 공백('')값을 가지므로, 이를 참고
                  var addr = ''; // 주소 변수
                  
                  // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져옴
                  if(data.userSelectedType == 'R'){
                     // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                  } else {
                     // 사용자가 지번 주소를 선택했을 경우
                     addr = data.jibunAddress;
                  }
                  
                  // 주소 정보를 해당 필드에 넣음.
                  document.getElementById('address1_input').value = addr;
                  
                  // 커서를 주소 필드로 이동
                  document.getElementById("address1_input").focus();
                  
               }
            }).open();
   
         });
      }
      
      /* 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류) */
      function setTotalInfo(){

         let totalPrice = 0;            // 총 가격
         let totalCount = 0;            // 총 개수
         let totalKind = 0;            // 총 종류
         let deliveryPrice = 0;         // 배송비
         let finalTotalPrice = 0;       // 최종 가격(총 가격 + 배송비)
         
         $(".products_table_price_td").each(function(index, element){
         // 총 가격
         totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
         // 총 개수
         totalCount += parseInt($(element).find(".individual_productCount_input").val());
         // 총 종류
         totalKind += 1;
      });
         
         /* 배송비 결정 */
      if(totalPrice >= 30000){
         deliveryPrice = 0;
      } else if(totalPrice == 0){
         deliveryPrice = 0;
      } else {
         deliveryPrice = 3000;   
      }
      
      finalTotalPrice = totalPrice + deliveryPrice;
      
      /* 값 삽입 */
      // 총 가격
      $(".totalPrice_span").text(totalPrice.toLocaleString());
      // 총 개수
      $(".products_kind_div_count").text(totalCount);
      // 총 종류
      $(".products_kind_div_kind").text(totalKind);
      // 배송비
      $(".delivery_price_span").text(deliveryPrice.toLocaleString());   
      // 최종 가격(총 가격 + 배송비)
      $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());      
		console.log(finalTotalPrice)
	
      }
      
      /* 주문 요청 */
//       $(".order_btn").on("click", function(){
//          /* 주소 정보 & 받는이*/
//          $(".addressInfo_input_div").each(function(i, obj){
//             if($(obj).find(".selectAddress").val() === 'T'){
//                $("input[name='addressee']").val($(obj).find(".addressee_input").val());
//                $("input[name='address']").val($(obj).find(".address1_input").val());
//                $("input[name='address2']").val($(obj).find(".address2_input").val());
//             }
//          });
         
         /* 상품정보 */
          let form_contents = ''; 
          $(".products_table_price_td").each(function(index, element){
             let product_id = $(element).find(".individual_productId_input").val();
             let product_count = $(element).find(".individual_productCount_input").val();
             let productId_input = "<input name='orders[" + index + "].product_id' type='hidden' value='" + product_id + "'>";
             form_contents += productId_input;
             let productCount_input = "<input name='orders[" + index + "].product_count' type='hidden' value='" + product_count + "'>";
             form_contents += productCount_input;
          });   
         
          $(".order_form").append(form_contents);   
         
//          /* 서버 전송 */
//          $(".order_form").submit();
//       });
      
      
    //  console.log('#totalInfo').children().children('li:eq(2)').children('span').text();
    //  console.log('#totalInfo').children().children('li:eq(2)').find('span');
    //console.log($('#totalInfo').children().children('li:eq(2)').find('.total_price_red finalTotalPrice_span').text());
   
   
    //$('.finalTotalPrice_span').text();
    
    //console.log($('.strong_red').text());
      $(document).ready(function(){
    	  var pay =  $(".finalTotalPrice_span").text().replace(",","");
    	  console.log(pay);
    	 
     
         var IMP = window.IMP;
      	 var code = "imp38672970"; //가맹점 식별코드
     	 IMP.init(code);
      	 
      	 $('.order_btn').click(function(e){
      		 // 결제요청
      		 
      		 IMP.request_pay({
      		 // name
      			 
      		pg: 'kakao',	 
      		pay_method: 'card',
      		merchant_uid: 'merchant_' + new Date().getTime(),
      		name: '결제', //상품명
      		amount: pay,
      		buyer_name: '${ loginUser.name }',
      		buyer_address: '${ loginUser.address}'
      		
      		}), function(rsp){
      			 if(rsp.success){
      				 var msg = '결제가 완료되었습니다.';
      				 var result = {
      						 "imp_uid": rsp.imp_uid,
      						 "merchant_uid": rsp.merchant_uid,
      						 "name": "${ loginUser.name }",
      						 "pay_date": new Date().getTime(),
      						 "amount": rsp.paid_amount, 
      						 "card_no": rsp.apply_num,
      						 "refund": 'payed'
      				 }
      				 console.log("결제성공" + msg);
      				 
      				 $.ajax({
      					url: 'order.od',
      					type: 'POST',
      					data: JSON.stringify(result,['imp_uid', 'merchant_uid', 'name', 'pay_date', 'amount', 'card_no', 'refund']),
      					contentType:'application/json;charset=utf-8',
      					dataType: 'json',
      					success: function(res){
      						
      						if(res == 1){
      							console.log("추가성공");
      							
      							//$('#pay_coupon').html(pay);
      						} else {
      							console.log("Insert fail!");
      						}
      					}, error:function(){
      						console.log("Insert ajax 통신 실패!")
      					}
      				 })//ajax
      				 
      			 }
      			 else{
      				 //결제 실패시
      				 var msg = '결제에 실패했습니다.';
      				 msg += '에러 : ' + rsp.error_msg
      			 }
      			 console.log(msg);
      		 }
      		
      	 });
      	
      });
      
   </script>
</body>
</html>