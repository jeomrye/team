<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">자유게시판</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">자유게시판
				<button id="regBtn" type="button" class="btn btn-xs pull-right">새 글 작성</button>
			</div>
			<div class="panel-body">
				<table class="table eable-striped table-bordered table-hover">
					<thead>
						<tr>
							<th style="width: 10%">번호</th>
							<th style="width: 40%">제목</th>
							<th style="width: 10%">작성자</th>
							<th style="width: 10%">작성일</th>
							<th style="width: 10%">수정일</th>
						</tr>
					</thead>
					<c:forEach items="${list }" var="free">
						<tr>
							<td><c:out value="${free.fno }"></c:out></td>
							<td><a class="move" href='<c:out value="${free.fno }"/>'><c:out value="${free.title }"></c:out></a></td>					
							<td><c:out value="${free.writer }"></c:out></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${free.regdate }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${free.updateDate }"/></td>
						</tr>
					</c:forEach>
				</table>
		
				
				<!-- Modal 추가 (부트스트랩)-->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">새 글 작성 완료</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
					<!--  화면에서 검색 조건 처리 -->
				<div class="pull-left">
        		    <div class="col-lg-12" style="padding-top: 25px; padding-left: 0">
						<form id="searchForm" action="/free/list" method="get">
							<select name="type">
								<option value=""
								 	<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T" 
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W" 
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC" 
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
								<option value="TW" 
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
								<option value="TWC" 
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
							</select>
							<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' />
							<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>' />
							<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class="btn btn-default">검색</button>
						</form>
					</div>
				</div>
				<!--  JSP에서 페이지 번호 출력 -->
				<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous"><a href="${pageMaker.startPage -1 }">이전</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}"><a href="${num }">${num }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">다음</a></li>
						</c:if>
					</ul>
				</div>
				<form id="actionForm" action="/free/list" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
					<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
				</form>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		var result= '<c:out value="${result}"/>';
		checkModal(result);
		history.replaceState({},null,null);
		function checkModal(result){
			if(result === '' || history.state){
				return;
			}
			if(parseInt(result) > 0){
				$(".modal-body").html("게시글 "+parseInt(result)+" 번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click",function(){
			self.location ="/free/register";
		});
		
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click",function(e){
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		$(".move").on("click",function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='fno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/free/get");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click",function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요.");
				return false;
			}		
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요.");
				return false;
			}			
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
	});
</script>