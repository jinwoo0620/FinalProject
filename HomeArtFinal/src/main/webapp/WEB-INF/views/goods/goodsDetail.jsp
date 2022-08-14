<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');
	
	*{
		margin: 0;
		padding: 0;
	}
	
	body { 
		padding: 50px;
		font-family: 'Noto Sans KR', sans-serif;
		min-width: 1130px;
	 }
	 
	 .comname{ 
	 	color: rgb(100, 111, 124);
	 	white-space: normal;
	 	word-break: break-all;
	 	
	  }
	
	.productname{
		color: rgb(51, 60, 69);
		white-space: normal;
		word-break: break-all;
	}
	
	.product_view { position: relative; padding: 0 0 0 395px; width: 1130px; box-sizing: border-box; margin: auto;}
	.product_view .img { position: absolute; left: 0; top: 0; }
	.product_view .img > img { width: 369px; height: 400px; border: 1px solid #e8e8e8;}
	.product_view .img li:after { content: ""; display: block; clear:both;}
	.product_view .img li { float: left; padding: 10px 10px 0 0;}
	.product_view .img li.on img{ border-color: #0a55a9;}
	.product_view .img li img { width: 68px; height: 68px; border: 1px solid #e8e8e8;}
	.product_view h2{ padding: 0 0 20px; border-bottom: 2px solid #333; font-size: 24px; color: #232323; line-height: 26px; }
	.product_view table th,
	.product_view table td{ padding: 14px 0; margin: 0 0 15px 0; font-size: 15px; color: #444; text-align: left;}
	/* .product_view table th{ font-size: 15px; color: #444; text-align: left;} */
	/* .product_view table th{ font-size: 14px; color: #444;} */ /*td는 기본이 왼쪽 정렬*/
	.product_view table td.price{ font-size: 22px; }
	.product_view table td.total{ font-size: 19px; /* color: #0a56a9; */ color: rgb(49, 49, 49);}
	.product_view table td.total b { font-size: 22px; }
	/* .product_view table .length { position: relative; border: 1px solid #c6c6c6; width: 74px; height: 32px;} */
	/* .product_view table .length select{ width: 44px; border: none; height: 32px;} */
 	.product_view table select { width: 100%; border: 1px solid #c6c6c6; box-sizing: border-box; } 
	.product_view .btns{ text-align: center; padding: 45px 10px 0; margin: 10 0 0 0px;}
	/* .product_view. btns > a { display: inline-block; width: 136px; height: 42px; font-size: 16px; color: #fff;
							  border-radius: 2px; line-height: 42px;} */
	/* .product_view .btns > a.btn1 { background: #666; }
	.product_view .btns > a.btn1 { background: #0a56a9; }
	.img1{  }
	 */
	 
	 .btn1{ text-decoration: none; background: #fff; color: rgb(79,140,209); cursor: pointer; 
	 	    border: 0.0625rem solid #4f8cd1;  border-color: rgb(79, 140, 209); border-radius: 5px; font-size: 25px;
	 		padding: 5px 25px 5px 25px; margin: 0px 15px 0px 0px;}
	 .btn2{ text-decoration: none; background: rgb(79, 140, 209); color: #fff; cursor: pointer; 
	 	    /* border: 0.0625rem solid #4f8cd1; */ border: none; border-radius: 5px; font-size: 25px;
	 	    padding: 5px 25px 5px 25px;}
	 /* .btns{ padding: 1px;} */
	 
	 .btn3{
	 	text-decoration: none;
	 	background: #fff;
	 	color: red;
	 	cursor: pointer;
	 	border: 0.0625rem solid red; 
	 	border-color: red;
	 	border-radius: 5px;
	 	font-size: 25px; 
	 	padding: 5px 25px 5px 25px; margin: 0px 15px 0px 0px;
	 }
	 
	 .btn4{
	 	text-decoration: none;
	 	background: #fff;
	 	color: #4F8CD1;
	 	cursor: pointer;
	 	border: 0.0625rem solid #4F8CD1; 
	 	border-color: #4F8CD1;
	 	border-radius: 5px;
	 	font-size: 25px; 
	 	padding: 5px 25px 5px 25px; margin: 0px 15px 0px 0px;
	 
	 }
	 
	 #deletebuttonarea{
	 	display: center;
	 	margin-left: 680px;
	 }
	 
	 .commerce-title h2{
	 	font-size: 20px;
	 	font-weight: bold;
	 	letter-spacing: 1px;
	 	padding: 30px 0 10px;
	 	margin-bottom: 30px;
	 	text-align: left;
	 	border-bottom: 1px solid #ccc;
	 }
	 
	 .part2{
	 	width: 1130px;
	 	margin: auto;
	 	padding: 20px; 
	 }
	 
		 #myform fieldset{
	    display: inline-block;
	    direction: rtl;
	    border:0;
		}
		#myform fieldset legend{
		    text-align: right;
		}
		#myform input[type=radio]{
		    display: none;
		}
		#myform label{
		    font-size: 3em;
		    color: transparent;
		    text-shadow: 0 0 0 #f0f0f0;
		}
		#myform label:hover{
		    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
		}
		#myform label:hover ~ label{
		    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
		}
		#myform input[type=radio]:checked ~ label{
		    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
		}
		#reviewContents {
		    width: 100%;
		    height: 150px;
		    padding: 10px;
		    box-sizing: border-box;
		    border: solid 1.5px #D3D3D3;
		    border-radius: 5px;
		    font-size: 16px;
		    resize: none;
		}
	 
	 
	  	 
	 
