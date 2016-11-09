<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try{
				
				Context initCtx = new InitialContext();
				Context envCtx = (Context)initCtx.lookup("java:comp/env");
				DataSource ds = (DataSource)envCtx.lookup("jdbc/articledb");
				conn = ds.getConnection();
				System.out.println("커넥션 풀을 통한 DB 연결 성공");
				
				// Class.forName("xxx");
				// conn = DriverManager.getConnection("url","root","1234");
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				
				
			}
			
			
		%>
	</body>
</html>