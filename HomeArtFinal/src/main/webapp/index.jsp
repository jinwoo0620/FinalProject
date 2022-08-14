<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   body{
      background: #EBF2FE; color: #4F8CD1;
   }
   .welcomeText{
      text-align: center; margin-top: 150px;
   }
   .enterZone{
      width: 400px; height: 200px;
      margin: 100px auto; text-align: center;
   }
   .enterBt{}
   .enterBt:hover{
      cursor: pointer; 
   }
   .enterBt>img:hover{
      transition: all .5s ease 0s;
      filter: hue-rotate(15deg); opacity: 0.8;
   }
   
   .enterZone>h2{
      color: #4F8CD1; font-size: 50px; margin: 0;
   }
   
   .hand{
   width: 200px; height: 200px;
      margin: 0 auto; text-align: center;
   }
   .hand>img{
      width: 40px; transform: translate(-50%,-50%);
      animation: hand 0.5s ease 0s infinite alternate;
   }
   @keyframes hand {
       0%{transform: translate(0,-50%) ;}
       100%{transform: translate(0,-0%) ;}
   }
   
   
</style>
</head>
<body>
   <h2 class="welcomeText">Welcome To HomeArt!</h2>
   <div class="enterZone">
      <div class="enterBt"onclick="location.href='home.do'"><img src="https://imgur.com/XnOttRw.jpg"></div>
      <h2>HomeArt</h2>
   </div>
   <div class="hand">
      <img src="https://imgur.com/wbElibH.jpg"/>
   </div>
</body>
</html>