<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <title>마이페이지</title>
<style>
	.wrapper{
		width: 100vw;
		height: 100vh;	
		
	}

	.wrap{
		width : 50%;
		margin-left: 25%;
		float: none;
	}
	
	.id_input_re_1{
		color: green;
		display: none;
	}
	
	.id_input_re_2{
		color: red;
		display: none;
	}
	#email_check_input_box_false{
    	background-color:#ebebe4;
	}
 
	#email_check_input_box_true{
    	background-color:white;
	}
	.email_input_re_1{
		color: green;
		display: none;
	}
	
	.email_input_re_2{
		color: red;
		display: none;
	}
	.companynumber_input_re_1{
		color: green;
		display: none;
	}
	.companynumber_input_re_2{
		color: red;
		display: none;
	}
	

/* 아이디 영역 */
.userid_wrap{
	width: 100%;
    margin-top: 20px;
}
.userid_name{
	font-size: 25px;
    font-weight: bold;
}
.userid_input_box{
	border: 1px solid black;
	
	
}
.userid_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}
/* 맴버 권한 선택 */
.memberno_wrap{
	width: 100%;
	margin-top: 20px;
}
.memberno_name{
	font-size: 25px;
    font-weight: bold;
}
.memberno_input_box{
	border: 1px solid black;

}
.memberno_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}

/* 이름 영역 */
.username_wrap{
	width: 100%;
	margin-top: 20px;
}
.username_name{
	font-size: 25px;
	font-weight: bold;
}
.username_input_box{
	border: 1px solid black;

}
.username_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}


/* 비밀번호 영역 */
.password_wrap{
	width: 100%;
    margin-top: 20px;
}
.password_name{
	font-size: 25px;
    font-weight: bold;
}
.password_input_box{
	border: 1px solid black;

	
}
.password_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}

/* 비밀번호 확인 영역 */
.passwordCk_wrap{
	width: 100%;
    margin-top: 20px;
}
.passwordCk_name{
	font-size: 25px;
    font-weight: bold;
}
.passwordCk_input_box{
	border: 1px solid black;

	
}
.passwordCk_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}
.passwordCk_input_re_1{
		color: green;
		display: none;
}
	
.passwordCk_input_re_2{
	color: red;
	display: none;
}


/* 메일 영역 */
.email_wrap{
	width: 100%;
    margin-top: 20px;
}
.email_name{
	font-size: 25px;
    font-weight: bold;
}
.email_input_box{
	border: 1px solid black;

	
}
.email_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}
.email_check_wrap{
	margin-top: 20px;	
}
.email_check_input_box{
	border: 1px solid black;

    width: 61%;
    float: left;
}
.email_check_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}
.email_check_button{
    border: 1px solid black;
    height: 25px;
    width: 30%;
    float: right;
    text-align: center;
    font-size: 15px;
    font-weight: 900;
    background-color: #ececf7;
    cursor: pointer;
}

/* 핸드폰번호 영역*/
.phone_wrap{
	width: 100%;
    margin-top: 20px;
}
.phone_name{
	font-size: 25px;
    font-weight: bold;
}
.phone_input_box{
	border: 1px solid black;

}
.phone_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}

/* 성별 영역 */
.gender_wrap{
	width: 100%;
    margin-top: 20px;
}
.gender_name{
	font-size: 25px;
    font-weight: bold;
}
.gender_input_box{
	border: 1px solid black;

}

.gender_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}

.mileage_wrap{
	width: 100%;
	margin-top: 20px;
}
.mileage_name{
	font-size: 25px;
    font-weight: bold;
}
.mileage_input_box{
	border: 1px solid black;

}
.mileage_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}


.coupon_wrap{
	width: 100%;
	margin-top: 20px;
}
.coupon_name{
	font-size: 25px;
    font-weight: bold;
}
.coupon_input_box{
	border: 1px solid black;

}
.coupon_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}

/* 사업자 등록번호 영역 */
.companynumber_wrap{
	width: 100%;
    margin-top: 20px;
    margin-bottom: 20px;
    
}
.companynumber_name{
	font-size: 25px;
    font-weight: bold;
    
}
.companynumber_input_box{
	border: 1px solid black;

		
}
.companynumber_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
	
}

.regdate_wrap{
	width: 100%;
    margin-top: 20px;
}
.regdate_name{
	font-size: 25px;
    font-weight: bold;
}
.regdate_input_box{
	border: 1px solid black;

}

.regdate_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}

.update_wrap{
	width: 100%;
    margin-top: 20px;
}
.update_name{
	font-size: 25px;
    font-weight: bold;
}
.update_input_box{
	border: 1px solid black;

}

.update_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}



