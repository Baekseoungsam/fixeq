<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.MySQLConnector"%>
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
    <link href="https://fonts.googleapis.com/css?family=Nanum Gothic" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Pangolin" rel="stylesheet">
	
	<script>
	function moveBoardInsert(){
		location.href="/fixeq/board/InsertForm.do";
	}
	</script>

<title>메인페이지</title>
</head>
<body>
<!-- 탑 인클루드 -->
<!-- 
 <iframe src="/page/navigation.jsp"  frameborder="0" scrolling="no"	width="100%"  height="100"></iframe>
 -->
<jsp:include page="/page/navigation.jsp"></jsp:include>
	<h2 class="text-center text-uppercase text-secondary mb-0">media board</h2>
	<div class="table-responsive">
	<table class="table">
	  <thead class="thead-light">
	    <tr>
	      <th scope="col" class = "text-uppercase text-center">idx</th>
	      <th scope="col" class = "text-uppercase text-center" colspan="2" >title</th>
	      <th scope="col" class = "text-uppercase text-center">               </th>
	      <th scope="col" class = "text-uppercase text-center">writer</th>
	      <th scope="col" class = "text-uppercase text-center">datetime</th>
	      <th scope="col" class = "text-uppercase text-center">views</th>
	      
	    </tr>
	  </thead>
	  <tbody>
 		
 		<!-- 보드VO 사용 -->
 		<%
 		MySQLConnector mysql = new MySQLConnector();
 		String query = "select * from board2 order by time desc";
 		ResultSet rs = mysql.select(query, mysql.getConnection());
 		while(rs.next()){
 			%>
 		    <tr>
 		      <th scope="row" style="text-align:center;"><%= rs.getInt("idx") %></th>
 		      <td colspan="2"><a href="/fixeq/board/viewForm.do?idx=<%=rs.getString("idx")%>"><%= rs.getString("title") %></a></td>
 		      <td></td>
 		      <td><%= rs.getString("writerid") %></td>
 		      <td><%=rs.getString("time") %></td>
 		    </tr>
 		    <%
 		}
 		%>
	  </tbody>
	</table>
	</div>
	<!-- 페이징 처리 다시 하자. -->
	<%
	String pagingStr="";
	int pageInt = 0;
	if(pagingStr == null){
		pageInt = 1;
	}else{
		pageInt =  Integer.parseInt(request.getParameter("pagingStr"));
	}
	int totalCount = 255; // 전체 게시글 갯수
	int countList = 10; // 한 리스트에 들어가는 게시글 수 10개
	int countPage  = 10; // 한 화면에 들어가는 페이지 수 10개
	int totalPage = totalCount / countList ;  // 페이지 갯수
	
	if(totalCount % countList >0 ){
		totalPage++;
	}
	
	if(pageInt > totalPage){ // 전체 페이지보다 현재 페이지의 크기가 더 크다면 ,
		pageInt =  totalPage;  // 현재 페이지를 전체크기로 맞춤.
	}
	
	int startPage = ((pageInt-1) / countPage * 10) + 1;
	int endPage = startPage + countPage -1;
	
	if(endPage > totalPage){ //리스트의 끝 페이지번호가 전체 번호보다 크면 끝페이지 번호는 전체번호로
		endPage = totalPage;
	}
	
	if(startPage>10){
	%>
		<a href="boardlist.jsp?pagingStr=<%=startPage-10%>">이전</a>  
	<%	
	}


	
	for (int i = startPage ; i <=endPage; i++){
		if(pageInt == i ){
	%>
			<b> <%= i %> </b> 
	<% 
		}else{			
	%>
		<a href="/fixeq/nav-site/boardlist.jsp?pagingStr=<%=i%>">	 <%= i %></a>  
	<% 
		}
	}
	if(endPage < totalPage){
	%>
		<a href="boardlist.jsp?pagingStr=<%=startPage+10%>">다음</a>  
	<%
	}
	%>

	
	
	
	<div class="container">
	  <div class="row">
	    <div class="col-sm">
	    </div>
	    <div class="col-sm">
	    </div>
	    <div class="col-sm-1">
			<input class="btn btn-primary" type="button" value="Write" onclick="moveBoardInsert()">
	    </div>
	  </div>
	</div>

<!-- 바텀 인클루드 -->
<!-- 
<iframe src="/page/footer.jsp" frameborder="0" scrolling="no" width="100%"  height="200"></iframe>
 -->
<jsp:include page="/page/footer.jsp"></jsp:include>
 
</body>
</html>