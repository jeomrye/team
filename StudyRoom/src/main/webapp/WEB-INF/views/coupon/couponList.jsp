<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp" %>

<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            쿠폰 목록
                            <button id='regBtn' type="button" class="btn btn-xs pull-right">쿠폰 등록</button>
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
                                
                                <c:forEach items="${list}" var="coupon">
                                
                                	<tr>
                                		
								<!-- a태그 걸어줘서 쿠폰 상세정보 보기 페이지로 이동 -->
                                		<td><a href='/coupon/couponGet?couponNumber=<c:out value="${coupon.couponNumber}"/>'>
                                		<c:out value="${coupon.couponName}"/></a></td>
                                		<td><fmt:formatNumber value="${coupon.couponPrice}" pattern="###,###,###"/></td>
                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.couponregDate}"/></td>
                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.couponupdateDate}"/></td>
                                	</tr>
                                
                                </c:forEach>
</table>



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
	
});
</script>




































