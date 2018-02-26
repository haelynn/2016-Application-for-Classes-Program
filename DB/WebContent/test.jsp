<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.io.*" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String ctime = "ȭ89";
	String ctime2 = "ȭ12";
	
	String longTime, shortTime;
	
	if(ctime.length() >= ctime2.length()){
		longTime = ctime;
		shortTime = ctime2;
	}
	else{
		longTime = ctime2;
		shortTime = ctime;
	}
	
	char comp = longTime.charAt(0);
	char comp2 = shortTime.charAt(0);
	
	if(comp == comp2){
		for(int i=1; i<longTime.length(); i++){
			for(int j=1; j<shortTime.length(); j++){
				comp = longTime.charAt(i);
				comp2 = shortTime.charAt(j);
				
				if(comp == comp2){
					out.print("true");
				}
			}
		}
	}

%>

</body>
</html>