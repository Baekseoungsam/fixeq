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
  <link href="/fixeq/page/css/fixeq.css" rel="stylesheet">
	<!-- 구글 폰트 API 추가 -->
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=East Sea Dokdo:400,700" rel="stylesheet" type="text/css">
<title>join</title>
</head>
<body>

<div class="jumbotron">

	<form action="/fixeq/users/join/joinProc.do" method="post">
	  <div class="form-group">
	    <label for="userid">아이디</label>
	    <input type="text" class="form-control" name="userid"  placeholder="Enter your id">
	  </div>
	  <div class="form-group">
	    <label for="userpassword">비밀번호</label>
	    <input type="password" class="form-control" name="userpw" placeholder="Enter your password">
	  </div>
	  <div class="form-group">
	    <label for="name">이름</label>
	    <input type="text" class="form-control" name="name"  placeholder="Enter your name">
	  </div>
	  <div class="form-group">
	    <label for="email">이메일</label>
	    <input type="email" class="form-control" name="email" placeholder="Enter your email">
	  </div>
	  	  
		<input type="submit" value="회원가입" class="btn btn-primary"> 
	</form>
	
</div>

</body>
</html>