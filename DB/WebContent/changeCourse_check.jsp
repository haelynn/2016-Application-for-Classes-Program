<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
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
	
	String cid = request.getParameter("changeC");
	String limit = request.getParameter("changeL");
	
	if(cid.equals("")||limit.equals("")){
		%>
		<script>
		alert('모든 값을 입력하세요');
		history.back();
		</script>
<%
		return;
	}
	
	String mySQL = "select * from course where cid = '" + cid + "'";
	
	ResultSet rs = stmt.executeQuery(mySQL);
	rs.last();
	
	int rowCount = rs.getRow();
	
	if(rowCount == 0){
		%>
		<script>
		alert('존재하지 않는 과목번호입니다');
		history.back();
		</script>
<%
		return;
	}
	
	int tmp = 0;
	
	for(int i=0; i<limit.length(); i++){
		char ch = limit.charAt(i);
		
		if(ch < 48 || ch > 58)
			tmp = tmp+1;
		
	}
	
	if(tmp > 0){
		%>
		<script>
		alert('변경값은 숫자형을 입력하세요');
		history.back();
		</script>
<%
		return;
	}
	
	mySQL = "update course set climit = '" + limit + "' where cid = '" + cid + "'";
	stmt.executeQuery(mySQL);
	
%>
	<script>
	alert('제한인원을 변경하였습니다');
	window.opener.location.reload();
	self.opner = self;
	window.close();
	</script>
<%

%>

</body>
</html>