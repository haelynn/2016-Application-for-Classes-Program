<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>수강신청</title>

<link href="main_ss.css" rel="stylesheet" type="text/css">
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
	Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	Statement stmt3 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	PreparedStatement pt = null;
	
	String userSID = request.getParameter("sid");
	String userSNAME = new String(request.getParameter("sname").getBytes("ISO-8859-1"),"euc-kr");
	String userSMAJOR = new String(request.getParameter("smajor").getBytes("ISO-8859-1"),"euc-kr");
	String userSYEAR = request.getParameter("syear");
	String userSPROF = new String(request.getParameter("sprof").getBytes("ISO-8859-1"),"euc-kr");
	
	if(userSID.equals("") || userSNAME.equals("") || userSMAJOR.equals("")||userSPROF.equals("") ){
%>
	<script>
	alert('모든 값을 입력해주세요');
	history.back();
	</script>		
<%
	return;
	}
	else{
		String mySQL = "select pid from prof where pname = '" + userSPROF + "'";
		String testSID = "select sid from student where sid = '" + userSID + "'";
		String testMajor = "select mname from department where mname = '" + userSMAJOR + "'";
		
		ResultSet rs = stmt.executeQuery(mySQL);
		ResultSet rssid = stmt2.executeQuery(testSID);
		ResultSet rsmajor = stmt3.executeQuery(testMajor);
		
		rs.last();
		rssid.last();
		rsmajor.last();
		
		int prowCount = rs.getRow();
		int srowCount = rssid.getRow();
		int mrowCount = rsmajor.getRow();
		
		rssid.close();
		rsmajor.close();
		stmt2.close();
		stmt3.close();
		
		if(prowCount == 0){
	%>
			<script>
			alert('정확한 교수 이름을 작성해주세요');
			history.back();
			</script>
	<%
			return;
		}
		
		else{
			rs.beforeFirst();
		
			while(rs.next()){
				userSPROF = rs.getString("pid");
			}
		}
		
		if(srowCount != 0){
	%>
			<script>
			alert('입력한 학번이 이미 존재합니다');
			history.back();
			
			</script>
	<%
			return;
		}
		
		if(mrowCount == 0){
	%>
			<script>
			alert('정확한 학과명을 입력하세요');
			history.back();
			
			</script>
	<%
			return;
		}
		
		rs = stmt.executeQuery("select * from prof where pid = '" + userSPROF + "' and pmajor = '" + userSMAJOR +"'");
		rs.last();
		int rc = rs.getRow();
		
		if(rc == 0){
%>
			<script>
			alert('학과와 교수님을 확인하세요');
			history.back();
			
			</script>
<%
			return;
		}

		String insertSQL = "insert into student(sid, spw, sname, smajor, syear, sprof, slimit, sgrade) values('" + userSID +"', 1234, '" + userSNAME +"','" + userSMAJOR +"','" + userSYEAR +"','" + userSPROF +"', 20 , 0)";
		pt = conn.prepareStatement(insertSQL);
		pt.executeUpdate();
%>
		<script>alert('학생정보를 추가하였습니다');history.back();</script>
<%
	//	pt.close();
	//	stmt.close();
	//	conn.close();	
	}
	
%>
<script>
//parent.document.location.reload();
//location='inputStudentInfo.jsp'
</script>

</body>
</html>