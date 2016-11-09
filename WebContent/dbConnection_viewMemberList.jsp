<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		
		MEMBER 테이블의 내용
		<table width="100%" border="1">
			<tr>
				<td>이름</td>
				<td>아이디</td>
				<td>이메일</td>
			</tr>
			<%
				
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
			
				try{
					
					// 1. JDBC 드라이버 로딩
					String className = "com.mysql.jdbc.Driver";
					String host = "localhost";
					String port = "3306"; 
					String database = "articledb";	
					String url = "jdbc:mysql://" + host + ":" + port + "/" + database;
					String user = "root";
					String password = "1234";
					
					Class.forName(className);
					
					// 2. 데이터베이스 커넥션 생성
					conn = DriverManager.getConnection(url, user, password);
					stmt = conn.createStatement();
					String sql = "select * from MEMBER order by MEMBERID";
					rs = stmt.executeQuery(sql);
					
					while(rs.next()){
			%>
					<tr>
						<td><%= rs.getString("NAME") %></td>
						<td><%= rs.getString("MEMBERID") %></td>
						<td><%= rs.getString("EMAIL") %></td>
					</tr>				
			<%
					}
					
				} catch(Exception e) {
					out.println(e.getMessage());
					e.printStackTrace();
				} finally {
					if(rs != null){try{rs.close();}catch(SQLException e){}}
					if(stmt != null){try{stmt.close();}catch(SQLException e){}}
					if(conn != null){try{conn.close();}catch(SQLException e){}}
				}
			%>
		</table>
		
	</body>
</html>