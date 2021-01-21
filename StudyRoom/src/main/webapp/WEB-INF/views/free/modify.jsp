<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ include file="../includes/header.jsp" %>
<div class ="panel-heading">글 수정</div>
<div class="panel-body">
<form role="form" action="/free/modify" method="post">
	
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>	<!-- csrf토큰 -->
	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
	<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
	<div class="form-group">
		<label>번호</label>
		<input class="form-control" name="fno" value='<c:out value="${free.fno }"/>' readonly="readonly">
	</div>
	<div class="form-group">
		<label>제목</label>
		<input class="form-control" name="title" value='<c:out value="${free.title }"/>'>
	</div>
	<div class="form-group">
		<label>내용</label>
		<textarea class="form-control" rows="3" name="content"><c:out value="${free.content }"></c:out></textarea>
	</div>
	<div class="form-group">
		<label>작성자</label>
		<input class="form-control" name="writer" value='<c:out value="${free.writer }"/>' readonly="readonly">
	</div>
	<div class="form-group">
		<label>작성일</label>
		<input class="form-control" name="regDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${free.regdate }"/>' readonly="readonly">
	</div>
	<div class="form-group">
		<label>수정일</label>
		<input class="form-control" name="updateDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${free.updateDate }"/>' readonly="readonly">
	</div>
	<!-- 게시물의 작성자인 경우만 수정 삭제 -->
	<sec:authentication property="principal" var="pinfo"/> 	<!-- 조회 화면에서 댓글 추가버튼 -->
	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER','ROLE_USER')">
	<c:if test="${pinfo.username eq free.writer or pinfo.authorities eq '[ROLE_ADMIN]' }"> 
	<button type="submit" data-oper="modify" class="btn btn-default">수정하기</button>
	<button type="submit" data-oper="remove" class="btn btn-danger">삭제하기</button>
	</c:if>
	</sec:authorize>
	<button type="submit" data-oper="list" class="btn btn-info">목록</button>
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
				formObj.attr("action","/free/remove");
			} else if(operation === 'list'){
				//move to list
				formObj.attr("action","/free/list").attr("method","get");
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




