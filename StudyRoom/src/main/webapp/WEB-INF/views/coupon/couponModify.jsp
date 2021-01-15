<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>

         <div class="panel-heading">
                            <h2>쿠폰 정보 수정</h2>
                          
                        </div>

<form role="form" action="/coupon/couponModify" method="post">

<div class="form-group">
	<label>쿠폰 번호</label>
	<input class="form-control" name='couponNumber' value='<c:out value="${coupon.couponNumber}"/>' readonly='readonly'>
</div>

<div class="form-group">
	<label>쿠폰 이름</label>
	<input class="form-control" name='couponName' value='<c:out value="${coupon.couponName}"/>'>
</div>

<div class="form-group">
	<label>쿠폰 가격</label>
	<input class="form-control" name='couponPrice' value='<fmt:formatNumber value="${coupon.couponPrice}" pattern="###,###,###"/>'>
</div>

<div class="form-group">
	<label>등록 날짜</label>
	<input class="form-control" name='couponregDate' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${coupon.couponregDate}"/>' readonly='readonly'>
</div>

<div class="form-group">
	<label>수정 날짜</label>
	<input class="form-control" name='couponupdateDate' value='<fmt:formatDate pattern="yyyy/MM/dd" value=""/>'>
</div>

<button type="submit" date-oper='modify' class="btn btn-default">수정</button>
<button type="submit" date-oper='remove' class="btn btn-danger">삭제</button>
<button type="submit" date-oper='list' class="btn btn-info">목록</button>
</form>



<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/coupon/couponRemove");
		}else if(operation === 'list'){
			//리스트로 이동
			formObj.attr("action", "/coupon/couponList").attr("method", "get");
			formObj.empty();
			
		}
		formObj.submit();
	});
});
</script>