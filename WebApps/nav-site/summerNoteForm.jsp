<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" /> 
<title>summernote</title>
	  <!-- include jquery -->
	  
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
	
	  <!-- include libraries BS -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.js"></script> 
	
	  <!-- include summernote -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>


	
<script type="text/javascript">
	  function moveBoardWrite(){
			  document.getElementById('form').submit();
	  }
	  
	    $(function() {
	      $('.summernote').summernote({
	        height: 200
	      });
	
	    });
</script>


</head>

<body>
	<form action="/board/InsertProc.do"  id="form" method="post">
	  <div class="form-group" >
	    <label for="input">Text</label>
	    <input type="text" class="form-input"  id="input"  value="Title" name="title" >
	  </div>
	  
	  <div class="form-group" >
	  	genre
	 	<select name="drama">
	 		<option value="">매체선택</option>
	 		<option value="">드라마</option>
	 		<option value="">영화</option>
	 		<option value="">예능</option>
	 		<option value="">음악</option>
	 		<option value="">웹툰</option>
	 		<option value="">다큐</option>
	 	</select>
	  </div>
	  	  
	  <div class="form-group">
	    <label for="contents">Contents</label>
	    <textarea name="text" class="summernote" id="contents" title="Contents"  name="content"></textarea>
	  </div>
	  
	  <button type="submit" class="btn btn-default" onclick="moveBoardWrite()">submit</button>
	</form>
</body>
</html>