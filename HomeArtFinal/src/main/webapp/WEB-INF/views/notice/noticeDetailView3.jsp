<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>HomeArt</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 11]>
    	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    	<![endif]-->
    <!-- Meta -->
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
    <link rel="stylesheet" href="resources/css/noticeCss/fonts/fontawesome.css">
    <link rel="stylesheet" href="resources/css/noticeCss/fonts/material.css">

    <!-- vendor css -->
    <link rel="stylesheet" href="resources/css/noticeCss/style.css" id="main-style-link">

<style>
	#button{
		 background:#4F8CD1;
		 font-color:red;
	}
	
	.replyTable{margin: auto; width: 500px;}
	
	.row{width: 1320px;
      height: 300px;
      margin: 0 auto;
      margin-left: 30px;}
	
	.na {margin-left:auto; margin-right:auto; text-align: center; color:"white"}
	.menu {
		display:inline-block; background:#4F8CD1; color:"white"; text-align:center;
		line-height:50px; width:150px; height:50px; border-radius:10px;
		margin-left: 5%; margin-right: 5%;
	}
	.menu:hover {font-weight: bolder; cursor:pointer;}
</style>



</head>

<body class="">
	
	

	
	

<!-- [ Main Content ] start -->
<div class="pc-container">
    <div class="pcoded-content">
       
        <!-- [ Main Content ] start -->
        <div class="row">
            <!-- [ sample-page ] start -->
            <div class="col-sm-12">
            <form action="nupView3.no" method="post">
                <div class="card">
                    <div class="card-header">
                    
                        <div>
							<h3>${ notice3.noticeTitle3 }</h3>
							<input type="hidden" value="${ notice3.noticeTitle3 }" name="noticeTitle3">
							<input type="hidden" value="${ notice3.noticeNo3 }" name="noticeNo3">	
							<input type="hidden" value="${ page }" name="page">
						</div>
						<c:url var="ndelete3" value="ndelete3.no">
							<c:param name="nId" value="${ notice3.noticeNo3 }"/>
						</c:url>
                        <c:if test="${ loginUser.id eq notice3.writer3 }">
	                       <div align ="right">
		                        <button style="color: white" id = "button" type="submit" class="btn">수정</button>
		                        <button style="color: white" id = "button" type="button" class="btn" onclick="location.href='${ ndelete3 }'">삭제</button>
	                       </div>
                        </c:if>
                    </div>
                    <div class="card-body">
                        <% pageContext.setAttribute("newLineChar", "\r\n"); %>
					<div>
						${ fn:replace(notice3.noticeContent3, newLineChar, "<br>") }
						<input type="hidden" value="${ notice3.noticeContent3 }" name="noticeContent3">
					</div>
                    </div>
                 </div>
                 </form>
           	 </div>
         	  
            
            <!-- [ sample-page ] end -->
        <div class="col-sm-12" >
        <div class="card">
             <div class="card-header">
                        <h5>댓글<input type="text" class="form-control" id="replyContent3"></h5>
                        <br>
                        <div align="right"><button style="background: #4F8CD1; color: white" id = "rSubmit" class="btn" >등록</button></div>
            
              <table align="left" class="replyTable" id="rtb">
        		<thead>
        				<tr>
        					<td colspan="2"><b id= "rCount"></b></td>
        				</tr>
        			</thead>
        				<tbody align="left"></tbody>
        				<hr>
      		  </table>   
                 
                        
             </div>
        </div>
        </div>
         <div class="na">
			<div class="menu" ><a href="nlist3.no" style = "color:white">이전으로</a></div>
		</div>
        
      </div>
        
        <script>
        	 $('#rSubmit').click(function(){
        		var rContent = $('#replyContent3').val();
        		var refNId = ${notice3.noticeNo3};
        		
        		
        		$.ajax({
        			url: 'addReply3.no',
        			data: {replyContent3:rContent, boardNo3:refNId},
        			success: function(data){
        				console.log(data);
        				
        				if(data == 'success'){
        					$('#replyContent3').val('');
        					alert("댓글이 등록 되었습니다.")
        				}
        			},
        			error: function(data){
        				console.log(data);
        			}
        		});
        	}); 
        	
        	
        	   function getReplyList(){
        		$.ajax({
        			url: 'rList3.no',
        			data: {nId:${notice3.noticeNo3}},
        			success: function(data){
        				console.log(data);
        			
        				$tableBody = $('#rtb tbody');
        				$tableBody.html('');
        				
        				var $tr;
        				var $memberId;
        				var $content;
        				var $date; 
        				
        				
        				
        				if(data.length > 0){
        					for(var i in data){
        						$tr = $('<tr>');
        						$memberId = $('<td>').css('width', '100px').text(data[i].memberId3);
        						$content = $('<td>').text(data[i].replyContent3);
        						$date = $('<td width="100px">').text(data[i].createDate3);
        						
        						$tr.append($memberId);
        						$tr.append($content);
        						$tr.append($date);
        						$tableBody.append($tr);
        					}
        				} else{
        					$tr = $('<tr>');
        					$content = $('<td colspan="3">').text('등록된 댓글이 없습니다.');
        					
        					$tr.append($content);
        					$tableBody.append($tr);
        				}
        				
        			},
        			error: function(data){
        				console.log(data);
        			}
        		});
          	}
        	
        	$(function(){
        		getReplyList3();
        		
        		setInterval(function(){
        			getReplyList3();
        		}, 1000);
        	}); 
        	
            	 
        </script>
        
        
        
        
        <!-- [ Main Content ] end -->
    </div>
</div>
<!-- [ Main Content ] end -->
   
    <!-- Required Js -->
    <script src="resources/css/noticeCss/js/vendor-all.min.js"></script>
    <script src="resources/css/noticeCss/js/plugins/bootstrap.min.js"></script>
    <script src="resources/css/noticeCss/js/plugins/feather.min.js"></script>
    <script src="resources/css/noticeCss/js/pcoded.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script> -->
    <!-- <script src="assets/js/plugins/clipboard.min.js"></script> -->
    <!-- <script src="assets/js/uikit.min.js"></script> -->



</body>

</html>
