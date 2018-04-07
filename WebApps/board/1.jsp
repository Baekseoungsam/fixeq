<html>
<head>
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
	
</head>
<body>
	<form action="2.jsp" method="get">
		<select class="rating" name="tmp"> 
		    <option value="1">1점</option>
		    <option value="2">2점</option>
		    <option value="3" selected="selected">3점</option>
		    <option value="4">4점</option>
		    <option value="5">5점</option>
		    
		</select>
		<input type="submit" value="submit">
	</form>
	
</body>
</html>