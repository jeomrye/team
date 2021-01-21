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
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
	<p style="color:red; font-weight:bold;"> login Failed : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }</p>
	<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
</c:if>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="post" action="/login">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="userid" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember-me" type="checkbox">자동 로그인
                                    </label>
                                    <span style="padding-left: 70px">
                                    	<a href="/member/findId_form">아이디찾기</a>
                                    	<a href="/member/findPw">비밀번호찾기</a>
                                    </span>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="#" onclick="history.go(-1);" class="btn btn-lg btn-success btn-block">로그인</a>
                                <!-- 회원가입페이지 이동 -->       
                                <a href="/member/joinForm" class="btn btn-lg btn-info btn-block">회원가입</a>
                            </fieldset>
                            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                        </form>
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
    	$(".btn-success").on("click",function(e){
    		e.preventDefault();
    		$("form").submit();
    	});
    </script>
</html>