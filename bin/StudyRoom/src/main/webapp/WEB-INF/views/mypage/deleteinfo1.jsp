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

    <title>메인페이지로 이동</title>

</head>
<body>
<form id="delete" action="/mypage/deleteinfo1" method="post">
		<input type="hidden" id="userid" name="userid" value='<c:out value="${vo.userid }"></c:out>'>
		<input type="hidden" id="password" name="password" value='<c:out value="${vo.password }"></c:out>'>
		<input type="hidden" id="phone" name="phone" value='<c:out value="${vo.phone }"></c:out>'>
		<input type="hidden" id="updatedate"  name="updatedate" value='<fmt:formatDate pattern= "yy/MM/dd" value="${vo.updatedate }" />'>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>	<!-- csrf토큰 -->
</form>




<script type="text/javascript">
	$(document).ready(function() {
		location.href ="/customLogout"
	})

</script>




    
</body>
</html>
<%@ include file="../includes/footer.jsp" %>