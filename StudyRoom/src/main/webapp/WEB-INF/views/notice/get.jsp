<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">공지사항</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">공지사항</div>
<!-- 			공지사항 상세보기 -->
<!-- 화면에 보이는 부분 -->
			<div class="form-group">
				<label>작성자</label><input class="form-control" name='writer' value='<c:out value="${notice.writer }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>제목</label><input class="form-control" name='title' value='<c:out value="${notice.title }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>내용</label><textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${notice.content }"/></textarea>
			</div>
<!-- 			시큐리티를 이용해서 관리자만 수정 볼수있음 -->
			<sec:authentication property="principal" var="pinfo"/>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button data-oper='modify' class="btn btn-danger" onclick="location.href='/notice/modify?notNo=<c:out value="${notice.notNo }"/>'">수정(관리자만)</button>
			</sec:authorize>
<!-- 			시큐리티를 이용해서 관리자만 수정 볼수있음 -->
			<button data-oper='list' class="btn btn-info" onclick="location.href='/notice/list'">공지사항 목록</button>
			<form action="/board/modify" id="operForm" method="get">
				<input type="hidden" id="notNo" name="notNo" value='<c:out value="${notice.notNo }"/>'>
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper = 'modify']").on("click",function(e){
		operForm.attr("action","/notice/modify").submit();
	});
	$("button[data-oper = 'list']").on("click",function(e){
		operForm.find("notNo").remove();
		operForm.attr("action","/notice/list")
		operForm.submit();
	});
	
});
</script>

<%@ include file="../includes/footer.jsp"%>