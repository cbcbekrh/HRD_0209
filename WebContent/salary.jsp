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
<h1 style="text-align:center">급여 정보 조회</h1>
<table border=1 style="margin:0 auto; width:70%">
<tr>
<th>no</th>
<th>사원번호</th>
<th>이름</th>
<th>급여</th>
<th>가족수당</th>
<th>직책수당</th>
<th>근속수당</th>
<th>기타수당</th>
<th>급여합계</th>
</tr>
<%
	int no=0;
	pstmt=conn.prepareStatement("select a.*,b.*,c.*,(b.salary+c.gajok+c.jikchak+c.gunsok+c.gitasudang)as sum from info0209 a, hobong0209 b, sudang0209 c where a.position=b.dunggub and a.id=c.id");
	rs=pstmt.executeQuery();
	while(rs.next()){
	String id=rs.getString("id");
	String name=rs.getString("name");
	int salary=rs.getInt("salary");
	int gajok=rs.getInt("gajok");
	int jikchak=rs.getInt("jikchak");
	int gunsok=rs.getInt("gunsok");
	int gitasudang=rs.getInt("gitasudang");
	int sum=rs.getInt("sum");
	no++;
	
%>
<tr>
<td align=center><%=no %></td>
<td align=center><%=id %></td>
<td align=center><%=name %></td>
<td align=right><%=fo.format(salary) %></td>
<td align=right><%=fo.format(gajok) %></td>
<td align=right><%=fo.format(jikchak) %></td>
<td align=right><%=fo.format(gunsok) %></td>
<td align=right><%=fo.format(gitasudang) %></td>
<td align=right><%=fo.format(sum) %></td>
</tr>

<%} %>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>