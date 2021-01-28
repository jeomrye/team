<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
#buy{
padding-top: 15%;
padding-left: 40%;
}
#cou{
margin-left: 10%;
}

</style>
<%@include file="../includes/header.jsp" %>



<form action="/coupon/couponBuy1" method="post" class="operForm">
	
	<input type="hidden" class="q" name="couponnumber" value='<c:out value="${coupon1.couponNumber}"/>'>
	<input type="hidden" class="w" name="couponname" value='<c:out value="${coupon1.couponName}"/>'>
    <input type='hidden' id='e' name='couponprice' value='<c:out value="${coupon1.couponPrice}"/>'>
    <input type='hidden' id='r' name='mileage' value='<c:out value="${member.mileage}"/>'>
 	<input type='hidden' class="userid" id="userid" name="userid" value='<sec:authentication property="principal.username"/>'>
    <input type="hidden" class='tk' name="${_csrf.parameterName }" value="${_csrf.token }"/>

</form>

<div id="buy">
<h1>쿠폰을 구매하시겠습니까? </h1>
<button type="submit" id="cou" data-oper='submit' class="btn btn-primary">구입</button>
<button type="submit" id="return" data-oper='return' class="btn btn-default">돌아가기</button>
</div>



<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function(e){
	
	var userid = $(".userid").val();
	var auth = $(".auth").val();
	var formObj = $(".operForm");
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
		
		console.log(operation);
		
		if(operation === 'return'){
			formObj.find(".userid").remove();
			formObj.find(".q").remove();
			formObj.find(".w").remove();
			formObj.find("#e").remove();
			formObj.find("#r").remove();
			formObj.find(".tk").remove();
			formObj.attr("action", "/main/mainpage").attr("method", "get").submit();
			
		}else if(operation === 'submit'){
			
			var finMileage = "";
			var couponPrice = price;
			var mileage = mile;
			
			if(mileage - couponPrice < 0){
				alert("구매 실패 마일리지 부족");
			}else if(mileage - couponPrice >= 0){
			finMileage = mileage - couponPrice;
			console.log(finMileage);
			alert("구매 완료");
			formObj.submit();
			
			
		}
			
		}
		
	});
	

	
});
</script>
