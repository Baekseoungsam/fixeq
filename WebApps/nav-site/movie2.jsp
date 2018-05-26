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
	<link href="https://fonts.googleapis.com/css?family=Pangolin" rel="stylesheet">
	<!-- 별표 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	



<title>Movie</title>

<style>

body, html {
    height: 100%;
    margin: 0;
}

.hero-image {
  background-image: url("ironMan3.gif");
  height: 50%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}

.hero-text button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 10px 25px;
  color: black;
  background-color: #ddd;
  text-align: center;
  cursor: pointer;
}

.hero-text button:hover {
  background-color: #555;
  color: white;
}




html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}






.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5px auto; /* 15% from the top and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
    /* Position it in the top right corner outside of the modal */
    position: absolute;
    right: 25px;
    top: 0; 
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
</style>



</head>
<body>

<jsp:include page="/page/navigation.jsp"></jsp:include>


<div class="hero-image">
  <div class="hero-text">
    <h1 style="font-size:50px">This is Marvle</h1>
    <p>I'm ironMan</p>
    <button>COME ON</button>
  </div>
</div>












<h2>Today we touch this movie</h2>
<p>Avengers3 : Infinity war</p>
<br>

<div class="row">
  <div class="column">
    <div class="card">
      <img src="one1.gif" alt="Mike" style="width:100%"  height="300px" >
      <div class="container">
        <h2>닥터스트레인지</h2>
        <p class="title">Dr.Strange</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>example@example.com</p>
        
        <p><button id="myBtn"	class = "button" onclick="document.getElementById('id01').style.display='block'">더 알아보기</button></p>
        
        <!-- The Modal -->
			<div id="id01" class="modal" height="80%"> 
			
					<!-- Modal content -->
					<div class="modal-content">
					  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
					
						<div class="modal-header" >
						    <h1>닥터 스트레인지</h1>
						</div>
						  <div class="modal-body" style="float: left">
						   <img src="strange.jpg" alt="Jane" style="width:20%" height="400px">
						  </div>
						  
						  <div class="modal-body" style="float: right">
							  <h1>“어벤져스가 되려면 시험 같은 거 봐요?”</h1>
								  
								  <p>‘시빌 워’ 당시 ‘토니 스타크’(로버트 다우니 주니어)에게 발탁되어  대단한 활약을 펼쳤던 스파이더맨</p> 
								  <p>그에게 새로운 수트를 선물한 ‘토니 스타크’는 위험한 일은 하지 말라며 조언한다. 
 하지만 허세와 정의감으로 똘똘 뭉친 ‘피터 파커’는  세상을 위협하는 강력한 적 ‘벌처’에 맞서려 하는데…</p>
								  
						  </div>
					</div>			
			</div>
			
			
      </div>
    </div>
  </div>


  <div class="column">
    <div class="card">
      <img src="two2.gif" alt="Mike" style="width:100%"  height="300px" >
      <div class="container">
        <h2>스파이더맨 홈커밍</h2>
        <p class="title">IronMan</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>example@example.com</p>
        
        <p><button id="myBtn"	class = "button" onclick="document.getElementById('id02').style.display='block'">더 알아보기</button></p>
        
        <!-- The Modal -->
			<div id="id02" class="modal" height="80%"> 
			
					<!-- Modal content -->
					<div class="modal-content">
					  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
					
						<div class="modal-header" >
						    <h1>스파이더맨 홈커밍</h1>
						</div>
						  <div class="modal-body" style="float: left">
						   <img src="homeComing.jpg" alt="Jane" style="width:20%" height="400px">
						  </div>
						  
						  <div class="modal-body" style="float: right">
							  <h1>“어벤져스가 되려면 시험 같은 거 봐요?”</h1>
								  
								  <p>‘시빌 워’ 당시 ‘토니 스타크’(로버트 다우니 주니어)에게 발탁되어  대단한 활약을 펼쳤던 스파이더맨</p> 
								  <p>그에게 새로운 수트를 선물한 ‘토니 스타크’는 위험한 일은 하지 말라며 조언한다. 
 하지만 허세와 정의감으로 똘똘 뭉친 ‘피터 파커’는  세상을 위협하는 강력한 적 ‘벌처’에 맞서려 하는데…</p>
								  
						  </div>
					</div>			
			</div>
			
			
      </div>
    </div>
  </div>
  
          <script>
//Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
  
  
  <div class="column">
    <div class="card">
      <img src="three3.gif" alt="John" style="width:100%" height="300px">
      <div class="container">
        <h2>아이언맨</h2>
        <p class="title">Spider</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>example@example.com</p>
        <p><button id="myBtn"	class = "button" onclick="document.getElementById('id03').style.display='block'">더 알아보기</button></p>
        
                <!-- The Modal -->
			<div id="id03" class="modal" height="80%"> 
			
					<!-- Modal content -->
					<div class="modal-content">
					  <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>
					
						<div class="modal-header" >
						    <h1>아이언맨</h1>
						</div>
						  <div class="modal-body" style="float: left">
						   <img src="ironMan.jpg" alt="Jane" style="width:20%" height="400px">
						  </div>
						  
						  <div class="modal-body" style="float: right">
							  <h1>하이테크 슈퍼 히어로의 탄생 | 이제 업그레이드는 끝났다</h1>
								  
								  <p>천재적인 두뇌와 재능으로 세계 최강의 무기업체를 이끄는 CEO이자, 타고난 매력으로 셀러브리티 못지않은 화려한 삶을 살아가던 억만장자 토니 스타크</p> 
								  <p>아프가니스탄에서 자신이 개발한 신무기 발표를 성공리에 마치고 돌아가던 그는 게릴라군의 갑작스런 공격에 의해 가슴에 치명적인 부상을 입고 게릴라군에게 납치된다</p>
								  
						  </div>
					</div>			
			</div>
        
        
      </div>
    </div>
  </div>
</div>

<jsp:include page="/page/footer.jsp"></jsp:include>



</body>
</html>