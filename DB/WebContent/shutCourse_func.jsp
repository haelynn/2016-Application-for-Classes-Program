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
	PreparedStatement pt = null;
	
	String dcourse = request.getParameter("dcourse");
	
	String mySQL = "select * from course where cid = '" + dcourse +"'";
	
	ResultSet rs = stmt.executeQuery(mySQL);
	
	rs.last();
	
	int rowCount = rs.getRow();
	
	if(rowCount == 0){
		%>
		<script>
		alert('�������� �ʴ� �����ȣ�Դϴ�');
		history.back();
		</script>
<%
		return;
	}
	
	rs.beforeFirst();
	
	while(rs.next()){
		
		String cmember = rs.getString("cmember");
		
		if(!cmember.equals("0")){
			%>
			<script>
			alert('�����ο��� 0���� ������ ���� �� �ֽ��ϴ�.');
			history.back();
			</script>
	<%
			return;
		}
	}
	
	mySQL = "delete from course where cid = '" + dcourse + "'";
	
	pt = conn.prepareStatement(mySQL);
	pt.executeUpdate();
	
	PrintWriter writer = response.getWriter();
	writer.println("<script>alert('�󰭵Ǿ����ϴ�');</script>");
	writer.flush();
	pt.close();
	stmt.close();
			
%>
<script>
	parent.document.location.reload();
	self.opner = self;
	window.close();
</script>

</body>
</html>