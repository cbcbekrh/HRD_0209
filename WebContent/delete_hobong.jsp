<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	String dunggub=request.getParameter("dunggub");
	System.out.println(dunggub);
	pstmt=conn.prepareStatement("delete from hobong0209 where dunggub=?");
	pstmt.setString(1, dunggub);
	pstmt.executeUpdate();

%>
</body>
<script>
	alert("삭제 성공");
	location.href='hobong_select.jsp';
</script>
</html>