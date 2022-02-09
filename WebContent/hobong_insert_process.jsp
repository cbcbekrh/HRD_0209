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
	String salary=request.getParameter("salary");

	
	pstmt=conn.prepareStatement("insert into hobong0209 values(?,?)");
	pstmt.setString(1, dunggub);
	pstmt.setString(2, salary);
	pstmt.executeUpdate();

%>
</body>
<script>
	alert("호봉등록 완료");
	location.href="hobong_select.jsp";
</script>
</html>