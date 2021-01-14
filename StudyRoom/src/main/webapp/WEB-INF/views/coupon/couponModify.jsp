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
	<input class="form-control" name='couponNumber' value='<c:out value="${coupon.couponNumber}"/>'>
</div>

<div class="form-group">
	<label>쿠폰 이름</label>
	<input class="form-control" name="couponName" value='<c:out value="${coupon.couponName}"/>'>
</div>

<div class="form-group">
	<label>쿠폰 가격</label>
	<input class="form-control" name="couponPrice" vlaue='<c:out value="${coupon.couponPrice}"/>'>
</div>

<div class="form-group">
	<label>등록 날짜</label>
	<input class="form-control" name="couponregDate" value='<c:out value="${coupon.couponregDate}"/>' readonly='readonly'>
</div>

<div class="form-group">
	<label>수정 날짜</label>
	<input class="form-control" name="couponupdateDate" value='<c:out value="${coupon.couponupdateDate}"/>'>
</div>

<button type="submit" date-oper='modify' class="btn btn-default">수정</button>
<button type="submit" date-oper='remove' class="btn btn-danger">삭제</button>
<button type="submit" date-oper='list' class="btn btn-info">목록</button>
</form>



<%@include file="../includes/footer.jsp" %>