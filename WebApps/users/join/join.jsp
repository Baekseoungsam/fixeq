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
  <link href="/fixeq/page/css/fixeq.css" rel="stylesheet">
	<!-- 구글 폰트 API 추가 -->
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=East Sea Dokdo:400,700" rel="stylesheet" type="text/css">
<title>회원가입</title>
</head>
<body>
<!-- 탑 인클루드 -->
<!-- iframe을 jsp:include로 변경 -->
<!-- 
 <iframe src="/page/navigation.jsp"  frameborder="0" scrolling="no"	width="100%"  height="100"></iframe>
 -->
<jsp:include page="/page/navigation.jsp"></jsp:include>

<!-- 
	<iframe src="/page/users/join/joinForm.jsp"  frameborder="0" scrolling="no"	width="100%"  height="500"></iframe>
 -->
<jsp:include page="/users/join/joinForm.jsp"></jsp:include>
	
	<!-- 바텀 인클루드 -->
<!-- 
<iframe src="/page/footer.jsp" frameborder="0" scrolling="no" width="100%"  height="200"></iframe>
 -->
<jsp:include page="/page/footer.jsp"></jsp:include>
</body>
</html>