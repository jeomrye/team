<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp" %>

<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3>쿠폰 목록</h3>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#쿠폰 번호</th>
                                        <th>쿠폰 이름</th>
                                        <th>쿠폰 가격</th>
                                        <th>쿠폰 등록 일자</th>
                                        <th>쿠폰 수정 일자</th>
                                    </tr>
                                </thead>
                                
                                <c:forEach items="${list}" var="coupon">
                                
                                	<tr>
                                		<td><c:out value="${coupon.couponNumber}"/></td>
                                		<td><c:out value="${coupon.couponName}"/></td>
                                		<td><c:out value="${coupon.couponPrice}"/></td>
                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.couponregDate}"/></td>
                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.couponupdateDate}"/></td>
                                	</tr>
                                
                                </c:forEach>
</table>
</div>
<!-- end panel body -->
</div>
<!-- end panel -->
</div>
</div>
<!-- /.row -->
 <%@include file="../includes/footer.jsp" %>


