<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ǵ��</title>
<style>

html, body{
	font-family: '���';
	overflow: hidden;
}

table {
	background-color : #f4f7ff;
	border-spacing: 0px 0px;
	font-family: '����';
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
<h2>���ǵ��</h2>
<form action="insertCourse_insert.jsp" method="post">
<table border="1" width="400px" height = "200px">
	<tr>
		<th style="background-color: #8ea5f9;">������ȣ</th>
		<th><input type = "text" placeholder="������ȣ�� �Է��ϼ���" name = "cid" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">�����̸�</th>
		<th><input type = "text" name = "cname" placeholder="�����̸��� �Է��ϼ���" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">��米��</th>
		<th><input type = "text" placeholder="��米���� �Է��ϼ���" name = "cprof" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">�ش��г�</th>
		<th>
		<input type = "radio" name = "cyear" value = "1" checked> 1�г�
         <input type = "radio" name = "cyear" value = "2" checked> 2�г�
         <input type = "radio" name = "cyear" value = "3" checked> 3�г�
         <input type = "radio" name = "cyear" value = "4" checked> 4�г�
		</th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">���ǽð�</th>
		<th><input type = "text" placeholder="���ǽð��� �Է��ϼ���" name = "ctime" style="width: 90%; background-color:transparent; border: 0;" ></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">���ǽ�</th>
		<th><input type = "text" placeholder="���ǽ��� �Է��ϼ���" name = "croom" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">�����μ�</th>
		<th><input type = "text" placeholder="�����μ��� �Է��ϼ���" name = "cmajor" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
	<tr>
		<th style="background-color: #8ea5f9;">�����ο�</th>
		<th><input type = "text" placeholder="�����ο��� �Է��ϼ���" name = "climit" style="width: 90%; background-color:transparent; border: 0;"></th>
	</tr>
</table>
   	<br><input type = "submit" value ="�Է¿Ϸ�" style="height: 30px; width: 100px; background-color: #00a6de; color: #fff;">
</form>
	
<br><hr/>
</center>
</body>
</html>