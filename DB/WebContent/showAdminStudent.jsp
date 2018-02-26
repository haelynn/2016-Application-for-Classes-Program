<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>지도학생정보</title>

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
			<th>학     번</th>
			<th>학생이름</th>
			<th>전     공</th>
			<th>학     년</th>
			<th>지도교수</th>
			<th>신청가능학점</th>
			<th>수강학점</th>
		</tr>


<%
				String mySQL = "select * from student";
				ResultSet rs = stmt.executeQuery(mySQL);
				
				while(rs.next()){
					
		        	String sid=rs.getString("sid");
		        	String sname=rs.getString("sname");       	
		        	String smajor=rs.getString("smajor");
		        	String syear=rs.getString("syear");
		        	
		        	String sprof ="a";
		        	
		        	String profSQL = "select pname from prof where pid = (select sprof from student where sid = '" + sid + "')";
		        	ResultSet rs_tmp = conn.createStatement().executeQuery(profSQL);
		        	
		        	while(rs_tmp.next()){
		        		sprof = rs_tmp.getString("pname");
		        	}
		        	
		        	String slimit = rs.getString("slimit");
		        	String sgrade = rs.getString("sgrade");
%>
	         <tr>
	            
			    <th><%=sid %></th>
			    <th><%=sname %></th>
			    <th><%=smajor %></th>
			    <th><%=syear %></th>
				<th><%=sprof %></th>
				<th><%=slimit %></th>
				<th><%=sgrade %></th>
			 </tr>
<%
				}
%>
	</table>
	</center>
</body>
</html>