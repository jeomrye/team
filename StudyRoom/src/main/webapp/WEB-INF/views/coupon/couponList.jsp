<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">마일리지 쿠폰구매 게시판</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            쿠폰 목록
                            <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
                            <button id='regBtn' type="button" class="btn btn-xs pull-right">쿠폰 등록</button>
                        </sec:authorize>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        
                                        <th>쿠폰 이름</th>
                                        <th>쿠폰 가격</th>
                                        <th>쿠폰 등록 일자</th>
                                        <th>쿠폰 수정 일자</th>
                                    </tr>
                                </thead>
                                
                                <c:forEach items="${couponList}" var="coupon">
                                
                                	<tr>
                                		
								<!-- a태그 걸어줘서 쿠폰 상세정보 보기 페이지로 이동 -->
                                		<td><a class='move' href='<c:out value="${coupon.couponNumber}"/>'>
                                		<c:out value="${coupon.couponName}"/></a></td>
                                		<td><fmt:formatNumber value="${coupon.couponPrice}" pattern="###,###,###"/></td>
                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.couponregDate}"/></td>
                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.couponupdateDate}"/></td>
                                	</tr>
                                
                                </c:forEach>
</table>



<div class='pull-right'>
<ul class="pagination">

<c:if test="${pageMaker.prev}">
<li class="paginate_button previous">
<a href="${pageMaker.startPage -1 }">이전</a>
</li>
</c:if>

<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : ""}">
	<a href="${num }">${num }</a>
	</li>
</c:forEach>

<c:if test="${pageMaker.next}">
<li class="paginate_button next">
<a href="${pageMaker.endPage + 1 }">다음</a>
</li>
</c:if>

</ul>
</div>

<div class='row'>
<div class="col-lg-12">

<form id='searchForm' action="/coupon/couponList" method='get'>
	<select name='type'>
		<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
			<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>쿠폰이름</option>
	</select>
	<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
	<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
	<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
	<button class='btn btn-default'>검색</button>
</form>

</div>
</div>

<form id='actionForm' action="/coupon/couponList" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
	<input type='hidden' name='type' value='${pageMaker.cri.type }'>
	<input type='hidden' name='keyword' value='${pageMaker.cri.keyword }'>
</form>

	<!-- Modal 추가 -->
	          	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	          		aria-labelledby="myModalLabel" aria-hidden="true">
	          		<div class = "modal-dialog">
	          			<div class="modal-content">
	          				<div class="modal-header">
	          					<button type="button" class = "close" data-dismiss="modal" 
	          						aria-hidden="true">&times;</button>
	          					<h4 class="modal-title" id="myModalLabel">완료</h4>
	          				</div>
	          				<div class = "modal-body">처리가 완료되었습니다.</div>
	          				<div class="modal-footer">
	          					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	          				</div>
	          			</div>
	          			<!-- /.modal-content -->
	          		</div>
	          		<!-- /.modal-dialog -->
	          	</div>
	          	<!-- /.modal -->
</div>
<!-- end panel body -->
</div>
<!-- end panel -->
</div>
</div>
<!-- /.row -->

 <%@include file="../includes/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({},null,null);
	
	function checkModal(result){
		
		if(result === '' || history.state){
			return;
		}
		
		if(parseInt(result) > 0){
			$(".modal-body").html("쿠폰" + parseInt(result) + " 번이 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
	}
	
	$("#regBtn").on("click", function(){
		
		self.location = "/coupon/couponRegister";
		
	});
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e){
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='couponNumber' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/coupon/couponGet");
		actionForm.submit();
	});
	
	var searchForm = $('#searchForm');
	
	$("#searchForm button").on("click", function(e){
		
		if(!searchForm.find("option:selected").val()){
			alert("검색 종류를 선택하세요");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
	
});
</script>




































