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



/* 가입하기 버튼 */
.update_button{
	width: 30%;
    height: 60px;
    background-color: #6AAFE6;
    font-size: 40px;
    font-weight: 900;
    color: white;
    float: left;
}
/* 리셋하기 버튼 */
.remove_button{
	width: 30%;
    height: 60px;
    background-color: green;
    font-size: 40px;
    font-weight: 900;
    color: white;
    float: none;
}
/* 취소하기 버튼 */
.return_button{
	width: 30%;
    height: 60px;
    background-color: red;
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
<form method="post" role="form" id="update" >
<div class="wrap">
	<div class="col-lg-12">
		<h1 class="page-header">회원정보 수정페이지</h1>
	</div>

<input type="hidden" id="uno" name="uno" value='<c:out value="${vo.uno }"></c:out>'>



<div class="userid_wrap">
<div class="userid_name">아이디</div>
<div class="userid_input_box">
<input type="text" class="userid_input" name="userid" value='<c:out value="${vo.userid }"></c:out>' readonly="readonly" >
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

<div class="password_wrap">
<div class="password_name">비밀번호</div>
<div class="password_input_box"><input type="text" class="password_input" name="password" value='<c:out value="${vo.password }"></c:out>' >
</div>
</div>
<div class="passwordCk_wrap">
<div class="passwordCk_name">비밀번호 확인</div>
<div class="passwordCk_input_box">
<input class="passwordCk_input">
</div>
	<span class="pwCk_ck">비밀번호 확인을 입력해주세요</span>
	<span class="passwordCk_input_re_1">비밀번호가 일치합니다.</span>
	<span class="passwordCk_input_re_2">비밀번호가 일치하지 않습니다.</span>
</div>



<div class="email_wrap">
<div class="email_name">이메일</div>
<div class="email_input_box">
<input type="text" class="email_input" name="email">
</div>
<span class="email_ck">이메일 주소를 입력해주세요</span>
<span class="mail_input_box_warn"></span>
<div class="email_check_wrap">
<div class="email_check_input_box" id="email_check_input_box_false">
	<input class="email_check_input" disabled="disabled">
</div>
<div class="email_check_button">
	<span>인증번호 전송</span>
</div>
<div class="clearfix"></div>
<span class="email_input_re_1">인증번호가 일치합니다</span>
<span class="email_input_re_2">인증번호가 다릅니다.</span>
</div>

</div>

<div class="phone_wrap">
<div class="phone_name">핸드폰번호</div>
<div class="phone_input_box"><input type="text" class="phone_input" name="phone" value='<c:out value="${vo.phone }"></c:out>' ></div>
</div>

<div class="gender_wrap">
<div class="gender_name">성별</div>
<div class="gender_input_box">
<input type="text" class="gender_input" name="gender" value='<c:out value="${vo.gender }"></c:out>' readonly="readonly">
</div>
</div>

<div class="mileage_wrap">
<div class="mileage_name">마일리지 정보</div>
<div class="mileage_input_box"><input type="text" class="mileage_input" name="mileage" value='<c:out value="${vo.mileage }"></c:out>' ></div>
</div>

<div class="coupon_wrap">
<div class="coupon_name">쿠폰 정보</div>
<div class="coupon_input_box"><input type="text" class="coupon_input" name="coupon" value='<c:out value="${vo.coupon }"></c:out>' ></div>
</div>


<div class="companynumber_wrap" >
<div class="companynumber_name">사업자 등록번호</div>
<div class="companynumber_input_box"><input type="text" class="companynumber_input" name="companynumber"  value='<c:out value="${vo.companynumber }"></c:out>' readonly="readonly"></div>
</div>

<div class="regdate_wrap" >
<div class="regdate_name">가입일자</div>
<div class="regdate_input_box"><input type="text" class="regdate_input" name="regdate"  value='<fmt:formatDate pattern= "yy/MM/dd" value="${vo.regdate }" />' readonly="readonly"></div>
</div>

<div class="update_wrap" >
<div class="update_name">최근수정일자</div>
<div class="update_input_box"><input type="text" value='<fmt:formatDate pattern = "yy/MM/dd" value="${vo.updatedate }" />' class="update_input" name="updatedate" readonly="readonly"></div>
</div>


	<button type="submit" class="update_button" data-oper='modify'>수정완료</button>
	<button type="submit" class="remove_button" data-oper='remove'>탈퇴하기</button>
	<button type="submit" class="return_button" data-oper='cancel'>취소하기</button>



</div>
</form>
</div>

<script type="text/javascript">

var phoneCheck = false;			//핸드폰번호
var passwordCheck = false;            // 비밀번호
var passwordCkCheck = false;            // 비밀번호 확인
var passwordDCkCheck = false;        // 비밀번호번 확인 일치 확인
var emailCheck = false;            // 이메일
var emailnumCheck = false;        // 이메일 인증번호 확인


	$(document).ready(function() {
		var code = "";
		var formObj = $("#update");
		var userid = $(".userid_input").val();
		$("button[data-oper='cancel']").on("click", function(e) {
			history.go(-1)
		});

		var formObj = $("#update");
		$("button[data-oper='remove']").on("click", function(e) {
			formObj.attr("action","/mypage/deleteinfo");
			var id = $('.userid_input').val();
			var memberno = $('.memberno_input').val();
			var name = $('.username_input').val();
			var pw = $('.password_input').val();
			var pwCk = $('.passwordCk_input').val();
			var email = $('.email_input').val();
			var phone = $('.phone_input').val();
			var gender = $('.gender_input').val();
			var companynumber = $('.companynumber_input').val();
			
			
			var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/); 
			var getPhone = /^(01[0|1|6|7|8|9]?)(\d{4}|\d{3})\d{4}$/g;
		

			 // 비밀번호 유효성 검사
			if(pw == ""){
				alert("비밀번호를 입력해주세요");
	           passwordCheck = false;
	       }else{
	           passwordCheck = true;
	       }
	      // 비밀번호 확인 입력란 유효성 검사
			if(pwCk == ""){
				alert("비밀번호 확인란을 입력해주세요");
	           passwordCkCheck = false;
	       }else{
	           passwordCkCheck = true;
	       }
	      
			//이메일 유효성 검사
	        if(email == ""){
	        	alert("이메일주소를 입력해주세요");
	            emailCheck = false;
	        }else{
	            emailCheck = true;
	        }
			
			//핸드폰번호 유효성 검사
	       if(phone == ""){
	       	alert("핸드폰번호를 입력해주세요");
	           phoneCheck = false;
	       }else{
	           phoneCheck = true;
	           if(!getPhone.test(phone)){
	        		alert("핸드폰번호 양식에 맞춰서 입력해주세요");  
	        		phoneCheck = false;
	           }
	        
	       }
			
	       if(passwordCheck&&passwordCkCheck&&passwordDCkCheck&&emailCheck&&emailnumCheck&&phoneCheck ){
	    	   formObj.attr("action","/mypage/deleteinfo");
			
	    	  formObj.submit();
					       }    
	       
	       
			return false;
			
			
		});
		
		var formObj = $("#update");
		$("button[data-oper='modify']").on("click", function(e) {
			formObj.attr("action","/mypage/modifyinfo");
			var id = $('.userid_input').val();
			var memberno = $('.memberno_input').val();
			var name = $('.username_input').val();
			var pw = $('.password_input').val();
			var pwCk = $('.passwordCk_input').val();
			var email = $('.email_input').val();
			var phone = $('.phone_input').val();
			var gender = $('.gender_input').val();
			var companynumber = $('.companynumber_input').val();
			
			
			var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/); 
			var getPhone = /^(01[0|1|6|7|8|9]?)(\d{4}|\d{3})\d{4}$/g;
		

			 // 비밀번호 유효성 검사
			if(pw == ""){
				alert("비밀번호를 입력해주세요");
	           passwordCheck = false;
	       }else{
	           passwordCheck = true;
	       }
	      // 비밀번호 확인 입력란 유효성 검사
			if(pwCk == ""){
				alert("비밀번호 확인란을 입력해주세요");
	           passwordCkCheck = false;
	       }else{
	           passwordCkCheck = true;
	       }
			//이메일 유효성 검사
	        if(email == ""){
	        	alert("이메일주소를 입력해주세요");
	            emailCheck = false;
	        }else{
	            emailCheck = true;
	        }
			//핸드폰번호 유효성 검사
	       if(phone == ""){
	       	alert("핸드폰번호를 입력해주세요");
	           phoneCheck = false;
	       }else{
	           phoneCheck = true;
	           if(!getPhone.test(phone)){
	        		alert("핸드폰번호 양식에 맞춰서 입력해주세요");  
	        		phoneCheck = false;
	           }
	        
	       }
			
	       if(passwordCheck&&passwordCkCheck&&passwordDCkCheck&&emailCheck&&emailnumCheck&&phoneCheck ){
	    	   	formObj.attr("action","/mypage/modifyinfo");
		    	  formObj.submit();
						       }   
	       
	       
			return false;
			
		});
		
		
			
			
			
		
		});
			
			
		
		
		
	
	//이메일로 인증번호 전송하기
	$(".email_check_button").click(function() {
		var email = $('.email_input').val(); //입력한 이메일 받아오기
		var checkBox = $('.email_check_input');
		var boxWrap = $('.email_check_input_box');
		var warnMsg = $(".mail_input_box_warn");
		
		
		
		
		if(mailFormCheck(email)){
	        warnMsg.html("올바른 메일주소 형식입니다.");
	        warnMsg.css("display", "inline-block");
	    } else {
	        warnMsg.html("올바르지 못한 이메일 형식입니다.");
	        warnMsg.css("display", "inline-block");
	        return false;
	    }    
		
		if (email == "") {
			alert("메일 주소가 입력되지 않았습니다.");
		}else{
		$.ajax({
			type : "GET",
			url : "emailCheck?email="+email, //파라미터를 이용해서 email값 넘기기
			success:function(data){
				//console.log("data값"+data);
				checkBox.attr("disabled",false);
				boxWrap.attr("id", "mail_check_input_box_true");
				code = data;
			}
		});
				alert("메일이 전송되었습니다. 인증번호를 확인후 입력해주세요");
		}
	});
	//이메일 인증번호 비교 확인
	$(".email_check_input").blur(function(){
	    
	    var inputCode = $(".email_check_input").val();        // 입력코드    
	    var checkResult = $(".email_check_input_box_span");    // 비교 결과     
	        
	    
	    if(inputCode == code){
			$('.email_input_re_1').css("display","inline-block");
			$('.email_input_re_2').css("display","none");
			emailnumCheck = true;
		}else{
			$('.email_input_re_2').css("display","inline-block");
			$('.email_input_re_1').css("display","none");
			emailnumCheck = false;
		}
	    
	});
	
	//입력 이메일 유효성검사
	function mailFormCheck(email){
	    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    return form.test(email);
	}
	
	
	
	//비밀번호 확인
	$('.passwordCk_input').on("propertychange change keyup paste input", function(){
			var pw1 = $('.password_input').val();
	        var pw2 = $('.passwordCk_input').val();
	        $('.pwCk_ck').css('display','none');
	        
	        
	        if(pw1 == pw2){
	        	$('.passwordCk_input_re_1').css("display","block");
	        	$('.passwordCk_input_re_2').css("display","none");
	        	passwordDCkCheck = true;
	        }else{
	        	$('.passwordCk_input_re_2').css("display","block");
				$('.passwordCk_input_re_1').css("display","none");
				passwordDCkCheck =false;
	        }
	});
	
	
	
	
</script>






    
</body>
</html>
<%@ include file="../includes/footer.jsp" %>