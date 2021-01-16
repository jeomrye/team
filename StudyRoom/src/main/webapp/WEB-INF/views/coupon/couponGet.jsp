<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>


  
 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">쿠폰 정보</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            쿠폰 정보 페이지
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
<div class="form-group">
<input type="hidden" class="form-control" name='couponNumber' value='<c:out value="${coupon.couponNumber}"/>' readonly="readonly">
</div>

<div class="form-group">
<label for="couponImg">쿠폰 이미지</label>
<img src="${coupon.couponImg}" class="oriImg">

</div>

<div>
<img src="../resources/img/ddddd.png" class="img-rounded" alt="쿠폰 이미지" width="400" height="240">
</div>

<div class="form-group">
<label>쿠폰 이름</label><input class="form-control" name='couponName' value='<c:out value="${coupon.couponName}"/>' readonly="readonly">
</div>

<div class="form-group">
<label>쿠폰 가격</label><input class="form-control" name='couponPrice' value='<fmt:formatNumber value="${coupon.couponPrice}" pattern="###,###,###"/>' readonly="readonly">
</div>

<!-- 쿠폰 상세보기 에서 수정이나 목록페이지로 이동 -->
<button data-oper='modify' class="btn btn-default">수정</button>
<button data-oper='sbumit' class="btn btn-primary">구입</button>
<button data-oper='list' class="btn btn-info">목록</button>



<form id='operForm' action="/coupon/couponModify" method="get">
	<input type='hidden' id='couponNumber' name='couponNumber' value='<c:out value="${coupon.couponNumber}"/>'>
</form>

<%@include file="../includes/footer.jsp" %>


<script type="text/javascript">

$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		
		operForm.attr("action", "/coupon/couponModify").submit();
		
	});
	
	$("button[data-oper='list']").on("click", function(e){
		
		operForm.find("#couponNumber").remove();
		operForm.attr("action", "/coupon/couponList")
		operForm.submit();
	});
	
});

</script>



































