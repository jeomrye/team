<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">장소게시판</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">장소게시판
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
			<button type="button" id='regBtn' class="btn btn-xs pull-right">새 장소 등록</button>
			</sec:authorize>
			</div>
			<div class="panel-body">
				<table class="table eable-striped table-bordered table-hover">
					<thead>
					<tr>
						<th style="width: 10%">번호</th>
						<th style="width: 40%">상호명</th>
						<th style="width: 10%">작성자</th>
						<th style="width: 10%">작성일</th>
						<th style="width: 10%">수정일</th>
					</tr>
					</thead>
					
					<c:forEach items="${placeList}" var="place"> <!-- place list 값 모두 가져와서 반복문 -->
					<tr>
						<td><c:out value="${place.bno }" /></td> <!--  글 번호 -->

						<td><a class='move' href='<c:out value="${place.bno }"/>'> <!-- 글 상세보기 링크 -->
						<c:out value="${place.title }"/> <!-- 글 제목  -->

						<b>[ <c:out value="${place.placeReCnt }" /> ]</b> <!-- 댓글 수  -->
						</a></td>
						
						<td><c:out value="${place.writer }" /></td> <!-- 글 작성자 -->
						
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${place.regdate }" /></td> <!-- 글 작성일 -->
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${place.updateDate }" /></td> <!-- 글 수정일 -->
					</tr>
					</c:forEach>	
				</table>
				
				

				<!-- list로 넘어갈 때 가져가는 값 -->
				<form id="actionForm" action="/place/list" method="get">
					<input type="hidden" name='pageNum' value="${placePage.cri.pageNum}">
					<input type='hidden' name='amount' value='${placePage.cri.amount}'>
					<!-- 검색을 했다면, list로 돌아갈시 전체 목록이 아닌 검색했던 내용 목록이 다시 뜰 수 있도록 -->
					<input type="hidden" name='type' value='<c:out value="${placePage.cri.type}"/>'>
					<input type="hidden" name='keyword' value='<c:out value="${placePage.cri.keyword}"/>'>
				</form>

				<!-- 글 등록시 뜨는 modal -->
			 	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">새로운 장소 등록!</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
						</div>
					</div>
				</div>			
			</div>
			<!-- 검색부분 -->
				<div class="pull-left">
					<div class="col-lg-12" style="padding-top: 25px; padding-left:0">
					
					<form id='searchForm' action="/place/list" method="get">
					<select name='type'>
						<option value=""
							<c:out value="${placePage.cri.type == null? 'selected' : '' }"/>>---
						</option>
						<option value="T"
							<c:out value="${placePage.cri.type eq 'T'? 'selected' : '' }"/>>상호명
						</option>
						<option value="C"
							<c:out value="${placePage.cri.type eq 'C'? 'selected' : '' }"/>>내용
						</option>
						<option value="R"
							<c:out value="${placePage.cri.type eq 'R'? 'selected' : '' }"/>>지역
						</option>
						<option value="TC"
							<c:out value="${placePage.cri.type eq 'TC'? 'selected' : '' }"/>>상호명 or 내용
						</option>
						<option value="TR"
							<c:out value="${placePage.cri.type eq 'TR'? 'selected' : '' }"/>>상호명 or 지역
						</option>
						<option value="TCR"
							<c:out value="${placePage.cri.type eq 'TCR'? 'selected' : '' }"/>>상호명 or 내용 or 지역
						</option>
					</select>
					
					<!-- 검색 입력창 -->
					<!-- cout된 값을 value로 갖게된다. keyword를 가지게 된다면 -->
					<input type="text" name='keyword' value='<c:out value="${placePage.cri.keyword}"/>' />
					<!-- 페이지번호 hidden 처리 -->
					<input type="hidden" name="pageNum" value='<c:out value="${placePage.cri.pageNum}"/>'>
					<!-- 한 페이지당 게시물 수 hidden 처리 -->
					<input type="hidden" name="amount" value='<c:out value="${placePage.cri.amount}"/>'>
					<button class='btn btn-default'>검색</button>
					</form>	
					</div>
				</div>

				<!-- 페이지 번호 리스트-->
				<div class='pull-right'>
					<ul class="pagination">
					<!-- 이전 영역이 있는 경우 -->
						<c:if test="${placePage.prev }">
							<li class="paginate_button previous">
							<a href="${placePage.startPage -1}">이전</a></li> <!-- 클릭시 현재 시작 페이지 -1 -->
						</c:if>
					
					<!-- 페이지 번호 목록 출력 -->
						<c:forEach var="num" begin="${placePage.startPage}" end="${placePage.endPage}">
						<li class='paginate_button ${placePage.cri.pageNum==num ? "active":""}'>
						<a href="${num}">${num}</a></li> <!-- 클릭시 해당 페이지 목록으로 이동 -->
						</c:forEach>
						
					<!-- 다음 영역이 있는 경우 -->
						<c:if test="${placePage.next }">
							<li class="paginate_button next">
							<a href="${placePage.endPage +1 }">다음</a></li> <!-- 클릭시 현재 마지막 페이지 +1 -->
						</c:if>
						
					</ul>
				</div>
		</div>
	</div>
	
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var placeResult = '<c:out value="${placeResult}"/>'; //register했을 때 등장
		checkModal(placeResult);
		
		history.replaceState({},null,null);
		
		function checkModal(placeResult){
			if(placeResult==='' || history.state){
				return;
			}
			if(parseInt(placeResult) > 0){
				$(".modal-body").html("새로운 게시글이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click",function(){ //Register New Place!버튼
			self.location = "/place/register";
		});
		
		var actionForm = $("#actionForm"); //list로 넘어갈 때 가져가는 값들 모아둔 form
		
		//페이지 목록 이동
		$(".paginate_button a").on("click",function(e){
			e.preventDefault();//a태그를 클릭해도 페이지 이동이 없도록 하는 부분
			
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href")); //pageNum 형식 찾아와서 href 속성 추가
			actionForm.submit(); //actionForm을 통해서 전달되도록
		});
		
		//게시글 상세보기로 이동
		$(".move").on("click",function(e){
			e.preventDefault();//a태그를 클릭해도 페이지 이동이 없도록 하는 부분
			//현재 사용중인 게시글에 href 속성 추가
			actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href")+"'>");
			actionForm.attr("action","/place/get"); //action="/place/get"
			actionForm.submit();
		});

		var searchForm = $("#searchForm");
		 
		//검색 버튼을 클릭했을 때
		$("#searchForm button").on("click", function(e){
			if(!searchForm.find("option:selected").val()){ //검색 종류 미선택시
				alert("검색종류를 선택하세요");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){ //검색어 미입력시
				alert("검색어를 입력하세요");
				return false;
			}
			//pageNum을 name으로 갖는 것을 찾아서 그 값을 1로 만들기 -> 1페이지로 이동
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();//a태그를 클릭해도 페이지 이동이 없도록 하는 부분
			
			searchForm.submit();
		});
	});
</script>
<%@ include file="../includes/footer.jsp" %>