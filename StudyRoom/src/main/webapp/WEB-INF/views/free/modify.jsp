<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ include file="../includes/header.jsp" %>
<div class ="panel-heading">Board Modify Page</div>
<div class="panel-body">
<form role="form" action="/board/modify" method="post">
<!-- 추가 페이지 319 -->
	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
	<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
	<div class="form-group">
		<label>Bno</label>
		<input class="form-control" name="bno" value='<c:out value="${board.bno }"/>' readonly="readonly">
	</div>
	<div class="form-group">
		<label>Title</label>
		<input class="form-control" name="title" value='<c:out value="${board.title }"/>'>
	</div>
	<div class="form-group">
		<label>Text area</label>
		<textarea class="form-control" rows="3" name="content"><c:out value="${board.content }"></c:out></textarea>
	</div>
	<div class="form-group">
		<label>Writer</label>
		<input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly="readonly">
	</div>
	<div class="form-group">
		<label>RegDate</label>
		<input class="form-control" name="regDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate }"/>' readonly="readonly">
	</div>
	<div class="form-group">
		<label>Update Date</label>
		<input class="form-control" name="updateDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate }"/>' readonly="readonly">
	</div>
	<button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
	<button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
	<button type="submit" data-oper="list" class="btn btn-info">List</button>
</form>
</div>
<%@ include file="../includes/footer.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form");
		$('button').on("click",function(e){
			e.preventDefault();		// 기본 동작 막기
			var operation = $(this).data("oper");
			console.log(operation);
			if(operation === 'remove'){		//javascript에서  '==='의미는  타입도 같아야하고 값도 같아야한다.
				formObj.attr("action","/board/remove");
			} else if(operation === 'list'){
				//move to list
				formObj.attr("action","/board/list").attr("method","get");
				var pageNumTag=$("input[name='pageNum']").clone();	//from 태그에서 필요한 부분만 잠시 복사 보관ㄴ
				var amountTag=$("input[name='amount']").clone();
				var keywordTag=$("input[name='keyword']").clone();
				var typeTag=$("input[name='type']").clone();
				formObj.empty();	//form태그내에 모든걸 지운다
				formObj.append(pageNumTag);		//필요한 태그만 추가해서 호출
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			formObj.submit();	//직접  submit() 수행
		});
	});
</script>




