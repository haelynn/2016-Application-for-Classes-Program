<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������û</title>

<style>
table {
	background-color : #f4f7ff;
	border-spacing: 0px 0px;
	font-family: '����';
	font-size: 15px;
	cellpadding: 10px;
	border: 1;
	width: 1150px;
	height: 100%;
	
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
	Statement stmt = conn.createStatement();
	PreparedStatement pt = null;
	
	String userID = (String)session.getAttribute("userID");
	String insertCid = request.getParameter("cid");
	
	String insertSQL = "tmp";
	String showSQL = "tmp";
	String updateSQL ="tmp";
	String updategradeSQL = "tmp";
%>

<%
		if(insertCid != null && !insertCid.equals("")){	
		String findSQL = "select * from enroll where cid = '" + insertCid +"' and sid = '" + userID + "'";
		
		ResultSet rss = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE).executeQuery(findSQL);
		
		rss.last();
		
		int rowCount = rss.getRow();
		
		if(rowCount != 0){
%>
		<script>alert('�̹� ��û�� �����Դϴ�');</script>
<%
		}
		
		else{
			
			rss = stmt.executeQuery("select * from course where cid = '" + insertCid + "'");
			int coursegrade = 0;
			
			while(rss.next()){
				
				int limit = Integer.parseInt(rss.getString("climit"));
				int member = Integer.parseInt(rss.getString("cmember"));
				coursegrade = Integer.parseInt(rss.getString("cgrade"));
				
				if(member >= limit){
					%>
					<script>
					alert('�̹� �����ο��� ����á���ϴ�');
					history.back();
					</script>
			<%
					return;
				}
				
				else{
					
					String ctime = rss.getString("ctime");
					
					String tmpSQL = "select * from course where cid in (select cid from enroll where sid = '" + userID + "')";
					
					ResultSet nrs = conn.createStatement().executeQuery(tmpSQL);
					
					int check = 0;
					while(nrs.next()){
						
						String ctime2 = nrs.getString("ctime");
						System.out.print(ctime2);
						System.out.print(ctime);
						
						String longTime, shortTime;
						
						if(ctime.length() >= ctime2.length()){
							longTime = ctime;
							shortTime = ctime2;
						}
						else{
							longTime = ctime2;
							shortTime = ctime;
						}
						
						char comp = longTime.charAt(0);
						char comp2 = shortTime.charAt(0);
						
						if(comp == comp2){
							for(int i=1; i<longTime.length(); i++){
								for(int j=1; j<shortTime.length(); j++){
									comp = longTime.charAt(i);
									comp2 = shortTime.charAt(j);
									
									if(comp == comp2){
										check = check + 1;
									}
								}
							}																								
						}
					}
				if(check > 0){
						%>
						<script>
						alert('�̹� ��û�� ������ �ð��� ������ �����Դϴ�');
						history.back();
						</script>
						<%
						return;
				}
					
				}
								
			} // while ������ 
			
			rss=stmt.executeQuery("select * from course");
			int check = 0;
			
			while(rss.next()){
				String cc = rss.getString("cid");
				
				if(cc.equals(insertCid)){
					check = check + 1;
				}
			}
			
			if(check == 0){
				%>
				<script>
				alert('��Ȯ�� �����ȣ�� �Է��ϼ���');
				history.back();
				</script>
				<%
				return;
		}
			
			rss = stmt.executeQuery("select * from student where sid = '" + userID +"'");
			
			while(rss.next()){
				
				int limit = Integer.parseInt(rss.getString("slimit"));
				int grade = Integer.parseInt(rss.getString("sgrade"));
				
				if(limit <= grade + coursegrade){
					%>
					<script>
					alert('���� ������ ������ ����á���ϴ�');
					history.back();
					</script>
				<%
					return;
				}
				
			}
			
			insertSQL = "insert into enroll(cid, sid) values ('" + insertCid + "','" + userID +"')";
			pt = conn.prepareStatement(insertSQL);
			pt.executeUpdate();
			
			updateSQL = "update course set cmember = cmember + 1 where cid = '" + insertCid + "'";
			stmt.executeUpdate(updateSQL);
			
			updategradeSQL = "update student set sgrade = sgrade + (select cgrade from course where cid = '" + insertCid + "') where sid = '" + userID + "'";
			stmt.executeUpdate(updategradeSQL);
%>
			<script>
			parent.document.location.reload();
			alert('���� ��û�Ǿ����ϴ�');
			</script>
<%			
			pt.close();

		}

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
			<th>����ϱ�</th>
		</tr>
<%
		showSQL = "select * from course where cid in (select cid from enroll where sid = '" + userID +"')";

		ResultSet rs;
		rs = stmt.executeQuery(showSQL);
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
				
				<th>
				<form id="del_course" method="get" action="deleteCourse.jsp" target="enrollif">	
<%			
					//session.setAttribute("deleteCid", cid);
%>
					<input type=hidden name="deleteCid" value=<%=cid %>>
					<input type=submit value="�������" name="enrollif">
				</form>
				</th>
			
			</tr>
<%
	}
	stmt.close();
	conn.close();
	
%>
</table>
</center>
</body>
</html>