<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
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
	height:15px;
	padding: 10px 14px;	
	
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
	height: 15px;
	padding: 10px 14px;
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
	height:15px;
	padding: 10px 14px;	
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
	height:15px;
	padding: 10px 14px;	
	
}
.password_input{
	width:100%;
	height:100%;
	border:none;
	font-size:15px;
}

/* 비밀번호 확인 영역 */
.pwck_wrap{
	width: 100%;
    margin-top: 20px;
}
.pwck_name{
	font-size: 25px;
    font-weight: bold;
}
.pwck_input_box{
	border: 1px solid black;
	height:15px;
	padding: 10px 14px;	
	
}
.pwck_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
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
	height:15px;
	padding: 10px 14px;	
	
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
    height: 15px;
    padding: 10px 14px;
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
    height: 35px;
    width: 30%;
    float: right;
    line-height: 35px;
    text-align: center;
    font-size: 20px;
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
	height:15px;
	padding: 10px 14px;	
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
	height:15px;
	padding: 10px 14px;	
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
	height:15px;
	padding: 10px 14px;	
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
    height: 80px;
    background-color: #6AAFE6;
    font-size: 40px;
    font-weight: 900;
    color: white;
    float: left;
}
/* 가입하기 버튼 */
.reset_button{
	width: 30%;
    height: 80px;
    background-color: green;
    font-size: 40px;
    font-weight: 900;
    color: white;
    float: none;
}
/* 가입하기 버튼 */
.return_button{
	width: 30%;
    height: 80px;
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
<input type="text" class="userid_input" name="userid">
</div>
	<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
	<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
	
</div>

<div class="memberno_wrap">
<div class="memberno_name">사용자 설정</div>
<div class="memberno_input_box">
일반사용자용<input type="radio" class="memberno_input" name="memberno" value="1" checked="checked">
사업자용<input type="radio" class="memberno_input" name="memberno" value="2"></div>
</div>

<div class="username_wrap">
<div class="username_name">이름</div>
<div class="username_input_box">
	<input type="text" class="username_input" name="username">
</div>
</div>

<div class="password_wrap">
<div class="password_name">패스워드</div>
<div class="password_input_box"><input type="text" class="password_input" name="password">
</div>
</div>

<div class="email_wrap">
<div class="email_name">이메일</div>
<div class="email_input_box">
<input type="text" class="email_input" name="email">
</div>
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
<div class="phone_input_box"><input type="text" class="phone_input" name="phone"></div>
</div>

<div class="gender_wrap">
<div class="gender_name">성별</div>
<div class="gender_input_box">
남<input type="radio" class="gender_input" name="gender" value="남">
여<input type="radio" class="gender_input" name="gender" value="여">
</div>
</div>

<div class="companynumber_wrap">
<div class="companynumber_name">사업자 등록번호</div>
<div class="companynumber_input_box"><input type="text" class="companynumber_input" name="companynumber"></div>
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

	$(document).ready(function() {
		//회원가입 버튼작동
		$(".insert_button").click(function() {
			$("#insert").attr("action","/member/insertMem");
			$("#insert").submit();
		});
		
		//권한부분에서 일반사용자면 사업자영역 비활성화/사업자면 활성화
		$("input:radio[name=memberno]").click(function(){
			 
	        if($("input[name=memberno]:checked").val() == "1"){
	        	 $('.companynumber_wrap').css('display','none');
		         $('.companynumber_name').css('display','none');
		         $('.companynumber_input_box').css('display','none');
		         $('.companynumber_input').css('display','none'); 
	          
	            // radio 버튼의 value 값이 1(일반사용자)이라면 사업자 등록번호 활성화
	 
	        }else if($("input[name=memberno]:checked").val() == "2"){
	        	 $('.companynumber_wrap').css('display','block');
		         $('.companynumber_name').css('display','block');
		         $('.companynumber_input_box').css('display','block');
		         $('.companynumber_input').css('display','block');
	        	//아랫것도 안되네...
	        	//$("input:text[name=companynumber]").attr("disabled",true);
	              	              
	            // radio 버튼의 value 값이 2(사업자용)이라면 사업자 등록번호 비활성화
	        }
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
				}else{
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display","none");
				}
			}
		});
	});
	
	//이메일로 인증번호 전송하기
	$(".email_check_button").click(function() {
		var email = $('.email_input').val(); //입력한 이메일 받아오기
		var checkBox = $('.email_check_input');
		var boxWrap = $('.email_check_input_box');
		
		
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
		}else{
			$('.email_input_re_2').css("display","inline-block");
			$('.email_input_re_1').css("display","none");
		}
	    //아래 코드안되서 아이디 중복검사 같이 만들어버림
	    /* if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");        
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	    } */   
	});
	
	
	
	
	
	
	
	
	

</script>

</body>
</html>