</style>

</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	<form action="gupView.go" method="post">
	<div class="product_view">
		
		<h2 class="productname">${ goods.goodsTitle }
			<input type="hidden" value="${ goods.goodsTitle }" name="goodsTitle">
		</h2>
		<table>
			
			<colgroup>
			<col style="width: 173px;">
			<col>
			</colgroup>
			<tbody>
				<tr>
					<th>판매가</th>
					<td class="price"><fmt:formatNumber value="${ goods.goodsPrice }" pattern="#,###"/>
						<input type="hidden" value="${ goods.goodsPrice }" name="goodsPrice">
					</td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td>${ goods.goodsId }
					</td>
					<input type="hidden" value="${ goods.goodsId }" name="goodsId">
				</tr>
				<tr>
					<th>제조사/공급사</th>
					<td>${ goods.goodsCompany }
						<input type="hidden" value="${ goods.goodsCompany }" name="goodsCompany">
					</td>
				</tr>
				<tr>
				<th>구매수량</th>
				<td>
					<div class="length" width="70px;">
					  <input type="text" class="quantity_input" name="goodsCount" value="1"/>
                  		<span>
                     		<button type="button" class="plus_btn">+</button>
                     		<button type="button" class="minus_btn">-</button>
                  		</span>
			     	</div>
				</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>3만원 이상 무료배송</td>
				</tr>
				<tr>
					<th>결제방식</th>
					<td>선불</td>
				</tr>
				<tr>
					<th>결제금액</th>
					<td class="total"><b><fmt:formatNumber value="${ goods.goodsPrice }" pattern="#,###"/></b></td>
				</tr>
			</tbody>
			
		</table>
		<div class="img">
		
			<!-- 썸네일 이미지 부분 -->
			<c:forEach var="ga" items="${ goodsAtt }">
				<input type="hidden" value="${ ga.renameFileName }" name="uploadFile1" >

        	<c:if test="${ ga.goodsId == goods.goodsId && ga.thumbNail == 0}">
        		
        	<img src="${ pageContext.servletContext.contextPath }/resources/buploadFiles/${ ga.renameFileName }">
        	<input type="hidden" name="thumbFileNo" value="${ ga.fileNo }"> 
        	</c:if>
        	</c:forEach>
			
			
		</div>
		<div>
			<button type="button" class="btn1" id="add-cart-btn">장바구니</button>
			<a href="#a" class="btn2">구매하기</a>
		</div>
		</div>
		
		<div class="part2">
			<!-- ::before -->
			<div class="commerce-title">
				<h2>제품 설명</h2>
			</div>
			<div class="view-body">
				<p style="margin 1em 0px; line-height: 1.6;">&nbsp;</p>
				<p>
					<c:forEach var="ga" items="${ goodsAtt }">
						
						 <input type="hidden" value="${ ga.renameFileName }" name="uploadFiles2"> 
		        	<c:if test="${ ga.goodsId == goods.goodsId && ga.thumbNail == 1}">
		        		 
		        	<img src="${ pageContext.servletContext.contextPath }/resources/buploadFiles/${ ga.renameFileName }"> 
		        	<input type="hidden" name="detailFileNo" value="${ ga.fileNo }"> 
		        	</c:if>
		        	</c:forEach>
					
				</p>
				<p style="margin: 1em 0px; line-height: 1.6;">&nbsp;</p>
				
				
				<p style="margin: 1em 0px; line-height: 1.6;">&nbsp;</p>
				<p style="margin: 1em 0px; line-height: 1.6;">&nbsp;</p>
				<p style="margin: 1em 0px; line-height: 1.6;">&nbsp;</p>
				<p style="margin: 1em 0px; line-height: 1.6;">&nbsp;</p>
			<!-- ::after -->
			</div>
		</div>
		
			<c:url var="gdelete" value="gdelete.go">
					<c:param name="gId" value="${ goods.goodsId }"/>
						<c:forEach var="ga" items="${ goodsAtt }">
							<c:if test="${ ga.goodsId == goods.goodsId && ga.thumbNail == 0}">
							<c:param name="uploadFile1" value="${ ga.renameFileName }"/>
							</c:if>
							<c:if test="${ ga.goodsId == goods.goodsId && ga.thumbNail == 1}">
							<c:param name="uploadFiles2" value="${ ga.renameFileName }"/>
							</c:if>
						</c:forEach>
			</c:url>
		
		
			<c:if test="${loginUser.power == 2 }">
			<div id="deletebuttonarea">
				<button type="button" class="btn3" onclick="location.href='${ gdelete }'">삭제하기</button>
				<button class="btn4" >수정하기</button>
			</div>
			</c:if>
		</form>	
		
			<%@ include file="../common/footer.jsp" %>
		<script>
			//장바구니버튼
