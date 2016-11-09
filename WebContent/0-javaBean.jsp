<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="study.Login" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
	</head>
	<body>
	
		<jsp:useBean id="login" class="study.Login">
		
			<jsp:setProperty name="login" property="id" value="111" />
			<jsp:setProperty name="login" property="pw" value="222" />
		
		</jsp:useBean>
		
		id : <jsp:getProperty name="login" property="id" /> <br>
		pw : <jsp:getProperty name="login" property="pw" /> <br>

		<jsp:setProperty name="login" property="id" value="333" />
		<jsp:setProperty name="login" property="pw" value="444" />

		id : <jsp:getProperty name="login" property="id" /> <br>
		pw : <jsp:getProperty name="login" property="pw" />

	</body>
</html>