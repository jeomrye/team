<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

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
                        <h3 class="panel-title">마이페이지</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" >
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="userid" id="userid" name="username" type="text" autofocus>
                                </div>  							
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="#"  class="btn btn-lg btn-success btn-block">아이디 확인</a>
                                <!-- 회원가입페이지 이동 -->       
                              
                            </fieldset>
                          <input type="hidden" class="userid" name="userid" value="<sec:authentication property="principal.username" />">
						  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
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
    	
    <sec:authorize access="isAuthenticated()">
  	id ='<sec:authentication property="principal.username"/>';
  	</sec:authorize>
  	
   		var csrfHeaderName ="${_csrf.headerName}";
	  	var csrfTokenValue="${_csrf.token}";
	  	//Ajax spring security header	== ajax 를 이용한 csrf 토큰 전송
	  	$(document).ajaxSend(function(e, xhr, options){
	  		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	  	});
	  	
    	$(".btn-success").on("click",function(e){
    		e.preventDefault();
    		var userid =  document.getElementById('userid').value;
    		if(id == userid){
    			$("form").attr("method","post").attr("action","/mypage/myinfo").submit();
    		} else{
    			alert("아이디가 다릅니다.");
    		}
        	
    	});
    	
    	$('input[type="text"]').keydown(function() {
    		  if (event.keyCode === 13) {
    		    event.preventDefault();
    		  };
    		});
    	
    	
    	
    	
    	
    </script>
</html>