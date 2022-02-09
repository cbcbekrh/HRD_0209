<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	DecimalFormat fo=new DecimalFormat("###,###");	
%>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section>
<h1 style="text-align:center">수당 정보 조회</h1>
<table border=1 style="margin:0 auto; width:70%">
<tr>
<th>no</th>
<th>사원번호</th>
<th>이름</th>
<th>가족수당</th>
<th>직책수당</th>
<th>근속수당</th>
<th>기타수당</th>
<th>수당합계</th>
<th>구분</th>
</tr>
<%
	int no=0;
	pstmt=conn.prepareStatement("select a.id,a.name,b.gajok,b.jikchak,b.gunsok,b.gitasudang,(jikchak+gunsok+gajok+gitasudang)as sum from info0209 a,sudang0209 b where a.id=b.id");
	rs=pstmt.executeQuery();
	while(rs.next()){
		no++;
%>
<tr>
<td align=center><%=no %></td>
<td align=center><%=rs.getString("id") %></td>
<td align=center><%=rs.getString("name") %></td>
<td align=right><%=fo.format(rs.getInt("gajok")) %></td>
<td align=right><%=fo.format(rs.getInt("jikchak")) %></td>
<td align=right><%=fo.format(rs.getInt("gunsok")) %></td>
<td align=right><%=fo.format(rs.getInt("gitasudang")) %></td>
<td align=right><%=fo.format(rs.getInt("sum")) %></td>
<td align=center>
	<a href="sudang_update.jsp?id=<%=rs.getString("id")%>">수정</a> /
	<a href="sudang_delete.jsp?id=<%=rs.getString("id")%>" onclick="if(!confirm('정말 삭제하시겠습니까?'))return false;">삭제</a> 
</td>
</tr>



<%} %>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>