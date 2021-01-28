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
							<td><c:out value="${ca.couponPrice }"></c:out></td>
							<td><c:out value="${ca.couponuse }"></c:out></td>
							<td><c:out value="${ca.couponbuydate }"></c:out></td>
							
							
						</tr>
					</c:forEach>
				</table>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">새로운 장소 등록!</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
						</div>
					</div>
				</div>			
				<script type="text/javascript">
				
				var placeResult = '<c:out value="${placeResult}"/>'; //register했을 때 등장
				checkModal(placeResult);
				
				history.replaceState({},null,null);
				
				function checkModal(placeResult){
					if(placeResult==='' || history.state){
						return;
					}
					if(parseInt(placeResult) > 0){
						$(".modal-body").html("새로운 게시글이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}
				
				$("#regBtn").on("click",function(){ //Register New Place!버튼
					$(".gocoup").submit();
				});
				
				
				
				
				
				</script>
			</div>
		</div>
	</div>
</div>







<%@ include file="../includes/footer.jsp" %>
