<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>

<form action="/couponBuy" method="post" role="form">
	<input type='hidden' id='couponNumber' name='couponNumber' value='<c:out value="${coupon.couponNumber}"/>'>
    <input type='hidden' id='couponname' name='couponname' value='<c:out value="${coupon.couponname}"/>'>
    <input type='hidden' id='couponprice' name='couponprice' value='<c:out value="${coupon.couponprice}"/>'>
</form>


<button type="submit" data-oper='submit' class="btn btn-primary">구입</button>
<button type="submit" data-oper='return' class="btn btn-default">돌아가기</button>




<%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
$(document).ready(function(e){
	
	var formObj = $("form");
	var num = $(".couponNumber").val();
	var name = $(".couponname").val();
	var price = $(".couponprice").val();
	
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		console.log(num);
		console.log(name);
		console.log(price);
		
		if(operation === 'return'){
			formObj.attr("action", "/coupon/couponList").attr("method", "get")
			
		}
		formObj.submit();
	});
});
</script>
