<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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

	
	String ID_check = request.getParameter("ID_check"); // 사용자 상태 확인
	String login_ID = request.getParameter("Login_ID");
	String login_pass = request.getParameter("Login_PASS");

	ResultSet rs;
	
	if(ID_check.equals("student")){
		
		String mySQL = "select * from student where sid = '" + login_ID + 
				"' and spw = '" + login_pass + "'";
		
		rs = stmt.executeQuery(mySQL);
		
		rs.last();		
		int rowCount = rs.getRow();
		
		if(rowCount == 0){ // ID/비밀번호 틀렸을 경우
			
			response.setCharacterEncoding("EUC-KR");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('ID 혹은 비밀번호가 틀렸습니다');history.back();</script>");
			writer.flush();
		}
		
		else{ // ID/비밀번호 맞았을 경우
			
			rs.beforeFirst();
		
			while(rs.next()){
				session.setAttribute("userID", rs.getString("sid"));
				session.setAttribute("userName", rs.getString("sname"));
				session.setAttribute("userMajor", rs.getString("smajor"));
				response.sendRedirect("student_main.jsp");
			}
			
		}			
	}
	
	else if(ID_check.equals("prof")){
		
		String mySQL = "select * from prof where pid = '" + login_ID + 
				"' and ppw = '" + login_pass + "'";
		
		rs = stmt.executeQuery(mySQL);
		rs.last();
		
		int rowCount = rs.getRow();
		
		if(rowCount == 0){ // ID/비밀번호 틀렸을 경우
			response.setCharacterEncoding("EUC-KR");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('ID 혹은 비밀번호가 틀렸습니다');history.back();</script>");
			writer.flush();
		}
		
		else{ // ID/비밀번호 맞았을 경우
			rs.beforeFirst();
			while(rs.next()){
				session.setAttribute("userMajor", rs.getString("pmajor"));
				session.setAttribute("userName", rs.getString("pname"));
				session.setAttribute("userID", rs.getString("pid"));
				response.sendRedirect("prof_main.jsp");
			}
		}
	}
	
	else if(ID_check.equals("admin")){
		
		String mySQL = "select * from admin where aid = '" + login_ID + 
				"' and apw = '" + login_pass + "'";
		
		rs = stmt.executeQuery(mySQL);
		rs.last();
		
		int rowCount = rs.getRow();
		
		if(rowCount == 0){ // ID/비밀번호 틀렸을 경우
			response.setCharacterEncoding("EUC-KR");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('ID 혹은 비밀번호가 틀렸습니다');history.back();</script>");
			writer.flush();
		}
		
		else{ // ID/비밀번호 맞았을 경우
			rs.beforeFirst();
			while(rs.next()){
				session.setAttribute("userName", rs.getString("aname"));
				session.setAttribute("userJob", rs.getString("ajob"));
				session.setAttribute("userID", rs.getString("aid"));
				response.sendRedirect("admin_main.jsp");
				
			}
		}	
	}
	
	stmt.close();
	conn.close();

%>

</body>
</html>