/* 가입하기 버튼 */
.modify_button{
	width: 20%;
    height: 60px;
    background-color: #8a8de0;
    font-size: 25px;
    font-weight: 900;
    color: white;
    float: left;
}
.delete_button{
	width: 20%;
    height: 60px;
    background-color: #ff69b4;
    font-size: 25px;
    font-weight: 900;
    color: white;
    float: left;
}
/* 쿠폰확인 버튼 */
.coupon_button{
	width: 20%;
    height: 60px;
    background-color: #82ca98;
    font-size: 25px;
    font-weight: 900;
    color: white;
    float: left;
}
/* 마일리지확인 버튼 */
.mile_button{
	width: 20%;
    height: 60px;
    background-color: #82ca98;
    font-size: 20px;
    font-weight: 900;
    color: white;
    float: left;
}
/* 취소하기 버튼 */
.return_button{
	width: 20%;
    height: 60px;
    background-color: red;
    font-size: 25px;
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

<div class="wrap">
	<div class="col-lg-12">
		<h1 class="page-header">마이페이지</h1>
	</div>


<div class="userid_wrap">
<div class="userid_name">아이디</div>
<div class="userid_input_box">
<input type="text" class="userid_input" name="userid" value='<c:out value="${vo.userid }"></c:out>' readonly="readonly">
</div>
</div>

<div class="memberno_wrap">
<div class="memberno_name">사용자 설정</div>
<div class="memberno_input_box">
<input type="text" class="memberno_input" name="memberno" value='<c:out value="${vo.memberno }"></c:out>' readonly="readonly">
</div>
<span>1번은 일반인, 2번은 사업자 입니다.</span>
</div>

<div class="username_wrap">
<div class="username_name">이름</div>
<div class="username_input_box">
	<input type="text" class="username_input" name="username" value='<c:out value="${vo.username }"></c:out>' readonly="readonly">
</div>
</div>

<%-- <div class="password_wrap">
<div class="password_name">비밀번호</div>
<div class="password_input_box"><input type="hidde" class="password_input" name="password" value='<c:out value="${vo.password }"></c:out>' readonly="readonly">
</div>
</div> --%>



<div class="email_wrap">
<div class="email_name">이메일</div>
<div class="email_input_box">
<input type="text" class="email_input" name="email" value='<c:out value="${vo.email }"></c:out>' readonly="readonly">
</div>


</div>

<div class="phone_wrap">
<div class="phone_name">핸드폰번호</div>
<div class="phone_input_box"><input type="text" class="phone_input" name="phone" value='<c:out value="${vo.phone }"></c:out>' readonly="readonly"></div>
</div>

<div class="gender_wrap">
<div class="gender_name">성별</div>
<div class="gender_input_box">
<input type="text" class="gender_input" name="gender" value='<c:out value="${vo.gender }"></c:out>' readonly="readonly">

</div>

</div>

<div class="companynumber_wrap" >
<div class="companynumber_name">사업자 등록번호</div>
<div class="companynumber_input_box"><input type="text" class="companynumber_input" name="companynumber"  value='<c:out value="${vo.companynumber }"></c:out>' readonly="readonly"></div>
</div>

<div class="regdate_wrap" >
<div class="regdate_name">가입일자</div>
<div class="regdate_input_box"><input type="text" class="regdate_input" name="regdate"  value='<fmt:formatDate pattern= "yyyy/MM/dd" value="${vo.regdate }" />' readonly="readonly" ></div>
</div>

<div class="mileage_wrap" >
<div class="mileage_name">마일리지</div>
<div class="mileage_input_box"><input type="text" class="mileage_input" name="mileage"  value='<c:out value="${vo.mileage }"></c:out>' readonly="readonly" ></div>
</div>



<div>
	<button type="button" data-oper='modify' class="modify_button" >수정하기</button>
	<button type="button" data-oper='delete' class="delete_button" >탈퇴하기</button>
	<button type="button" data-oper='coupon' class="coupon_button">쿠폰 확인</button>
	<button type="button" data-oper='mile' class="mile_button">마일리지 확인</button>
	<button type="button" data-oper='return' class="return_button" >돌아가기</button>
</div>
<form id="operForm" action="/mypage/modifyinfo" method="post">
		<input type="hidden" id="userid" name="userid" value='<c:out value="${vo.userid }"></c:out>'>
		<input type="hidden" id="password" name="password" value='<c:out value="${vo.password }"></c:out>'>
		<input type="hidden" id="phone" name="phone" value='<c:out value="${vo.phone }"></c:out>'>
		<input type="hidden" id="updatedate"  name="updatedate" value='<fmt:formatDate pattern= "yy/MM/dd" value="${vo.updatedate }" />'>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>	<!-- csrf토큰 -->
</form>

</div>


</div>


<script type="text/javascript">
	
	$(document).ready(function() {
		
		var csrfHeaderName ="${_csrf.headerName}";
  	  	var csrfTokenValue="${_csrf.token}";
  	  	//Ajax spring security header	== ajax 를 이용한 csrf 토큰 전송
  	  	$(document).ajaxSend(function(e, xhr, options){
  	  		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
  	  	});
  	  	
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action","/mypage/modifyinfo").submit();
		});
		$("button[data-oper='delete']").on("click", function(e) {
			operForm.attr("action","/mypage/deleteinfo").submit();
		});
		
		$("button[data-oper='return']").on("click", function(e) {
			
			operForm.find("#userid").remove();
			operForm.attr("action","/main/mainpage");
			operForm.submit();
		});
		//쿠폰 내역 확인 페이지로 가는 동작
		$("button[data-oper='coupon']").on("click", function(e) {
			operForm.attr("action","/mypage/checkCoupon").submit();
		});
		//마일리지 확인 페이지로 가는 동작
		$("button[data-oper='mile']").on("click", function(e) {
			operForm.attr("action","/mypage/checkwrote").submit();
		});
		
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
</script>

    <%@ include file="../includes/footer.jsp" %>
</body>
</html>