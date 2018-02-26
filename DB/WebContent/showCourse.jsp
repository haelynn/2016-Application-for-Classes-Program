<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강의정보</title>

<style>

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

<%! // DB 연동
	String driver="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@203.229.204.89:1521:orcl";
	String id = "db156";
	String pass = "db156";
%>
<%
				Class.forName(driver);
				Connection conn = DriverManager.getConnection(url, id, pass);
				Statement stmt = conn.createStatement();
%>
<center>
	<table border="1" width="1150px" height = 100%>
		<tr style="background-color: #8ea5f9;">
			<th>과목번호</th>
			<th>과목이름</th>
			<th>담당교수</th>
			<th>해당학년</th>
			<th>학      점</th>
			<th>시      간</th>
			<th>강  의  실</th>
			<th>개설학부</th>
			<th>수강인원</th>
			<th>제한인원</th>	
		</tr>


<%
				String mySQL = "select * from course";
				ResultSet rs = stmt.executeQuery(mySQL);
				
				while(rs.next()){
					
		        	String cid=rs.getString("cid");
		        	String cname=rs.getString("cname");
		        	
		        	String cprof ="a";
		        	
		        	String profSQL = "select pname from prof where pid = (select cprof from course where cid = '" + cid + "')";
		        	ResultSet rs_tmp = conn.createStatement().executeQuery(profSQL);
		        	
		        	while(rs_tmp.next()){
		        		cprof = rs_tmp.getString("pname");
		        	}
		        	
		        	String cyear=rs.getString("cyear");
		        	String ctime=rs.getString("ctime");
		        	String croom=rs.getString("croom");
		          	String cmajor=rs.getString("cmajor");
		          	String cmember=rs.getString("cmember");
		          	String climit=rs.getString("climit");
		          	String cgrade=rs.getString("cgrade");
		          
%>
	         <tr>
	            
			    <th><%=cid %></th>
			    <th><%=cname %></th>
			    <th><%=cprof %></th>
			    <th><%=cyear %></th>
			    <th><%=cgrade %></th>
			    <th><%=ctime %></th>
			    <th><%=croom %></th>
			    <th><%=cmajor %></th>
			    <th><%=cmember %></th>
			    <th><%=climit %></th>
			   			    
			 </tr>
<%
				}
%>
	</table>
	</center>
</body>
</html>