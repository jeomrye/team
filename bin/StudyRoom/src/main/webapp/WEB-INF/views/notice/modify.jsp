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
			<div class="panel-heading">공지사항 수정</div>
			<form role="form" action="/notice/modify" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
				<input type="hidden" name='amount' value='<c:out value="${cri.amount }"/>'>
				<input type="hidden" name='type' value='<c:out value="${cri.type }"/>'>
				<input type="hidden" name='keyword' value='<c:out value="${cri.keyword }"/>'>
			<div class="form-group">
				<label>작성자</label><input class="form-control" name='writer' value='<c:out value="${notice.writer }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>공지번호</label><input class="form-control" name='notNo' value='<c:out value="${notice.notNo }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>제목</label><input class="form-control" name='title' value='<c:out value="${notice.title }"/>'>
			</div>
			<div class="form-group">
				<label>내용</label><textarea onkeyup="chkword(this, 4000)" class="form-control" rows="3" name='content' ><c:out value="${notice.content }"/></textarea>
			</div>
			
			<div class="form-group">
				<label>RegDate</label><input class="form-control" name='regDate' value='<fmt:formatDate value="${notice.regdate }" pattern="yyyy-MM-dd" />' readonly="readonly">
			</div>
			<div class="form-group">
				<label>UpDate Date</label><input class="form-control" name='updateDate' value='<fmt:formatDate value="${notice.updatedate }" pattern="yyyy-MM-dd" />' readonly="readonly">
			</div>
			<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
			 <button type="submit" data-oper='remove' class="btn btn-danger">지우기</button>
			<button type="submit" data-oper='list' class="btn btn-info">공지사항목록</button>
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
         formObj.attr("action","/notice/remove");
      }else if(operation === 'list'){

         formObj.attr("action","/notice/list").attr("method","get");
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
<script>
function chkword(obj, maxByte){
      var strValue = obj.value;
      var strLen = strValue.length;
      var totalByte = 0;
      var len=0;
      var oneChar="";
      var str2="";
      
      for(var i=0; i<strLen; i++){
         oneChar = strValue.charAt(i);
         if(escape(oneChar).length >4){
            totalByte +=3;
         } else {
            totalByte++;
      }
      
      //입력한 문자 길이보다 넘치면 잘라내기 위해 저장
      if(totalByte <= maxByte){
         len = i+1;
      }
   }
   
   // 넘어가는 글자는 자른다.
   if(totalByte > maxByte){
      alert(maxByte+"자를 초과 입력 할 수 없습니다.");
      str2= strValue.substr(0, len);
      obj.value = str2;
      chkword(obj, 4000);
   }
}
</script>

<%@ include file="../includes/footer.jsp"%>