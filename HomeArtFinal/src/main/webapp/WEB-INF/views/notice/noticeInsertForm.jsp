<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>HomeArt</title>
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

<body>
	

<!-- [ Main Content ] start -->
<div class="pc-container">
    <div class="pcoded-content">
        
        <!-- [ Main Content ] start -->
        <div class="row">
            <!-- [ sample-page ] start -->
      <form action="ninsert.no" method="post">
		<table id="boardInsertTable" border="1">  
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                         <input class="form-control" type="text" size="78" name="noticeTitle" placeholder="제목을 입력하세요.">
                        
                       
                        
                    </div>
                    <div class="card-body">
                        <textarea class="form-control" rows="4" cols="80" name="noticeContent" style="resize: none;" placeholder="내용을 입력하세요."></textarea>
                    </div>
                    <div>
                    	<input class="form-control" type="hidden" name="writer" readonly value="${ loginUser.id }">
                    </div>
                    
                    
                    <div align ="right">
	                        <button style="color: white" id = "button" type="submit" class="btn">등록</button>
	                        
                       </div>
                 </div>
           	 </div>
          </table>
        </form> 
        
         <div class="na">
			<div class="menu" ><a href="nlist.no" style = "color:white">이전으로</a></div>
		</div>
        
        
        
       
        
            
            <!-- [ sample-page ] end -->
        
       
             </div> 
        <!-- [ Main Content ] end -->
    </div>
</div>
<!-- [ Main Content ] end -->
   	
    <!-- Required Js -->
    <script src="resources/css/noticeCss/js/vendor-all.min.js"></script>
    <script src="resources/css/noticeCssjs/plugins/bootstrap.min.js"></script>
    <script src="resources/css/noticeCssjs/plugins/feather.min.js"></script>
    <script src="resources/css/noticeCss/js/pcoded.min.js"></script>
    



</body>

</html>
