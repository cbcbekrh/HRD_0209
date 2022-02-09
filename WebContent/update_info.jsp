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
	String id=request.getParameter("id");
	pstmt=conn.prepareStatement("select * from info0209 where id=?");
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		
	

%>
<section>
<h1 style="text-align:center;">인사관리 사원등록 화면</h1><hr>
<form name="form" method="post" action="update_info_process.jsp">
<table border=1 style="margin:0 auto; width:45%">
<tr>
<th>사원번호</th>
<td><input id="in" type="text" name="id" value="<%=id %>"></td>
</tr>

<tr>
<th>성명</th>
<td><input id="in" type="text" name="name" value="<%=rs.getString("name") %>"></td>
</tr>

<tr>
<th>소속부서</th>
<td>
	<select id="sel" name="dept">
		<option value="10" <%= rs.getString("dept").equals("10") ? "selected" : "" %>>인사부</option>
		<option value="20" <%= rs.getString("dept").equals("20") ? "selected" : "" %>>기획부</option>
		<option value="30" <%= rs.getString("dept").equals("30") ? "selected" : "" %>>홍보부</option>
		<option value="40" <%= rs.getString("dept").equals("40") ? "selected" : "" %>>영업부</option>
		<option value="50" <%= rs.getString("dept").equals("50") ? "selected" : "" %>>경리부</option>
	</select>
</td>
</tr>

<tr>
<th>직급</th>
<td>
	<input type="radio" name="position" value="1" <%= rs.getString("position").equals("1") ? "checked" : "" %>>1급
	<input type="radio" name="position" value="2" <%= rs.getString("position").equals("2") ? "checked" : "" %>>2급
	<input type="radio" name="position" value="3" <%= rs.getString("position").equals("3") ? "checked" : "" %>>3급
	<input type="radio" name="position" value="4" <%= rs.getString("position").equals("4") ? "checked" : "" %>>4급
	<input type="radio" name="position" value="5" <%= rs.getString("position").equals("5") ? "checked" : "" %>>5급
</td>
</tr>

<tr>
<th>직책</th>
<td><input id="in" type="text" name="duty" value="<%=rs.getString("duty") %>"></td>
</tr>

<tr>
<th>연락처</th>
<td><input id="in" type="text" name="phone" value="<%=rs.getString("phone") %>"></td>
</tr>

<tr>
<th>주소</th>
<td><input id="in" type="text" name="address" value="<%=rs.getString("address") %>"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="수정" onclick="check()">
	<input id="b" type="button" value="취소">
</td>
</tr>
<%} %>
</table>
</form><hr>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
		if(document.form.name.value==""){
			alert("성명이 입력되지 않았습니다.");
			document.form.name.focus();
		}else{
			document.form.submit();
		}
}


</script>
</html>