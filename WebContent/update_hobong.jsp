<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<%
	String dunggub=request.getParameter("dunggub");
	pstmt=conn.prepareStatement("select * from hobong0209 where dunggub=?");
	pstmt.setString(1, dunggub);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String salary=rs.getString("salary");
	
	

%>
<section>
<h1 style="text-align:center;">인사관리 호봉수정 화면</h1><hr>
<form name="form" method="post" action="hobong_update_process.jsp">
<table border=1 style="margin:0 auto; width:35%">
<tr>
<th>직급</th>
<td>
	<select id="sel1" name="dunggub">
		<option value="1" <%= dunggub.equals("1") ? "selected" : "" %>>1급</option>
		<option value="2" <%= dunggub.equals("2") ? "selected" : "" %>>2급</option>
		<option value="3" <%= dunggub.equals("3") ? "selected" : "" %>>3급</option>
		<option value="4" <%= dunggub.equals("4") ? "selected" : "" %>>4급</option>
		<option value="5" <%= dunggub.equals("5") ? "selected" : "" %>>5급</option>
	</select>
</td>
</tr>

<tr>
<th>급여</th>
<td><input id="in" type="text" name="salary" value="<%=salary %>"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="submit" value="수정">
	<input id="b" type="button" value="취소" onclick="location.href='index.jsp'">
</td>
</tr>
<%} %>
</table>
</form><hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>