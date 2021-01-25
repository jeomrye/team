<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@include file="../includes/header.jsp" %>



<form action="/coupon/couponBuy" method="post" role="form">
	
	<input type="hidden" class="q" name="couponnumber" value='<c:out value="${coupon1.couponNumber}"/>'>
	<input type="hidden" class="w" name="couponname" value='<c:out value="${coupon1.couponName}"/>'>
    <input type='hidden' id='e' name='couponprice' value='<c:out value="${coupon1.couponPrice}"/>'>
    <input type='hidden' id='r' name='mileage' value='<c:out value="${member.mileage}"/>'>
  <%--  <input type='hidden' class="userid" id="userid" name="userid" value='<sec:authentication property="principal.username"/>'> --%>
    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
    <input type="hidden" class="userid" name="userid" value="${member.userid}">
    <input type="hidden" class="auth" name="auth" value="${auth.auth }">

</form>

<h1>쿠폰을 구매하시겠습니까?</h1>
<button type="submit" data-oper='submit' class="btn btn-primary">구입</button>
<button type="submit" data-oper='return' class="btn btn-default">돌아가기</button>

<input type="number" class="s" value='<c:out value="${coupon1.couponPrice}"/>'>
<input type="number" class="m" value='<c:out value="${member.mileage}"/>'>


<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function(e){
	
	var userid = $(".userid").val();
	var auth = $(".auth").val();
	var formObj = $("form");
	var num = $(".q").val();
	var name = $(".w").val();
	var price = $("#e").val();
	var mile = $("#r").val();
	
	
	<sec:authorize access="isAuthenticated()">
  	ROLE_USER = '<sec:authentication property="principal.authorities"/>';
  	</sec:authorize>

  	
	var csrfHeaderName ="${_csrf.headerName}";
  	var csrfTokenValue="${_csrf.token}";
 	//Ajax spring security header	== ajax 를 이용한 csrf 토큰 전송
  	$(document).ajaxSend(function(e, xhr, options){
  		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
  	});
	
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		console.log(num);
		console.log(name);
		console.log(price);
		console.log(mile);
		console.log(userid);
		console.log(auth);

		
		if(operation === 'return'){
			formObj.attr("action", "/main/mainpage").attr("method", "get");
			
		}else if(operation === 'submit'){
			formObj.attr("action","/coupon/couponBuy").attr("method","post");
			var finMileage = "";
			var couponPrice = price;
			var mileage = mile;
			
			if(mileage - couponPrice < 0){
				alert("구매 실패 마일리지 부족");
			}else if(mileage - couponPrice >= 0){
			finMile = mileage - couponPrice;
			alert("구매 완료");
			console.log(finMileage);
			return finMileage;
			
		}
			
		}
		formObj.submit();
	});
	

	
});
</script>
