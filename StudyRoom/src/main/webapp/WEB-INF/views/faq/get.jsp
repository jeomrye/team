<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">FAQ</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">FAQ</div>
<!-- 			FAQ 상세보기 -->
<!-- 화면에 보이는 부분 -->
			<div class="form-group">
				<label>작성자</label><input class="form-control" name='writer' value='<c:out value="${faq.writer }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>제목</label><input class="form-control" name='title' value='<c:out value="${faq.title }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>내용</label><textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${faq.content }"/></textarea>
			</div>
			<button data-oper='modify' class="btn bnt-default" onclick="location.href='/faq/modify?faqNo=<c:out value="${faq.faqNo }"/>'">Modify</button>
			<button data-oper='list' class="btn bnt-default" onclick="location.href='/faq/list'">List</button>
			<form action="/faq/modify" id="operForm" method="get">
				<input type="hidden" id="faqNo" name="faqNo" value='<c:out value="${faq.faqNo }"/>'>
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
		operForm.attr("action","/faq/modify").submit();
	});
	$("button[data-oper = 'list']").on("click",function(e){
		operForm.find("faqNo").remove();
		operForm.attr("action","/faq/list")
		operForm.submit();
	});
	
});
</script>

<%@ include file="../includes/footer.jsp"%>