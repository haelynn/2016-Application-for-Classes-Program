<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사용자비밀번호변경</title>
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
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	
	ResultSet rs=null;
	
	String check_status = (String)session.getAttribute("userStatus");
	String userID = (String)session.getAttribute("userID");
	String ID = request.getParameter("id");
	String PW = request.getParameter("pw");
	
	if(!ID.equals(userID)){
		%>
		<script>
		alert('ID가 일치하지 않습니다');
		history.back();
		</script>
<%
		return;
	}
	
	String mySQL = null;
	
	if(check_status.equals("student")){
		mySQL = "select * from student where sid = '" + ID + "' and spw = '" + PW + "'";
	}
	
	else if(check_status.equals("prof")){
		mySQL = "select * from prof where pid = '" + ID + "' and ppw ='" + PW + "'";
	}
	
	else if(check_status.equals("admin")){
		mySQL = "select * from admin where aid = '" + ID + "' and apw ='" + PW + "'";
	}
	
	rs = stmt.executeQuery(mySQL);
	
	rs.last();
	int rowCount = rs.getRow();
	
	if(rowCount == 0){
		response.setCharacterEncoding("EUC-KR");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('ID 혹은 비밀번호가 틀렸습니다');history.back();</script>");
		writer.flush();
	}
	
	else{
		response.sendRedirect("updatePW_change.jsp");
	}
%>
</body>
</html>