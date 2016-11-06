<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>now date</title>
	</head>
	<body>
		
		<p> 지금 시각은 : <%= new java.util.Date() %> </p>
		
		<%
			String bookTitle = "JSP 프로그래밍";
			String author = "홍길동";
		%>
		
		<p><b><%= bookTitle %></b> (<%= author %>)입니다.</p>
		
		<p> JSP 페이지를 작성하려면 다양한 요소들이 필요하다.</p>
		<ul>
			<li>1. JSP 페이지에 대한 정보를 지정해야 한다.</li>
			<li>2. 웹 브라우저가 전송한 데이터를 읽어오는 기능이 필요하다.</li>
			<li>3. JSP 페이지에서 사용할 데이터를 생성하는 실행 코드가 필요하다.</li>
			<li>4. 웹 브라우저에 문서 데이터를 전송해 주는 기능이 필요하다.</li>
		</ul>
		
		<p> JSP SCRIPT ELEMENTS </p>
		<ul>
			<li>1. Expression : 값을 출력한다.</li>
			<li>2. Scriptlet : 자바 코드를 실행한다.</li>
			<li>3. Declaration : 자바 메서드(함수)를 만든다.</li>
		</ul>
		
		<p> scriptlet 작성 </p>
		<%
			int sum = 0;
			for(int i = 1; i<= 10; i++){
				sum = sum + i;
			}
		%>
		<p>1부터 10까지의 합은  <%= sum %> 입니다.</p>
		
		<% 
			int sum2 = 0;
			for(int i = 11; i<= 20; i++){
				sum2 = sum2 + i;
			}
		%>
		<p>11부터 20까지의 합은 <%= sum2 %> 입니다.</p>
		
		<p> declaration </p>
		<%!
			public int multiply(int a, int b){
				
				int c = a * b;
				return c;
				
			}
		%>
		
		10 * 25 = <%= multiply(10, 25) %> <br>
		
		<%!
			public int add(int a, int b){
				
				int c = a + b;
				return c;
			
			}
		
			public int subtract(int a, int b){
				
				int c = a - b;
				return c;
				
			}
		%>
		
		<%
			int value1 = 3;
			int value2 = 9;
			
			int addResult = add(value1, value2);
			int subtractResult = subtract(value1, value2);
		%>
		
		<%= value1 %> + <%= value2 %> = <%= addResult %> <br>
		<%= value1 %> - <%= value2 %> = <%= subtractResult %>
			
	</body>
</html>

