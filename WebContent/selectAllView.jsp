<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="article.Article" %>

<%
	List<Article> articles = (List<Article>)request.getAttribute("articles");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table>

			<%
				for(int i = 0 ; i < articles.size() ; i++) {
			%>
					<tr>
						<td><%=  articles.get(i).getNum() %>
						<td><%=  articles.get(i).getSubject() %>
					<tr>
			<%
				}
			%>

		</table>
	</body>
</html>