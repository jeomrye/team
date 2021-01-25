<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    <%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">관리자용 마이페이지</h1>
	</div>
</div>
<!-- end header -->
<div class="row">
	<div class="col=lg=12">
		<div class="panel panel-default" >
			<div class="panel-heading">회원 정보 목록</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							
							<th>유저아이디</th>
							<th>권한번호</th>
							<th>이름</th>
							<th>비밀번호</th>
							<th>이메일</th>
							<th>핸드폰번호</th>
							<th>성별</th>
							<th>가입일자</th>
							<th>최근 수정일자</th>
							<th>현재 마일리지</th>
							<th>사업자등록번호</th>
						</tr>
					</thead>
					
					<c:forEach items="${list }" var="member">
						<tr>
							
							<td><a class="move" href='<c:out value="${member.userid }"/>'>
							<c:out value="${member.userid }"></c:out></a></td>
							<td><c:out value="${member.memberno }"></c:out></td>
							<td><c:out value="${member.username }"></c:out></td>
							<td><c:out value="${member.password }"></c:out></td>
							<td><c:out value="${member.email }"></c:out></td>
							<td><c:out value="${member.phone }"></c:out></td>
							<td><c:out value="${member.gender }"></c:out></td>
							<td><c:out value="${member.regdate }"></c:out></td>
							<td><c:out value="${member.updatedate }"></c:out></td>
							<td><c:out value="${member.mileage }"></c:out></td>
							<td><c:out value="${member.companynumber }"></c:out></td>
						</tr>
					</c:forEach>
					
					
					
				</table>
				
				<div class="pull-left">
				<div class="col-lg-12" style="padding-top: 25px; padding-left: 0">
<!-- 				검색기능 -->
					<form id="searchForm" action="/mypage/infoList" method="get">
						<select name="type">
							<option value=""
								<c:out value="${pageMaker.cri.type == null ? 'selected' :'' }" />>--</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T'? 'selected' :'' }" />>이름</option>
							<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'? 'selected' :'' }" />>핸드폰번호</option>
							<option value="R"
							<c:out value="${placePage.cri.type eq 'R'? 'selected' : '' }"/>>이메일</option>
							<option value="TC"
							<c:out value="${pageMaker.cri.type eq 'TC'? 'selected' :'' }" />>이름 or 핸드폰번호</option>
							<option value="TR"
							<c:out value="${pageMaker.cri.type eq 'TR'? 'selected' :'' }" />>이름 or 이메일</option>
						</select> 
						<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'> 
						<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"/>'> 
						<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"/>'>
						<button class="btn btn-default">검색</button>
					</form>
				
				</div>
				</div>
				
				<div class="pull-right">
					<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage -1 }">Previous</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage +1 }">Next</a></li>
					</c:if>

				</ul>
				<form id='actionForm' action="/mypage/infoList" method="get">
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'> 
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
				</form>
				
			
				
				
				<!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">결과</h4>
                                        </div>
                                        <div class="modal-body">
                                            	처리가 완료되었습니다
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
				
				
			</div>
		</div>
	</div>
</div>




<script type="text/javascript">
	

	var actionForm = $("#actionForm");
	$(".paginate_button a").on(
			"click",
			function(e) {
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']")
						.val($(this).attr("href"));
				actionForm.submit();
			});
	$(".move")
			.on(
					"click",
					function(e) {
						e.preventDefault();
						actionForm
								.append("<input type='hidden' name='userid' value='"
										+ $(this).attr(
												"href")
										+ "'>");
						actionForm.attr("action",
								"/mypage/myinfo");
						actionForm.submit();
					});
	var searchForm = $("#searchForm");
	$("#searchForm button").on(
			"click",
			function(e) {
				if (!searchForm.find("option:selected")
						.val()) {
					alert("검색종류를 선택하세요");
					return false;
				}
				if (!searchForm.find(
						"input[name='keyword']").val()) {
					alert("키워드를 입력하세요");
					return false;
				}
				searchForm.find("input[name='pageNum']")
						.val("1");
				e.preventDefault();
				searchForm.submit();
			});

	
</script>






<%@include file="../includes/footer.jsp" %>

</body>
</html>