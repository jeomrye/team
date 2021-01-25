<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Q&A</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Q&A 수정</div>
			<form role="form" action="/qna/modify" method="post"> <!-- 이동할 jsp 경로 -->
				<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
				<input type="hidden" name='amount' value='<c:out value="${cri.amount }"/>'>
				<input type="hidden" name='type' value='<c:out value="${cri.type }"/>'>
				<input type="hidden" name='keyword' value='<c:out value="${cri.keyword }"/>'>
			<div class="form-group">
				<label>작성자</label><input class="form-control" name='writer' value='<c:out value="${qna.writer }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>글번호</label><input class="form-control" name='questionNo' value='<c:out value="${qna.questionNo }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>제목</label><input class="form-control" name='title' value='<c:out value="${qna.title }"/>'>
			</div>
			<div class="form-group">
				<label>내용</label><textarea class="form-control" rows="3" name='content' ><c:out value="${qna.content }"/></textarea>
			</div>
			
			<div class="form-group">
				<label>RegDate</label><input class="form-control" name='writedate' value='<fmt:formatDate value="${qna.writedate }" pattern="yyyy-MM-dd" />' readonly="readonly">
			</div>
			<div class="form-group">
				<label>UpDate Date</label><input class="form-control" name='updateDate' value='<fmt:formatDate value="${qna.updatedate }" pattern="yyyy-MM-dd" />' readonly="readonly">
			</div>
			<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
			 <button type="submit" data-oper='remove' class="btn btn-danger">지우기</button>
			<button type="submit" data-oper='list' class="btn btn-info">Q&A목록</button>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
   
   var formObj = $("form");
   
   $('button').on("click", function(e){
      e.preventDefault();
      var operation = $(this).data("oper");
      console.log(operation);
      
      if(operation === 'remove'){
         formObj.attr("action","/qna/qRemove");
      }else if(operation === 'list'){
         formObj.attr("action","/qna/list").attr("method","get");
         var pageNumTag = $("input[name='pageNum']").clone();
         var amountTag = $("input[name='amount']").clone();
         var keywordTag = $("input[name='keyword']").clone();
         var typeTag = $("input[name='type']").clone();
         
         formObj.empty();
         formObj.append(pageNumTag);
         formObj.append(amountTag);
         formObj.append(keywordTag);
         formObj.append(typeTag);
      }
      formObj.submit();
   });
   
});         
</script>

<%@ include file="../includes/footer.jsp"%>