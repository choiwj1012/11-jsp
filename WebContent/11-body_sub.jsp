<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		
		body_sub에서 name 파라미터 값 : <%= request.getParameter("name") %>
		<br>
		name 파라미터 값 목록 :
		
		<ul>
		<%
			String[] names = request.getParameterValues("name");
			for(String name : names){
		%>
			<li><%= name %></li>
		<%
			}
		%>
		</ul>
				
	</body>
</html>