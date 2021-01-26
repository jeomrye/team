<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@include file="../includes/header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>수정페이지</title>
<style>
	.wrapper{
		width: 1900px;	
	}

	.wrap{
		width : 800px;
		margin-left: 670px;
		float: none;
	}
	
	


/* 리셋하기 버튼 */
.remove_button{
	width: 30%;
    height: 60px;
    background-color: #8583e7;
    font-size: 40px;
    font-weight: 900;
    color: white;
    float: none;
}
/* 취소하기 버튼 */
.return_button{
	width: 30%;
    height: 60px;
    background-color: #e0364f;
    font-size: 40px;
    font-weight: 900;
    color: white;
    float: right;
}

/* float 속성 해제 */
.clearfix{
	clear: both;
}

.correct{
    color : green;
}
.incorrect{
    color : red;
}
/* 유효성검사 span부분 */

.pw_ck{
	display: none;
}
.pwCk_ck{
	display: none;
}
.email_ck{
	display: none;
}
.phone_ck{
	display: none;
}
.gender_ck{
	display: none;
}
.companynumber_ck{
	display: none;
}



</style>

</head>
<body>




<div class="wrapper">
<form id="delete" action="/mypage/deleteinfo1" method="post">
		<input type="hidden" id="userid" name="userid" value='<c:out value="${vo.userid }"></c:out>'>
		<input type="hidden" id="password" name="password" value='<c:out value="${vo.password }"></c:out>'>
		<input type="hidden" id="phone" name="phone" value='<c:out value="${vo.phone }"></c:out>'>
		<input type="hidden" id="updatedate"  name="updatedate" value='<fmt:formatDate pattern= "yy/MM/dd" value="${vo.updatedate }" />'>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>	<!-- csrf토큰 -->

<div class="wrap">
	<div class="col-lg-12">
		<h1 class="page-header">회원 탈퇴페이지</h1>
	</div>


<h1>정말로 탈퇴하시겠습니까??</h1>



	
	<button type="submit" class="remove_button" data-oper='remove'>탈퇴하기</button>
	<button type="button" class="return_button" data-oper='cancel'>취소하기</button>



</div>
</form>
</div>

<script type="text/javascript">




	$(document).ready(function() {
		
		var csrfHeaderName ="${_csrf.headerName}";
  	  	var csrfTokenValue="${_csrf.token}";
  	  	//Ajax spring security header	== ajax 를 이용한 csrf 토큰 전송
  	  	$(document).ajaxSend(function(e, xhr, options){
  	  		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
  	  	});
  	  	
  	  	
		
		var formObj = $("#delete");
		
		$("button[data-oper='cancel']").on("click", function(e) {
			history.go(-1);
		});

		var formObj = $("#delete");
		$("button[data-oper='remove']").on("click", function(e) {
			
			
	      
	    	   formObj.attr("action","/mypage/deleteinfo1");
			
	    	  formObj.submit();
			alert("회원탈퇴가 정상적으로 처리되었습니다");
	       
			
		});
		
		
	});
	
	
	
	
</script>






    
</body>
</html>
<%@ include file="../includes/footer.jsp" %>