<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

/* 가입하기 버튼 */
.insert_button{
	width: 30%;
    height: 60px;
    background-color:  #8a8de0;
    font-size: 40px;
    font-weight: 900;
    color: white;
    float: left;
}
/* 리셋하기 버튼 */
.reset_button{
	width: 30%;
    height: 60px;
    background-color:  #de9693;
    font-size: 40px;
    font-weight: 900;
    color: white;
    float: none;
}
/* 취소하기 버튼 */
.return_button{
	width: 30%;
    height: 60px;
    background-color:  #82ca98;
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
<form id="insert" method="post">
<div class="wrap">
	<div class="col-lg-12">
		<h1 class="page-header">회원가입 페이지</h1>
	</div>


<div class="userid_wrap">
<div class="userid_name">아이디</div>
<div class="userid_input_box">
<input type="text" class="userid_input" name="userid" placeholder="4~12자의 영문 대소문자와 숫자로만 입력">
</div>
	<span class="id_input_re_1">중복된 아이디가 없습니다 사용가능합니다</span>
	<span class="id_input_re_2">중복된 아이디가 이미 존재합니다.</span>
	
</div>



<input type="hidden" class="memberno_input" name="memberno" value="2">



<div class="username_wrap">
<div class="username_name">이름</div>
<div class="username_input_box">
	<input type="text" class="username_input" name="username" placeholder="한글만 입력하세요">
</div>
</div>

<div class="password_wrap">
<div class="password_name">비밀번호</div>
<div class="password_input_box"><input type="password" class="password_input" name="password">
</div>
<span class="pw_ck">비밀번호를 입력해주세요</span>
</div>
<div class="passwordCk_wrap">
<div class="passwordCk_name">비밀번호 확인</div>
<div class="passwordCk_input_box">
<input class="passwordCk_input" type="password">
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
<div class="phone_input_box"><input type="text" class="phone_input" name="phone" placeholder="'-'없이 입력해주세요"></div>
</div>

<div class="gender_wrap">
<div class="gender_name">성별</div>
<div class="gender_input_box">
남<input type="radio" class="gender_input" name="gender" value="남" checked="checked">
여<input type="radio" class="gender_input" name="gender" value="여">
</div>
<span class="gender_ck">성별을 선택해주세요</span>
</div>

<div class="companynumber_wrap" >
<div class="companynumber_name">사업자 등록번호</div>
<div class="companynumber_input_box"><input type="text" class="companynumber_input" name="companynumber" placeholder="사업자만 입력하세요" value=""></div>
<span class="companynumber_ck">사업자 등록번호를 입력해주세요</span>
<span class="companynumber_input_re_1">사업자 등록번호가 일치합니다.</span>
	<span class="companynumber_input_re_2">없는 사업자 등록번호입니다</span>
	
</div>

<div>
	<input type="button" class="insert_button" value="가입하기">

	<input type="reset" class="reset_button" value="리셋하기">

	<input type="button" class="return_button" value="취소하기">
</div>


</div>

</form>

</div>

<script type="text/javascript">
	//이메일 전송 인증번호 저장 위한 코드
	var code = "";
	
	//유효성 검사 통과유무 변수
	var useridCheck = false;            // 아이디
	var useridCkCheck = false;            // 아이디 중복 검사
	var membernoCheck = true;			//사용자 설정
	var usernameCheck = false;            // 이름
	var passwordCheck = false;            // 비밀번호
	var passwordCkCheck = false;            // 비밀번호 확인
	var passwordDCkCheck = false;        // 비밀번호번 확인 일치 확인
	
	var emailCheck = false;            // 이메일
	var emailnumCheck = false;        // 이메일 인증번호 확인
	var phoneCheck = false;			//핸드폰번호
	var genderCheck = true;		//성별
	var companynumberCheck = false;         // 사업자 등록번호
	
	
	
	

	$(document).ready(function() {
		//회원가입 버튼작동
		$(".insert_button").click(function() {
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
			var getName= RegExp(/^[가-힣]{1,5}$/);
			var getPhone = /^(01[0|1|6|7|8|9]?)(\d{4}|\d{3})\d{4}$/g;
			
			
			
			// 아이디 공백검사 
	        if(id == ""){
	            alert("아이디를 입력해주세요");
	            useridCheck = false;
	        }else{
	            useridCheck = true;
	            if(!getCheck.test(id)){
					alert("아이디 형식에 맞게 입력해주세요 4~12자의 영문 대소문자와 숫자로만 입력");
					useridCheck = false;
				}
	        }
			//아이디 유효성검사
			
			
			//사용자 번호 유효성 검사
			if(memberno == "" && memberno == 0){
				alert("사용자를 선택해주세요");
				membernoCheck = false;
			}else{
	            membernoCheck = true;
			}
			
			
			
	        // 이름 유효성 검사 
	        if(name == ""){
	        	alert("이름을 입력해주세요");
	            usernameCheck = false;
	        }else{
	            usernameCheck = true;
	            if(!getName.test(name)){
	            alert("이름형식에 맞게 입력해주세요");
	            return false; 
	            }

	        } 
			
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
	        	       
	        
	        
	        //사업자 등록번호 유효성검사
	        if(companynumber == ""){
	   		 $('.companynumber_ck').css('display','block');
	   		 alert("사업자 등록번호를 입력해주세요");
	   		companynumberCheck = false;
	   		
	   		}else if(companynumber != ""){
	   		$('.companynumber_ck').css('display', 'none');
	   		
	   		}
	        console.log(memberno);
	        console.log(useridCheck);
	        console.log(useridCkCheck);
	        console.log(membernoCheck);
	        console.log(usernameCheck);
	        console.log(passwordCheck);
	        console.log(passwordCkCheck);
	        console.log(passwordDCkCheck);
	        console.log(emailCheck);
	        console.log(emailnumCheck);
	        console.log(phoneCheck);
	        console.log(genderCheck);
	        console.log(companynumberCheck);
	        console.log(companynumber);
	        
	        
	        //최종가입 확인
	        if(useridCheck&&useridCkCheck&&membernoCheck&&usernameCheck&&passwordCheck&&passwordCkCheck&&passwordDCkCheck&&emailCheck&&emailnumCheck&&phoneCheck&&genderCheck&&companynumberCheck ){
	        	
	        		
	        	alert("회원가입이 완료되었습니다");
	        	$("#insert").attr("action","/member/joinForm2");
				$("#insert").submit();
	        }
	        
	        
			return false;
					
		});
			        
		$(".return_button").click(function() {
			$("#insert").attr("action","/main/mainpage");
			$("#insert").submit();
		});
	    });
				
		
		
	
	//아이디 중복검사
	$(".userid_input").on("propertychange change keyup paste input", function() {
		var userid = $('.userid_input').val();
		var data = {userid : userid}
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result) {
				//console.log("성공여부" +result);
				if(result != "fail"){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display","none");
					useridCkCheck = true;
				}else{
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display","none");
					useridCkCheck = false;
				}
			}
		});
	});
	
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
	    //아래 코드안되서 아이디 중복검사같이 만들어버림
	    /* if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");        
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	    } */   
	});
	
	//입력 이메일 유효성검사
	function mailFormCheck(email){
	    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    return form.test(email);
	}
	
	
	
	//사업자 등록번호 확인
	$(document).ready(function(){
		if($("input[name=memberno]").val() == "2"){
        	$('.companynumber_input').attr('disabled', false);
        	$(".companynumber_input").on("propertychange change keyup paste input", function() {
    			var companynumber = $('.companynumber_input').val();
    			var data = {companynumber : companynumber}
    			
    			$.ajax({
    				type : "post",
    				url : "/member/companynumCheck",
    				data : data,
    				success : function(result) {
    					//console.log("성공여부" +result);
    					if(result != "fail"){
    						$('.companynumber_input_re_1').css("display","inline-block");
    						$('.companynumber_input_re_2').css("display","none");
    						companynumberCheck = true;
    					}else{
    						$('.companynumber_input_re_2').css("display","inline-block");
    						$('.companynumber_input_re_1').css("display","none");
    						companynumberCheck = false;
    						
    						
    					}
    				}
    			});
    		});
	      	              
           
        }
        
        	        
    });
		
	
	
	
	
	
	 
	
	
	

</script>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>