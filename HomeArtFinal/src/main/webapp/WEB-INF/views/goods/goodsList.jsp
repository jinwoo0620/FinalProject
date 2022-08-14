<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
 <style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');
    
    * {
  box-sizing: border-box;
   }

   body {
     margin: 0;
     min-width: 1320px;
     font-family: 'Noto Sans KR', sans-serif;
   }



   body > h1{
     text-align: center;
     margin-top: 60px;
     margin-bottom: 60px;
     font-size: 24px;
     font-style: bold;
     color: #545454;
     
   }
   
   .products {
     margin-left: auto;
     margin-right: auto;
     padding: 0;
     width: 800px;
     text-align: center;
   }
   
   .products img{
     width: 225px;
     height: 225px;
     margin-right: 20px;
     margin-bottom: 20px;
   }
   
   .products a{
     text-decoration: none;
     color: black;
     float: left;
     font-size: 16px;
   }
   
   .price{
     margin-top: 4px;
     margin-bottom: 80px;
   }
   
   .clearfix{
     clear: both;
   }
   
   .footer{
     text-align: center;
   }
   
   .footer img{
     margin-top: 40px;
     height: 20px;
     margin-bottom: 80px;
     margin-left: 10px;
     margin-right: 10px;
   }
   

    
    .btn{
       color: #007bff;
       border-color: #007bff;
       diaplay: inline-block;
       font-weight: 400;
       text-align: center;
       vertical-align: middle;
       user-select: none;
       background-color: transparent;
       border: 1px solid transparent;
    /*    padding-top: 0.375rem;
       padding-right: 0.75rem;
       padding-bottom: 0.375rem;
       padding-left: 0.75rem; */
       font-size:; 1rem;
       ling-height: 1.5;
       border-radius: 0.25rem;
       transition: color .15s;
       transtion-property: color, background-color, border-color, box-shadow;
       transition-duration: 0.15s, 0.15s, 0.15s, 0.15s;
       transition-timing-function: ease-in-out, ease-in-out, ease-in-out, ease-in-out;
       transition-delay: 0s, 0s, 0s, 0s;
       padding: 10px;
    }
    
    .btn{
       position: fixed;
       bottom: 40px;
       right: 40px;
       width: 100px;
       overflow: visible;
       margin: 0;
       font-family: inherit;
       padding:10px;
    }
    
    .gContent{
       display: inline-block;
    }
    
   
    
    
    </style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <h1>Our new Products</h1>
    <div class="products">
      
     
      
      <c:forEach var="l" items="${ list }">
      <div class="gContent" style="cursor: pointer;">
         <input type="hidden" name="goodsId" value="${ l.goodsId }">
           <c:forEach var="l1" items="${ list1 }">
           <c:if test="${ l1.goodsId == l.goodsId }">
           <img src="${ pageContext.servletContext.contextPath }/resources/buploadFiles/${ l1.renameFileName }"> 
           </c:if>
           </c:forEach>
           <p>${ l.goodsTitle }</p>
           <p class="price"><fmt:formatNumber value="${ l.goodsPrice }" pattern="#,###"/>원</p><!-- 1000단위에 대해 나눠줌 -->
      </div>
      </c:forEach>
     
       <%-- <c:if test="${loginUser.power == 0 }">
            일반유저임         
      </c:if>
      <c:if test="${loginUser.power == 1 }">
            전문가유저임         
      </c:if>
      <c:if test="${loginUser.power == 2 }">
            관리자임         
      </c:if>
      <c:if test="${loginUser.power == null }">
            세션없음         
      </c:if> --%>
      
      <c:if test="${loginUser.power == 2}">
    <div class="btn">
       <input type="button" class="button" onclick="location.href='ginsertView.go';" id="writeGoods" value="+">
    </div>
    </c:if>
    
    
    <div class="clearfix"></div>
    </div>
  </body>
     <%@ include file="../common/footer.jsp" %>
  <script>
     $('.gContent').click(function(){
        var gId = $(this).children().eq(0).val();
        
        console.log(gId);
         location.href='gdetail.go?gId=' + gId; 
        
     });
  
     
     
  
  </script>


</html>