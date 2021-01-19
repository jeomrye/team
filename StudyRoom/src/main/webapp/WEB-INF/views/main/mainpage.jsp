<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="container" align="center">
<div class="row justify-content-center">

<a href="/main/mainpage" style="color: black; text-decoration: none;">
<h1>SRFS</h1>
</a>

	<form id="searchForm" action="/notice/list" method="get">
		<select name="type">
			<option value=""
				<c:out value="${pageMaker.cri.type == null ? 'selected' :'' }" />>----------</option>
			<option value="T"
				<c:out value="${pageMaker.cri.type eq 'T'? 'selected' :'' }" />>지역</option>
			<option value="C"
				<c:out value="${pageMaker.cri.type eq 'C'? 'selected' :'' }" />>독서실이름</option>
			<option value="TC"
				<c:out value="${pageMaker.cri.type eq 'TC'? 'selected' :'' }" />>지역 or 독서실이름</option>
		</select> 
		<input type="text" name="keyword" onfocus="this.value=''" value='지역/독서실이름 입력하세요<c:out value="${pageMaker.cri.keyword }"/>'style="width:300px;"> 
		<button class="btn btn-default">Search</button>
	</form>
	</div>
</div>
<script>

	$(document).ready(
		function() {
			var searchForm = $("#searchForm");
			$("#searchForm button").on("click",function(e) {
				if (!searchForm.find("option:selected").val()) {
					alert("검색종류를 선택하세요");
						return false;
						}
					if (!searchForm.find(
						"input[name='keyword']" ,"input[name='장소/독서실이름 입력']" ).val()) {
						alert("키워드를 입력하세요");
						return false;
					}
					searchForm.find("input[name='pageNum']")
					.val("1");
					e.preventDefault();
					searchForm.submit();
				});
			});
</script>
<%@ include file="../includes/footer.jsp"%>