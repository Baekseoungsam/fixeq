<%@page import="jdbc.MySQLConnector"%>
<%@page import="users.vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/4.9.1/standard/ckeditor.js"></script>
<!-- 부트스트랩 -->


	<script type="text/javascript" src="/source/rating/jquery-1.6.1.min.js"></script>
	
	<script type="text/javascript" src="/source/rating/jquery.rating.js"></script>
	<link rel="stylesheet" media="screen" type="text/css" href="/source/rating/jquery.rating.css" />
	<script type="text/javascript">
		$(document).ready(function(){
			//Turn all the select boxes into rating controls
		    $(".rating").rating();
		
			//Show that we can bind on the select box
			$("#serialStar2").bind("change", function(){
				$('#serialString2').text( $('#serialStar2').serialize() );
			});
			
			$("#serialStar").rating();
			
		});		
	
	</script>
	
	
<!--  평점  -->

<title>글 작성 페이지</title>
</head>
<body>

<%
MemberBean memberVO = (MemberBean)session.getAttribute("memberVO");
if(memberVO == null){
	RequestDispatcher rd = request.getRequestDispatcher("/users/login/loginForm.do");
	rd.forward(request, response);
}
%>
<!--  로그인 세션 확인 -->

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="#">Fixeq</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link" href="/users/login/logOut.do">Logout</a>
	      </li>

	    </ul>
		  </div>
	</nav>

<!-- ======================================================================================= -->
<form method="post" name="writeForm" action="/board/InsertProc.do">
	<span>
	    <td>글 제목</td>            <td><input type="text"  name="boardTitle"" style="width: 50%"></td>
	</span>        
              	
	<br>
        <td>드라마</td>            
        <td>
        	<select name="dramaName">
	    		<option value="밥 잘 사주는 예쁜 누나">밥 잘 사주는 예쁜 누나</option>
	    		<option value="라이브">라이브</option>
	    		<option value="미워도 사랑해">미워도 사랑해</option>
        	</select>
        </td>          
		
	     <textarea name="boardContent" id="editor1" rows="20" cols="80">
                This is my textarea to be replaced with CKEditor.
         </textarea>
    <script>
     // Replace the <textarea id="editor1"> with a CKEditor
     // instance, using default configuration.
     CKEDITOR.replace( 'boardContent' );
     </script>
<!-- 게시판 작성코드 -->     
	
	점수주기
	<select class="rating" name="tmp"> 
	    <option value="1">1점</option>
	    <option value="2">2점</option>
	    <option value="3" selected="selected">3점</option>
	    <option value="4">4점</option>
	    <option value="5">5점</option>
	</select>
<!-- 별점 평가  작성코드 -->     

     <br>
            
   <input type="submit" value="글작성하기">
            
</form>



</body>
</html>