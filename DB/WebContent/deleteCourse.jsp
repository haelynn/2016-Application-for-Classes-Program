<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수강취소</title>

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
	Statement stmt = conn.createStatement();
	
	String userID = (String)session.getAttribute("userID");
	//String deleteCid = (String)session.getAttribute("deleteCid");
	String deleteCid = request.getParameter("deleteCid");
	
	String deleteSQL = null;
	PreparedStatement pt = null;
	
	deleteSQL = "delete from enroll where cid = '" + deleteCid + "' and sid ='" + userID +"'";
	
	String updateSQL = "update course set cmember = cmember - 1 where cid = '" + deleteCid + "'";
	String updategradeSQL = "update student set sgrade = sgrade - (select cgrade from course where cid = '" + deleteCid + "') where sid = '" + userID + "'";
	
	stmt.executeUpdate(updateSQL);
	stmt.executeUpdate(updategradeSQL);
	pt = conn.prepareStatement(deleteSQL);
	pt.executeUpdate();
	

	PrintWriter writer = response.getWriter();
	writer.println("<script>alert('수강 취소되었습니다');</script>");
	writer.flush();
	pt.close();
	stmt.close();
	
%>
<script>
parent.document.location.reload();
location='enrollCourse.jsp'

</script>
</center>
</body>
</html>