<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    <%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 댓글 확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">내가 쓴 댓글 확인 페이지</h1>
	</div>
</div>
<!-- end header -->
<div class="row">
	<div class="col=lg=12">
		<div class="panel panel-default" >
			<div class="panel-heading">댓글 목록</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead >
					
						<tr style="width: 10000px;">
							<th style="width: 5%;">댓글 번호</th>
 							<th style="width: 50%;">댓글내용</th> 
							<th style="width: 5%;">점수</th>
							<th style="width: 10%;">작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>댓글쓴 게시글 번호</th>
						
							
						</tr>
					</thead>
					
					<c:forEach items="${replylist }" var="rp">
						<tr>
						
							<td><c:out value="${rp.rno }"></c:out></td>
							<td><c:out value="${rp.reply }"></c:out></td> 
							<td><c:out value="50"></c:out></td>
							<td><c:out value="${rp.replyer }"></c:out></td>
							<td><c:out value="${rp.replydate }"></c:out></td>
							<td><c:out value="${rp.updatedate }"></c:out></td>
							<td><c:out value="${rp.bno }"></c:out></td>
							
							
							
						</tr>
					</c:forEach>
					
					</table>
					
					</div>
					</div>
					</div>
					</div>
				
</body>
</html>
<%@ include file="../includes/footer.jsp"%>