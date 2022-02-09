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
	int cnt=0;
	pstmt=conn.prepareStatement("select max(id) from info0209");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1)+1;
	}

%>
<section>
<h1 style="text-align:center;">인사관리 사원등록 화면</h1><hr>
<form name="form" method="post" action="insert_info_process.jsp">
<table border=1 style="margin:0 auto; width:45%">
<tr>
<th>사원번호(자동생성)</th>
<td><input id="in" type="text" name="id" value="<%=cnt %>"></td>
</tr>

<tr>
<th>성명</th>
<td><input id="in" type="text" name="name"></td>
</tr>

<tr>
<th>소속부서</th>
<td>
	<select id="sel" name="dept">
		<option value="10">인사부</option>
		<option value="20">기획부</option>
		<option value="30">홍보부</option>
		<option value="40">영업부</option>
		<option value="50">경리부</option>
	</select>
</td>
</tr>

<tr>
<th>직급</th>
<td>
	<input type="radio" name="position" value="1">1급
	<input type="radio" name="position" value="2">2급
	<input type="radio" name="position" value="3">3급
	<input type="radio" name="position" value="4">4급
	<input type="radio" name="position" value="5">5급
</td>
</tr>

<tr>
<th>직책</th>
<td><input id="in" type="text" name="duty"></td>
</tr>

<tr>
<th>연락처</th>
<td><input id="in" type="text" name="phone"></td>
</tr>

<tr>
<th>주소</th>
<td><input id="in" type="text" name="address"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="등록" onclick="check()">
	<input id="b" type="button" value="취소">
</td>
</tr>
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