<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">내쿠폰게시판</h1>
	</div>
</div>

<div class="row"> 
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">내쿠폰게시판
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
			<button type="button" id='regBtn' class="btn btn-xs pull-right">쿠폰사용 등록하기</button>
			<form action="/mypage/usecoupon" method="post" class="gocoup">
			<input type="hidden" class="userid" name="userid" value="<sec:authentication property="principal.username" />">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			</form>
			
			
			</sec:authorize>
			
			</div>
			<div class="panel-body">
				<table class="table eable-striped table-bordered table-hover">
					<thead>
						<tr>
							<th style="width: 10%">아이디</th>
							<th style="width: 40%">넘버</th>
							<th style="width: 10%">쿠폰이름</th>
							<th style="width: 10%">시리얼넘버</th>
							<th style="width: 10%">가격</th>
							<th style="width: 10%">사용여부</th>
							<th style="width: 10%">구매일자</th>
						</tr>
					</thead>
					<c:forEach items="${cplist }" var="ca">
						<tr>
							<td><c:out value="${ca.userid }"></c:out></td>
							<td><c:out value="${ca.couponnumber }"></c:out></td>
							<td><c:out value="${ca.couponName }"></c:out></td>
							<td><c:out value="${ca.coup }"></c:out></td>
							<td><c:out value="${ca.couponPrice }"></c:out></td>
							<td><c:out value="${ca.couponuse }"></c:out></td>
							<td><c:out value="${ca.couponbuydate }"></c:out></td>
							
							
						</tr>
					</c:forEach>
				</table>
				
				<script type="text/javascript">
				
				
				
				$("#regBtn").on("click",function(){ //Register New Place!버튼
					$(".gocoup").submit();
				});
				
				
				
				
				
				</script>
			</div>
		</div>
	</div>
</div>







<%@ include file="../includes/footer.jsp" %>
