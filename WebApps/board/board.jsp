<%@page import="java.io.PrintWriter"%>
<%@page import="users.vo.MemberBean"%>
<%@page import="jdbc.MySQLConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

	<!-- 부트스트랩 CSS 내식대로 변경 -->
  <link href="/page/css/fixeq.css" rel="stylesheet">
	<!-- 구글 폰트 API 추가 -->
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=East Sea Dokdo:400,700" rel="stylesheet" type="text/css">
    
    
<title>게시판</title>
</head>
<body>
<!-- 탑 인클루드 -->
<!-- iframe을 jsp:include로 변경 -->
<!-- 
 <iframe src="/page/navigation.jsp"  frameborder="0" scrolling="no"	width="100%"  height="100"></iframe>
 -->
<jsp:include page="/page/navigation.jsp"></jsp:include>

<form action="/board/InsertProc2.do" method="post">
	<br>
	<br>

	제목 <input type="text" style="width:50%" name="title"> 
	
	
	작성자 
			<%
			HttpSession vo =request.getSession();
			MemberBean memberVO = (MemberBean)vo.getAttribute("memberVO");
			if(memberVO == null){

				response.setContentType("text/html");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out2 = response.getWriter();
				out2.write("<script>");
				out2.write("alert('로그인이 필요합니다.');");
				out2.write("location.href='/users/login/loginForm.do';");
				out2.write("</script>");
			
			}
			String writer = memberVO.getName();
			%> 
	
			<%=writer %> 
	<br>
	<br>
	
	비밀번호 <input type="password"  name="writerpw">
	
	<br>
	<br>
	
					
					
	매체제목<select name = "genre">
				<option value="">매체선택</option>
				<option value="spiderman">spiderman</option>
				<option value="drstrange">dr.starnge</option>
				<option value="ironman">ironman</option>
			</select>
	
					
	점수 <select name = "score">
				<option value="">점수선택</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			
	시청여부	<input type="radio" checked name="history" value="1">O
					<input type="radio"  name="history" value="0">X
	<br>
	<br>
	<br>
	
	<textarea rows="10" cols=260  name="content"></textarea>
	<input type="submit" value="작성하기">
		
</form>
	
	<!-- 바텀 인클루드 -->
<!-- 
<iframe src="/page/footer.jsp" frameborder="0" scrolling="no" width="100%"  height="200"></iframe>
 -->
<jsp:include page="/page/footer.jsp"  ></jsp:include>
</body>
</html>