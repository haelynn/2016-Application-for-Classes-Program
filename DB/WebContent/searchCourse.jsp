<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>���ǰ˻�</title>

<style>

table {
	background-color : #f4f7ff;
	border-spacing: 0px 0px;
	font-family: '����';
	font-size: 15px;
	cellpadding: 10px;
	
}

</style>

</head>
<body>
<center>
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
%>


<% 
	String majorCheck = request.getParameter("sel_major");
	String msearch = new String(request.getParameter("msearch").getBytes("ISO-8859-1"),"euc-kr");
	ResultSet rs;
	
	String mySQL = null;

	if(majorCheck.equals("c_name")){
		mySQL = "select * from course where cname = '" + msearch + "'";
	}
	
	else if(majorCheck.equals("c_major")){
		mySQL = "select * from course where cmajor = '" + msearch + "'";
	}
	else if(majorCheck.equals("c_id")){
		mySQL = "select * from course where cid = '" + msearch + "'";
	}
	else if(majorCheck.equals("c_prof")){
		mySQL = "select * from course where cprof = (select pid from prof where pname = '"+ msearch + "')";
	}
	
	rs = stmt.executeQuery(mySQL);
	
	rs.last();
	int rowCount = rs.getRow();
	
	if(rowCount == 0){
%>
	<script>
	alert('��ġ�ϴ� �˻������ �����ϴ�');
	history.back();
	</script>

<%
	}
%>
	<table border="1" width="1150px" height = 100%>
		<tr style="background-color: #8ea5f9;">
			<th>�����ȣ</th>
			<th>�����̸�</th>
			<th>��米��</th>
			<th>�ش��г�</th>
			<th>��      ��</th>
			<th>��      ��</th>
			<th>��  ��  ��</th>
			<th>�����к�</th>
			<th>�����ο�</th>
			<th>�����ο�</th>	
		</tr>
<%
	rs.beforeFirst();
	
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