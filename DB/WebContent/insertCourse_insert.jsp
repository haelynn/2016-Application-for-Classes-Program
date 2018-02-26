<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강의등록</title>
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
	PreparedStatement pt = null;
	   
	   String userCID = request.getParameter("cid");
	   String userCNAME = new String(request.getParameter("cname").getBytes("ISO-8859-1"),"euc-kr");
	   String userCPROF = new String(request.getParameter("cprof").getBytes("ISO-8859-1"),"euc-kr");
	   String userCYEAR = request.getParameter("cyear");
	   String userCTIME = new String(request.getParameter("ctime").getBytes("ISO-8859-1"),"euc-kr");
	   String userCROOM = new String(request.getParameter("croom").getBytes("ISO-8859-1"),"euc-kr");
	   String userCMAJOR = new String(request.getParameter("cmajor").getBytes("ISO-8859-1"),"euc-kr");
	   String userCLIMIT = request.getParameter("climit");

	   
		if(userCID.equals("") || userCNAME.equals("") || userCMAJOR.equals("")||userCPROF.equals("") 
				|| userCTIME.equals("") || userCLIMIT.equals("") || userCROOM.equals("")){
			%>
				<script>
				alert('모든 값을 입력해주세요');
				history.back();
				</script>		
			<%
			return;
		}
	   
	   String mySQL = "select pid from prof where pname = '" + userCPROF + "'";
	   
	   ResultSet rs = stmt.executeQuery(mySQL);
	   rs.last();
	   
	   int profCount = rs.getRow();
	   
	   if(profCount == 0){
		   %>
			<script>
			alert('정확한 교수이름을 입력해주세요');
			history.back();ss
			</script>		
		<%
		return;
			}
	   
	   while(rs.next()){
	      userCPROF = rs.getString("pid");
	   }
	   
	   //cid, cmajor,
	   rs = stmt.executeQuery("select * from course where cid = '" + userCID + "'");
	   rs.last();
	   
	   int cidCount = rs.getRow();
	   
	   if(cidCount != 0){
		   %>
			<script>
			alert('이미 존재하는 수업번호입니다');
			history.back();ss
			</script>		
		<%
		return;
			}
	   
	   rs = stmt.executeQuery("select * from department where mname = '" + userCMAJOR + "'");
	   rs.last();
	   
	   int majorCount = rs.getRow();
	   
	   if(majorCount == 0){
		   %>
			<script>
			alert('전공을 정확히 입력해주세요');
			history.back();ss
			</script>		
		<%
		return;
			}
	   String insertSQL2 = "insert into course(cid, cname, cprof, cyear, ctime, croom, cmajor, climit, cmember, cgrade) values('" + userCID +"','" + userCNAME +"','" + userCPROF +"','" + userCYEAR +"','" + userCTIME +"','" + userCROOM +"','" + userCMAJOR +"','" + userCLIMIT +"', 0, 3)";
	   pt = conn.prepareStatement(insertSQL2);
	   pt.executeUpdate();
	   
%>
<script>
	alert('수업정보를 추가하였습니다')
	parent.document.location.reload();
	self.opner = self;
	window.close();
</script>
<%
	pt.close();
	stmt.close();
	conn.close();
%>

<script>
parent.document.location.reload();
location='admin_changeCourse.jsp'
</script>
</body>
</html>