<%@page import="users.vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
    <link href="https://fonts.googleapis.com/css?family=Nanum Gothic" rel="stylesheet">
<title>top</title>
</head>
<body>

 	<nav class="container-fluid navbar navbar-expand-lg navbar-light bg-dark text-uppercase" id="mainNav">
	  <a class="navbar-brand nav-link" href="/page/main.jsp" >Fixeq</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto"> 
	      <!-- 추후에 requestDistpather 연결 -->
	      <%
				MemberBean memberVO = (MemberBean)session.getAttribute("memberVO");
				if(memberVO == null){
			%>
	      <li class="nav-item">
	        <a class="nav-link" href="/users/join/joinForm.do">join</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/users/login/loginForm.do">login</a>
	      </li>
			<%		
				}else{
			%>
	      <li class="nav-item">
	        <a class="nav-link" href="/users/login/logOut.do">logout</a>
	      </li>
			<%	
				}
			%>
	      
	      
	      <li class="nav-item">
	        <a class="nav-link" href="/nav-site/contact.jsp">contact</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="영화 목록을 보여줄 리스트">movie</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/board/List.do">board</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	




</body>
</html>
