<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수업제한인원변경</title>

<style>

html, body{
	font-family: '고딕';
	overflow: hidden;
}

</style>

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
  var contentH = 300;


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
<hr/><h2>수업제한인원변경</h2>
<form action="changeCourse_check.jsp" method="post" >
	<input type="text" name="changeC" placeholder="변경할 과목번호 입력" style="width: 250px; height: 30px" ><br><br>
	<input type="text" name="changeL" placeholder="변경할 제한인원 입력" style="width: 250px; height: 30px" ><br><br>
	<input type="submit" value="변경" style="height: 40px; width: 80px; background-color: #00a6de; color: #fff;">
<br><br><hr/>
</form>
</center>
</body>
</html>