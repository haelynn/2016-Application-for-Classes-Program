<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<style>

html, body{
	font-family: '고딕';
	overflow: hidden;
}

</style>


<title>사용자비밀번호변경</title>
</head>
<body>
<script>
window.onload = function(){
	document.body.style.overflow='hidden';
	resizer();
}

function resizer()  
{  
  
  var contentW = 500;  
  var contentH = 250;


  var maxW = screen.availWidth;  
  var maxH = screen.availHeight;  

  var windowX = (maxW/2)-(contentW/2);  
  var windowY = (maxH/2)-(contentH/2);  

  window.moveTo(windowX,windowY);  
  window.resizeTo(contentW, contentH);  
 
  if (window.innerWidth)  
  {  
    var innerW = window.innerWidth;  
    var innerH = window.innerHeight;  
  }  
  else  
  {  
    var innerW = document.body.clientWidth;  
    var innerH = document.body.clientHeight;  
  }  

  var winW = contentW - (innerW - contentW);  
  var winH = contentH - (innerH - contentH);  

  if(winW > maxW)  
  {  
    winW = maxW;  
    windowX = 0;  
  }  
  
  if(winH > maxH)  
  {  
    winH = maxH;  
    windowY = 0;  
  }  
  window.moveTo(windowX,windowY);  
 
  if (navigator.userAgent.indexOf('Chrome')>-1)  

    window.resizeTo(contentW+10, contentH+58);   
  else  
    window.resizeTo(winW, winH);  
}  
</script>
<center>
	<hr/>
	<h2>비밀번호 변경 전 사용자 확인</h2>
	
	<form action="updatePW_checkID.jsp" method="post">
  	아  이  디 : <input type = "text" name = "id" > <br>
         비밀번호 : <input type = "password" name = "pw" > <br><br>
    <input type = "submit" value ="확  인" style="height: 30px; width: 100px; background-color: #00a6de; color: #fff;">    
     </form>
     <br><hr/>
</center>
</body>
</html>