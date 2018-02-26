<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의검색</title>

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
<center>
<%! // DB 연동
	String driver="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@203.229.204.89:1521:orcl";
	String id = "db156";
	String pass = "db156";
%>
<%
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, id, pass);
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
%>


<% 
	String userID = (String)session.getAttribute("userID");	
	String studentCheck = request.getParameter("sel_student");
	String ssearch = new String(request.getParameter("ssearch").getBytes("ISO-8859-1"),"euc-kr");
	ResultSet rs;
	
	String mySQL = null;

	if(studentCheck.equals("s_name")){
		mySQL = "select * from student where sname = '" + ssearch + "' and sprof = '" + userID + "'";
	}
	
	else if(studentCheck.equals("s_major")){
		mySQL = "select * from student where smajor = '" + ssearch + "' and sprof = '" + userID + "'";
	}
	else if(studentCheck.equals("s_year")){
		mySQL = "select * from student where syear = '" + ssearch + "' and sprof = '" + userID + "'";
	}

	
	rs = stmt.executeQuery(mySQL);
	
	rs.last();
	int rowCount = rs.getRow();
	
	if(rowCount == 0){
%>
	<script>
	alert('일치하는 검색결과가 없습니다');
	history.back();
	</script>

<%
	}
%>
	<table border="1" width="1150px" height = 100%>
		<tr style="background-color: #8ea5f9;">
			<th>학     번</th>
			<th>학생이름</th>
			<th>전     공</th>
			<th>학     년</th>	
		</tr>
<%
	rs.beforeFirst();
	
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
%>
	<tr>

		<th><%=sid %></th>
		<th><%=sname %></th>
		<th><%=smajor %></th>
		<th><%=syear %></th>
	</tr>
<%
	}
	
%>
</table>

</center>
</body>
</html>