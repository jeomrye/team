<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">비밀번호 찾기</h3>
                    </div>
                    <div class="panel-body">

                                <div class="form-group">
                                    	아이디 :<input class="form-control" id="userid" name="userid" type="text" placeholder="아이디를 입력하세요" required>
                                </div>
                                <div class="form-group">
                                    	메일 :<input class="form-control" id="email" name="email" type="text" placeholder="이메일주소를 입력하세요" required>
                                </div>
                            	<button type="button" id="findBtn" class="btn btn-lg btn-success btn-block">비밀번호 찾기</button>
                       			<button type="button" onclick="history.go(-1)" class="btn btn-lg btn-dark btn-block">취소</button>
                
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
    <script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/member/findPw",
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})

		});
	})
</script>

</html>