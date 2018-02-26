<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>교수정보</title>

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
			<th>교수번호</th>
			<th>교수이름</th>
			<th>전      공</th>
		</tr>
<%
				String mySQL = "select * from prof";
				ResultSet rs = stmt.executeQuery(mySQL);
				
				while(rs.next()){
					
		        	String pid= rs.getString("pid");
		        	String pname= rs.getString("pname");
		        	String pmajor= rs.getString("pmajor");
%>
	         <tr>
	            <th><%=pid %></th>
	            <th><%=pname %></th>
	            <th><%=pmajor %></th>
			 </tr>
<%
				}
%>
	</table>
	</center>
</body>
</html>