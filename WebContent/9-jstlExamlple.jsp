<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>

		<%
			String browser = "1234";
		%>

		<h3>JSTL core 태그 예제 - set, out, remove </h3>
		<p> 
			변수 선언 및 초기화
			<c:set var="browser" value="${header['User-Agent']}" />
		</p>			
		<p> 
			변수 안의 값 출력
			<c:out value="${browser}" />
		</p>
		<p> 
			변수값 제거 
			<c:remove var="browser" />
		</p>
		<p>
			변수 안의 값 출력
			<c:out value="${browser}" />
		</p>
		
	</body>
</html>