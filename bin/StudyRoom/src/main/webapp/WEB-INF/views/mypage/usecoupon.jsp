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
                        <h3 class="panel-title">쿠폰사용 등록하기</h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" action="/mypage/usecoupon.do">
                        <input type="hidden" class="userid" name="userid" value='<sec:authentication property="principal.username" />'>
					<input type="hidden" class="csrf" name="${_csrf.parameterName }" value="${_csrf.token }"/>
                            <fieldset>
                                <div class="form-group">
                                	쿠폰번호 :<input class="form-control" id="coup" name="coup" type="number" placeholder="쿠폰번호를 입력하세요"  required>
                                </div>
                                <span style="text-align:center; font-size: 15px; color: red;" id="result">${result }</span>
                            	<button type="submit" class="btn btn-lg btn-success btn-block">쿠폰사용등록하기</button>
                       			<button type="submit" id="cancel" class="btn btn-lg btn-dark btn-block">메인으로 돌아가기</button>
                            </fieldset>
          
            
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
    	
		$("#cancel").on("click", function() {
			$("form").attr("action","/main/mainpage").submit();
			
			/* $("form").find(".userid").remove(); 
			$("form").find(".csrf").remove(); 
			$("form").find("#coup").remove(); 
			$("form").attr("method","get").attr("action","/main/mainpage").submit(); */
		})
        	
    	
    	
    </script>
</html>
<%@ include file="../includes/footer.jsp" %>