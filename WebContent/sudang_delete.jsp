<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	String id=request.getParameter("id");
	pstmt=conn.prepareStatement("delete from sudang0209 where id=?");
	pstmt.setString(1, id);
	pstmt.executeUpdate();
%>
</body>
<script>
	alert("삭제완료");
	location.href="sudang_select.jsp";
</script>
</html>