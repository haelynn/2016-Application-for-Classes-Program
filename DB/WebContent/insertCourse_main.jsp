<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강의등록</title>
<style>

html, body{
	font-family: '고딕';
	overflow: hidden;
}

table {
	background-color : #f4f7ff;
	border-spacing: 0px 0px;
	font-family: '돋움';
	font-size: 15px;
	cellpadding: 10px;
	
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
  var contentH = 400;


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
<h2>강의등록</h2>
<form action="insertCourse_insert.jsp" method="post">
<table border="1" width="400px" height = "200px">
	<tr>
		<th style="background-color: #8ea5f9;">수업번호</th>
		<th><input type = "text" placeholder="수업번호를 입력하세요" name = "cid" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">수업이름</th>
		<th><input type = "text" name = "cname" placeholder="수업이름을 입력하세요" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">담당교수</th>
		<th><input type = "text" placeholder="담당교수를 입력하세요" name = "cprof" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">해당학년</th>
		<th>
		<input type = "radio" name = "cyear" value = "1" checked> 1학년
         <input type = "radio" name = "cyear" value = "2" checked> 2학년
         <input type = "radio" name = "cyear" value = "3" checked> 3학년
         <input type = "radio" name = "cyear" value = "4" checked> 4학년
		</th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">강의시간</th>
		<th><input type = "text" placeholder="강의시간을 입력하세요" name = "ctime" style="width: 90%; background-color:transparent; border: 0;" ></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">강의실</th>
		<th><input type = "text" placeholder="강의실을 입력하세요" name = "croom" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">개설부설</th>
		<th><input type = "text" placeholder="개설부설을 입력하세요" name = "cmajor" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">제한인원</th>
		<th><input type = "text" placeholder="제한인원을 입력하세요" name = "climit" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
</table>
   	<br><input type = "submit" value ="입력완료" style="height: 30px; width: 100px; background-color: #00a6de; color: #fff;">
</form>
	
<br><hr/>
</center>
</body>
</html>