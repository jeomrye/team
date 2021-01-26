<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Q&A</h1>
	</div>
	<div class="row">
		<div  class="col-lg-12">
			<div class="panel-heading">Q&A 작성</div>
			<div class="panel-body">
				<form action="/qna/register" role="form" method="post">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					<div class="form-group">
						<label>제목</label><input class="form-control" name="title">
					</div>
					<div class="form-group">
						<label>작성자</label><input class="form-control" name="writer"  value='<sec:authentication property="principal.username"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>내용</label><textarea class="form-control" rows="3" name="content"></textarea>
					</div>
					<button type="submit" class="btn btn-default">등록</button>
					<button type="reset" class="btn btn-default">다시쓰기</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>