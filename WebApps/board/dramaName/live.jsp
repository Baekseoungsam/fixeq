<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>라이브</title>
</head>
<body>

	<h1>라이브</h1>
	
	<table width="100%" >
	
	    <thead align="center">
	        <tr>
	            <td colspan="2">머리 부분</td>
	        </tr>
	    </thead>
	
	    <tbody align=center>
	        <tr>
	            <td>점수 : <%=request.getAttribute("rating")%></td> 
	        </tr>
	    </tbody>
	
	    <tfoot align="center">
	        <tr>
	            <td colspan="2">이광수가 나오는 TVN의 라이브</td>
	        </tr>
	    </tfoot>
	
	</table>

</body>
</html>