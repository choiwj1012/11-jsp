<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope="request" class="study.MemberInfo" />
<%
	member.setId("madvirus");
	member.setName("홍길동");
%>
<jsp:forward page="/useObject.jsp" />