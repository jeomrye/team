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
		margin: auto;
		float: left;
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