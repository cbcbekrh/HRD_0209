<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
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
	DecimalFormat fo=new DecimalFormat("###,###");	
%>
<section>
<h1 style="text-align:center;">호봉 정보 조회</h1><hr>
<table border=1 style="margin:0 auto; width:30%;">
<tr>
<th>no</th>
<th>등급</th>
<th>급여</th>
<th>구분</th>
</tr>
<%
	int no=0;
	pstmt=conn.prepareStatement("select * from hobong0209");
	rs=pstmt.executeQuery();
	while(rs.next()){
		no++;
	
%>

<tr>
<td align=center><%=no %></td>
<td align=center><%=rs.getInt(1) %>급</td>
<td align=center><%=fo.format(rs.getInt(2)) %></td>
<td align=center>
	<a href="update_hobong.jsp?dunggub=<%=rs.getInt(1) %>">수정</a> /
	<a href="delete_hobong.jsp
	?dunggub=<%=rs.getInt(1) %>
	" onclick="if(!confirm('정말 삭제하시겠습니까?'))return false;">삭제</a>
</td>

</tr>


<%} %>
</table><hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>