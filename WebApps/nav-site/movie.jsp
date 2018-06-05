<%@page import="java.sql.SQLException"%>
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
  <link href="/page/css/fixeq.css" rel="stylesheet">
	<!-- 구글 폰트 API 추가 -->
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=East Sea Dokdo:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nanum Gothic" rel="stylesheet">
<title>영화 게시판</title>



<style type="text/css">


.container {
    position: relative;
    width: 100%;
}

.image {
  opacity: 1;
  display: block;
  width: 100%;
  height: auto;
  transition: .5s ease;
  backface-visibility: hidden;
}

.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}

.container:hover .image {
  opacity: 0.3;
}

.container:hover .middle {
  opacity: 1;
}

.text {
  background-color: #4CAF50;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}


</style>
</head>
<body>

<jsp:include page="/page/navigation.jsp"></jsp:include>


<div class="card-group" >
  <div class="card container">
    <img class="card-img-top image" src="/nav-site/homeComing.jpg" alt="Card image cap" style="height:800px">
      <div class="middle">
	    <div class="text">
	<%
	int rating1 = 0; // 평점의 값. 결과값으로 나올것.
	String rating2 = null; // 평점의 값. 페이지로 보낼것.
	String receiveRating1 = null; // DB에서 받아오는 평점은 스트링값.
	int receiveRating2 =0; // receiveRating1에서 DB 받아오는 평점을 정수화.
	int count=0;

	
	MySQLConnector mysql = new MySQLConnector();
	String query = "select rating from board2 where genre='spiderman'";
/* 	query.replace("%genre%", "spiderman");
 */	
	ResultSet rs = mysql.select(query, mysql.getConnection());
	
	try{
		while(rs.next()){
			receiveRating1 = rs.getString("rating");
			receiveRating2 = Integer.parseInt(receiveRating1);
			rating1 += receiveRating2;
			count++;
		}	
	}catch(SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("쿼리문 : " + query);
	}
	
	rating1 = rating1/count;
	
   %>
   			<h3>평가자 수  <%=count %></h3>
   			<h3><%=rating1%> / 5</h3>
		</div>
	  </div>
    
    <div class="card-body">
      <h2 class="card-title">스파이더맨 홈커밍</h2>
	  <h4>어벤져스가 되려면 시험 같은 거 봐요?</h4>
	  <p>‘시빌 워’ 당시 ‘토니 스타크’(로버트 다우니 주니어)에게 발탁되어  대단한 활약을 펼쳤던 스파이더맨</p> 
	  <p>그에게 새로운 수트를 선물한 ‘토니 스타크’는 위험한 일은 하지 말라며 조언한다. </p>
      <p>하지만 허세와 정의감으로 똘똘 뭉친 ‘피터 파커’는  세상을 위협하는 강력한 적 ‘벌처’에 맞서려 하는데…</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">
     	 <button type="button" class="btn btn-primary" style="width:100%" data-toggle="modal" data-target="#exampleModal" 
     	 	data-title="스파이더맨 홈커밍" data-jpg="two2.gif">
     	 		더 알아보기
     	 </button>
      </small>
    </div>
  </div>
  
  <div class="card container">
    <img class="card-img-top image" src="/nav-site/strange.jpg" alt="Card image cap" style="height:800px">
    
      <div class="middle">
	    <div class="text">
	<%
	rating1 = 0; // 평점의 값. 결과값으로 나올것.
	 rating2 = null; // 평점의 값. 페이지로 보낼것.
	 receiveRating1 = null; // DB에서 받아오는 평점은 스트링값.
	 receiveRating2 =0; // receiveRating1에서 DB 받아오는 평점을 정수화.
	 count=0;

	
	 query = "select rating from board2 where genre='drstrange'";
/* 	query.replace("%genre%", "spiderman");
 */	
	 rs = mysql.select(query, mysql.getConnection());
	
	try{
		while(rs.next()){
			receiveRating1 = rs.getString("rating");
			receiveRating2 = Integer.parseInt(receiveRating1);
			rating1 += receiveRating2;
			count++;
		}	
	}catch(SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("쿼리문 : " + query);
	}
	
	rating1 = rating1/count;
	
   %>
   			<h3>평가자 수  <%=count %></h3>
   			<h3><%=rating1%> / 5</h3>
		</div>
	  </div>
    
    
    <div class="card-body">
      <h2 class="card-title">닥터 스트레인지</h2>
	  <h4>모든 것을 초월한, 역사상 가장 강력한 히어로가 온다!</h4>
	  <p>불의의 사고로 절망에 빠진 천재 외과의사 ‘닥터 스트레인지 </p>
      <p>마지막 희망을 걸고 찾아 간 곳에서 ‘에인션트 원(틸다 스윈튼)’을 만나 세상을 구원할 강력한 능력을 얻게 되면서, </p>
      <p> 모든 것을 초월한 최강의 히어로로 거듭나는데...</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">
     	 <button type="button" class="btn btn-primary" style="width:100%" data-toggle="modal" data-target="#exampleModal" 
     	 	data-title="닥터 스트레인지" data-jpg="one1.gif">
     	 		더 알아보기
     	 </button>
      </small>
    </div>
  </div>
  
  <div class="card container">
    <img class="card-img-top image" src="/nav-site/ironMan.jpg" alt="Card image cap" style="height:800px">
    
    
      <div class="middle">
	    <div class="text">
	<%
	rating1 = 0; // 평점의 값. 결과값으로 나올것.
	 rating2 = null; // 평점의 값. 페이지로 보낼것.
	 receiveRating1 = null; // DB에서 받아오는 평점은 스트링값.
	 receiveRating2 =0; // receiveRating1에서 DB 받아오는 평점을 정수화.
	 count=0;

	
	 query = "select rating from board2 where genre='ironman'";
/* 	query.replace("%genre%", "spiderman");
 */	
	 rs = mysql.select(query, mysql.getConnection());
	
	try{
		while(rs.next()){
			receiveRating1 = rs.getString("rating");
			receiveRating2 = Integer.parseInt(receiveRating1);
			rating1 += receiveRating2;
			count++;
		}	
	}catch(SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("쿼리문 : " + query);
	}
	
	rating1 = rating1/count;
	
   %>
   			<h3>평가자 수  <%=count %></h3>
   			<h3><%=rating1%> / 5</h3>
		</div>
	  </div>
    
    
    <div class="card-body">
      <h2 class="card-title">아이언 맨</h2>
	  <h4>하이테크 슈퍼 히어로의 탄생 | 이제 업그레이드는 끝났다</h4>
						  
	  <p>천재적인 두뇌와 재능으로 세계 최강의 무기업체를 이끄는 CEO이자, 타고난 매력으로 셀러브리티 못지않은 화려한 삶을 살아가던 억만장자 토니 스타크</p> 
	  <p>아프가니스탄에서 자신이 개발한 신무기 발표를 성공리에 마치고 돌아가던 그는 게릴라군의 갑작스런 공격에 의해 가슴에 치명적인 부상을 입고 게릴라군에게 납치된다</p>
	</div>
    <div class="card-footer">
      <small class="text-muted">
     	 <button type="button" class="btn btn-primary" style="width:100%" data-toggle="modal" data-target="#exampleModal" 
     	 	data-title="아이언 맨" data-jpg="three3.gif">
     	 		더 알아보기
     	 </button>
      </small>
    </div>
  </div>
</div>



<jsp:include page="/page/footer.jsp"></jsp:include>




<div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Movie Title</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
		          <span aria-hidden="true">&times;</span>
		        </button>
	      </div>
	      
      
	      <div class="modal-body">
		        <div>
				    <img class="card-img-top" src="movie.jpg" alt="movieJpg" style="height:300px; width:100%">
		        </div>
	      </div>
	      
      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
      
    </div>
  </div>
</div>
<script>
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var title = button.data('title') 
	  var jpg = button.data('jpg')// Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text(title)
	  modal.find('.modal-body img').attr("src",jpg)
	  modal.find('.modal-body input').val(recipient)
	})
</script>



</body>
</html>