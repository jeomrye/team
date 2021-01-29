<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/mypage/myinfo" method="post" class="go">
	<input type="hidden" class="userid" name="userid" value="<sec:authentication property="principal.username" />">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
</form>

<script type="text/javascript">

var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
	//Ajax spring security header	== ajax 를 이용한 csrf 토큰 전송
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	
$(document).ready(function() {
	$(".go").attr("action", "/mypage/myinfo").attr("method", "post").submit();
})

</script>

</body>

</html>