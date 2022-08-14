<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HOMEART</title>
  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="DashboardKit is made using Bootstrap 5 design framework. Download the free admin template & use it for your project.">
    <meta name="keywords" content="DashboardKit, Dashboard Kit, Dashboard UI Kit, Bootstrap 5, Admin Template, Admin Dashboard, CRM, CMS, Free Bootstrap Admin Template">
    <meta name="author" content="DashboardKit ">
	
	
	

    <!-- Favicon icon -->
    <link rel="icon" href="resources/css/noticeCss/images/favicon.svg" type="image/x-icon">

    <!-- font css -->
    <link rel="stylesheet" href="resources/css/noticeCss/fonts/feather.css">
    <link rel="stylesheet" href="resources/css/noticeCss/fontawesome.css">
    <link rel="stylesheet" href="resources/css/noticeCss/material.css">

    <!-- vendor css -->
    <link rel="stylesheet" href="resources/css/noticeCss/style.css" id="main-style-link">

<style>

.na {margin-left:auto; margin-right:auto; text-align: center; color:"white"}
.menu {
		display:inline-block; background:#4F8CD1; color:"white"; text-align:center;
		line-height:50px; width:150px; height:50px; border-radius:10px;
		margin-left: 5%; margin-right: 5%; font-weight:bold; font-size:20px;
	}
	.menu:hover {font-weight: bolder; cursor:pointer;}

#button{
		 background:#4F8CD1;
		 
	}
	
	
	




.row{width: 1320px;
      height: 300px;
      margin: 0 auto;
      margin-left: 30px;}


.content {width: 1500px;}


</style>


</head>

<body class="">


	<!-- [ Pre-loader ] start -->
	<div class="loader-bg">
	
		<div class="loader-track">
			<div class="loader-fill"></div>
		</div>
	</div>
	<!-- [ Pre-loader ] End -->
	<!-- [ Mobile header ] start -->
	<div class="pc-mob-header pc-header">
		<div class="pcm-logo">
			<img src="resources/css/noticeCss/images/logo.svg" alt="" class="logo logo-lg">
		</div>
		<div class="pcm-toolbar">
			<a href="#!" class="pc-head-link" id="mobile-collapse">
				<div class="hamburger hamburger--arrowturn">
					<div class="hamburger-box">
						<div class="hamburger-inner"></div>
					</div>
				</div>
			</a>
			<a href="#!" class="pc-head-link" id="headerdrp-collapse">
				<i data-feather="align-right"></i>
			</a>
			<a href="#!" class="pc-head-link" id="header-collapse">
				<i data-feather="more-vertical"></i>
			</a>
		</div>
	</div>
	<!-- [ Mobile header ] End -->

	
	<!-- [ navigation menu ] end -->
	

<!-- [ Main Content ] start -->


<section class="pc-container">
    
      
        <!-- [ Main Content ] start -->
        <div class="row">
            <!-- [ sample-page ] start -->
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h2>고객센터 평일 09:00 ~ 18:00</h2>
                        <br>
                        <h4>주말 / 공휴일 휴무</h4>
                    </div>
                    <div class="card-body">
                        <h4>☎1588-4415
                        </h4>
                    </div>
                 </div>
           	 </div>
        
        
       
			<div class="na">
			
				<div class="menu"><a href="nlist.no" style = "color:white">주문/결제</a></div>
				<div class="menu"><a href="nlist2.no" style = "color:white">배송관련</a></div>
				<div class="menu"><a href="nlist3.no" style = "color:white">취소/환불</a></div>
				<div class="menu"><a href="nlist4.no" style = "color:white">반품/교환</a></div>
			
			 
		
			</div>
		
		
		<br><br><br>
		
        
        
        
     
        
            
            <!-- [ Hover-table ] start -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4>주문/결제</h4>
                        
                    </div>
                    <div class="card-body table-border-style" align="center">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead align = "center">
                                    <tr>
                                        <th>No</th>
                                        <th>내용</th>
                                        <th>조회수</th>
                                        <th>작성일</th>
                                        
                                    </tr>
                                </thead>
                                
                                <tbody align = "center">
                                
                                
                                
                                
      <c:forEach var="n" items="${ list }">
		 <tr class="contentTr">
	         <td align="center">${ n.noticeNo }</td>
	         <td align="center">${ n.noticeTitle }</td>
	       	 <td align="center">${ n.views }</td>
	         <td align="center">${ n.NCreateDate }</td>
	      </tr>
      </c:forEach>
        
        
        
     </tbody>
      <!-- 페이징 처리 -->
      <tr align="center" height="20" id="buttonTab">
         <td colspan="6">
         
            <!-- [이전] -->
            <c:if test="${ pi.currentPage <= 1 }">
               &lt; &nbsp;
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
               <c:url var="before" value="nlist.no">
                  <c:param name="page" value="${ pi.currentPage - 1 }"/>
               </c:url>
               <a href="${ before }">[이전]</a> &nbsp;
            </c:if>
            
            <!-- 페이지 -->
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
               <c:if test="${ p eq pi.currentPage }">
                  <font color="red" size="4"><b>[${ p }]</b></font>
               </c:if>
               
               <c:if test="${ p ne pi.currentPage }">
                  <c:url var="pagination" value="nlist.no">
                     <c:param name="page" value="${ p }"/>
                  </c:url>
                  <a href="${ pagination }">${ p }</a> &nbsp;
               </c:if>
            </c:forEach>
            
            <!-- [다음] -->
            <c:if test="${ pi.currentPage >= pi.maxPage }">
               [다음]
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
               <c:url var="after" value="nlist.no">
                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
               </c:url> 
               <a href="${ after }">&gt;</a>
            </c:if>
         </td>
      </tr>
      
      <tr>
         <td colspan="6" align="right" id="buttonTab">
            <c:if test="${ loginUser.id eq 'admin1'}">
               &nbsp; &nbsp; &nbsp;
               <button style="color: white" id = "button" type="button" class="btn" onclick="location.href='ninsertView.no';">글쓰기</button>
            </c:if>
         </td>
      </tr>
      
                                   
                                   
                            </table>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Hover-table ] end -->
            
            <!-- [ Hover-table ] start -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                       <img src="resources/css/noticeCss/images/order.png" width="580px" height="490px">
                        
                        
                    </div>
                   
                </div>
            </div>
            <!-- [ Hover-table ] end -->
            
           
            
            
        </div>
        <!-- [ Main Content ] end -->
    </div>
    
    
</section>

<!-- [ Main Content ] end -->
   
   	
   	
    <!-- Required Js -->
    <script src="resources/css/noticeCss/js/vendor-all.min.js"></script>
    <script src="resources/css/noticeCss/js/plugins/bootstrap.min.js"></script>
    <script src="resources/css/noticeCss/js/plugins/feather.min.js"></script>
    <script src="resources/css/noticeCss/js/pcoded.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script> -->
    <!-- <script src="assets/js/plugins/clipboard.min.js"></script> -->
    <!-- <script src="assets/js/uikit.min.js"></script> -->

	
	<script>
      $('.contentTr').find("td").click(function() {
         var nId = $(this).parent().children('td').eq(0).text();
         location.href = 'ndetail.no?nId=' + nId + "&page=" + ${pi.currentPage};
      });    
   </script>








</body>

</html>
