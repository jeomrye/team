<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
admin
<p><sec:authentication property="principal"/></p>
<p><sec:authentication property="principal.member"/></p>
<p><sec:authentication property="principal.member.username"/></p>
<p><sec:authentication property="principal.userid"/></p>
<p><sec:authentication property="principal.member.authList"/></p>
</body>
</html>