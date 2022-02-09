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
<section>
<h1 style="text-align:center;">사원 정보 조회</h1><hr>
<table border=1 style="margin:0 auto; width:60%;">
<tr>
<th>no</th>
<th>사번</th>
<th>성명</th>
<th>직급</th>
<th>직책</th>
<th>연락처</th>
<th>소속부서</th>
<th>주소</th>
<th>관리</th>
</tr>

<%
	int no=0;
	pstmt=conn.prepareStatement("select * from info0209");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString("id");
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		if(dept.equals("10")){
			dept="인사부";
		}else if(dept.equals("20")){
			dept="기획수";
		}else if(dept.equals("30")){
			dept="홍보부";
		}else if(dept.equals("40")){
			dept="영업부";
		}else{
			dept="경리부";
		}		
		String position=rs.getString("position");
		String duty=rs.getString("duty");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		no++;
%>
<tr>
<td align=center><%=no %></td>
<td align=center><a href="update_info.jsp?id=<%=id %>"><%=id %></a></td>
<td align=center><%=name %></td>
<td align=center><%=position %></td>
<td align=center><%=duty %></td>
<td align=center><%=phone %></td>
<td align=center><%=dept %></td>
<td align=center><%=address %></td>
<td align=center>
	<a href="delete_info.jsp?id=<%=id %>" onclick="if(!confirm('정말 삭제하시겠습니까?'))return false;">삭제</a>
</td>

</tr>


<%} %>
</table><hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>