// 			$('#add-cart-btn').on("click", function(){
// 				$('form').attr("action", "insert.ca");
// 				$('form').submit();
// 			});
		
		
		   // 수량 버튼 조작
	      let quantity = $(".quantity_input").val();
	      $(".plus_btn").on("click", function(){
	         $(".quantity_input").val(++quantity);
	      });
	      $(".minus_btn").on("click", function(){
	         if(quantity > 1){
	            $(".quantity_input").val(--quantity);   
	         }
	      });
	      /*
	      // 서버로 전송할 데이터
	      var form = {
	            member_id : '${loginUser.id}',
	            product_id : '${goods.goodsId}',
	            product_count : ''
	            
	     
	    
	      }
	      console.log(form);
	      
	      // 장바구니 추가 버튼
	      $('#add-cart-btn').on("click", function(e){
	         form.product_count = $(".quantity_input").val();
	         $.ajax({
	            url: 'insert.ca',
	            type: 'POST',
	            data: form,
	            success: function(result){
	            	console.log(result);
	            	if(result == "login"){
	            		alert("로그인이 필요한 서비스입니다.");
	            		location.href="loginView.me";
	            	}
	               cartAlert(result);
	            },
	            error: function(result){
	            	console.log(result);
	            }
	         })
	      });
	      
	      function cartAlert(result){
	         if(result == '0'){
	            alert("장바구니에 추가를 하지 못하였습니다.");
	         } else if(result == '1'){
	            alert("장바구니에 추가되었습니다.");
	         } else if(result == '2'){
	            alert("장바구니에 이미 추가되어져 있습니다.");
	         } else if(result == '5'){
	            alert("로그인이 필요합니다.");   
	         }
	      } */
	   
	      
	      //장바구니버튼
	      
	      $('#add-cart-btn').on("click", function(){
	    	  var goodsId = ${ goods.goodsId };
	    	  $.ajax({
	    		 url: 'dulplcheck.ca',
	    		 type: 'POST',
	    		 data: {goodsId : goodsId},
	    		 success: function(data){
	    			 console.log(data);
    				 if(data > 0){
    					 alert("장바구니에 이미 등록된 상품이 있습니다.");
    				 } else {
    					 $('form').attr("action", "insert.ca");
    					 $('form').submit();
    				 }
   				 },
	    	     error: function(data){
	    	    	 console.log(data);
	    	     }
	    				 
	    		
	    	  });
	      });
	      
	      </script>

	
	
		
</body>
</html>