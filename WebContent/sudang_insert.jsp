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
<script>
function on(){
	document.form.submit();
}
</script>
<%
	String id=request.getParameter("id");
	String name="";
	if(id == null){
		id = "";
	}else{
		pstmt=conn.prepareStatement("select * from info0209 where id=?");
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			name=rs.getString("name");			
		}else{
			id="";
			%>
				<script>
					alert("등록된 아이디가 없습니다.");
				</script>				
			<%
		}
	}

%>
<section>
<h1 style="text-align:center;">수당 정보 등록</h1>
<form name="form" method="post" action="sudang_insert.jsp">
<table border=1 style="margin:0 auto; width:40%;">
<tr>
<th>사원번호</th>
<td><input id="in" type="text" name="id" value="<%=id %>" onchange="on();"></td>
<th>이름</th>
<td><input id="in" type="text" name="name" value="<%=name %>"></td>
</tr>

<tr>
<th>가족수당</th>
<td><input id="in" type="text" name="gajok"></td>
<th>직책수당</th>
<td><input id="in" type="text" name="jikchak"></td>
</tr>

<tr>
<th>근속수당</th>
<td colspan=3><input id="in" type="text" name="gunsok"></td>
</tr>

<tr>
<th>기타수당</th>
<td colspan=3><input id="in" type="text" name="gitasudang"></td>
</tr>

<tr>
<td colspan=4 align=center>
	<input id="b" type="button" value="목록">
	<input id="b" type="submit" value="저장" onclick="check()">
</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
	form.action="sudang_insert_process.jsp";
}
</script>
</html>