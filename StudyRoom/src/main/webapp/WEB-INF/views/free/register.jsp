<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">자유게시판</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">새 글 작성</div>
			<div class="panel-body">
				<form role="form" action="/free/register" method="post">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="title">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name="content"></textarea>
					</div>
						<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer' value='<sec:authentication property="principal.username"/>' readonly="readonly">
					</div>
					<button type="submit" class="btn btn-default">글 등록</button>
					<button type="reset" class="btn btn-default">리셋</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>