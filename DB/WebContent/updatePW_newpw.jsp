<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����ں�й�ȣ����</title>
</head>
<body>

<%! // DB ����
	String driver="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@203.229.204.89:1521:orcl";
	String id = "db156";
	String pass = "db156";
%>
<%
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, id, pass);
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	
	String mySQL = null;
	
	String updateID = (String)session.getAttribute("userID");
	String check_status = (String)session.getAttribute("userStatus");
	String updatePW = request.getParameter("npw");
	String updatePW2 = request.getParameter("npw2");
	
	if( updatePW.length() > 10){
		%>
		<script>
		alert('��й�ȣ�� ���� 10 ������ ���������� �Է¹ٶ��ϴ�');
		history.back();
		</script>
<%
		return;
	}
	
	if(check_status.equals("student")){
		mySQL = "update student set spw = '" + updatePW + "' where sid = '" + updateID + "'";		
	}
	
	else if(check_status.equals("prof")){
		mySQL = "update prof set ppw ='" + updatePW + "' where pid = '" + updateID + "'";
	}
	
	else if(check_status.equals("admin")){
		mySQL = "update admin set apw ='" + updatePW + "' where aid = '" + updateID + "'";
	}
	
	stmt.executeUpdate(mySQL);
%>
	<script>
	alert('��й�ȣ�� �����Ͽ����ϴ�');
	parent.document.location.reload();
	self.opner = self;
	window.close();
	</script>

</body>
</html>