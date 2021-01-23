<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    <%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 확인페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">쿠폰 확인 페이지</h1>
	</div>
</div>
<!-- end header -->
<div class="row">
	<div class="col=lg=12">
		<div class="panel panel-default" >
			<div class="panel-heading">회원 정보 목록</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							
							<th>쿠폰 넘버</th>
							<th>쿠폰 이름</th>
							<th>쿠폰 가격</th>
							<th>사용여부</th>
							<th>구매일</th>
						
							
						</tr>
					</thead>
					
					<c:forEach items="${cplist }" var="cp">
						<tr>
						
							<td><c:out value="${cp.couponnumber }"></c:out></td>
							<td><c:out value="${cp.couponname }"></c:out></td>
							<td><c:out value="${cp.couponprice }"></c:out></td>
							<td><c:out value="${cp.couponuse }"></c:out></td>
							<td><c:out value="${cp.couponbuydate }"></c:out></td>
							
							
						</tr>
					</c:forEach>
					
					</table>
					
					</div>
					</div>
					</div>
					</div>
				
</body>
</html>