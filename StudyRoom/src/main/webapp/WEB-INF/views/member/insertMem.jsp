<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<form id="insert" method="post">
<div class="wrap">
	<div class="col-lg-12">
		<h1 class="page-header">회원가입 페이지</h1>
	</div>
</div>
<div>
	<label>아이디</label><input type="text" class="userid_input" name="userid"><br>
	<label>일반사용자용</label><input type="radio" class="memberno_input" name="memberno" value="1">
	<label>사업자용</label><input type="radio" class="memberno_input" name="memberno" value="2"><br>
	<label>이름</label><input type="text" class="username_input" name="username"><br>
	<label>패스워드</label><input type="text" class="password_input" name="password"><br>
	<label>이메일</label><input type="text" class="email_input" name="email"><br>
	<label>핸드폰번호</label><input type="text" class="phone_input" name="phone"><br>
	<label>남</label><input type="radio" class="gender_input" name="gender" value="남">
	<label>여</label><input type="radio" class="gender_input" name="gender" value="여"><br>
	<label>사업자등록번호</label><input type="number" class="companynumber_input" name="companynumber">
</div>
<div>
	<input type="button" class="insert_button" value="가입하기">
</div>


</form>

<script type="text/javascript">
	$(document).ready(function() {
		//회원가입 버튼작동
		$(".insert_button").click(function() {
			$("#insert").attr("action","/member/insertMem");
			$("#insert").submit();
		});
	});

</script>

</body>
</html>