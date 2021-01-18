<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>

 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">쿠폰 등록 페이지</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            쿠폰 등록
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
<form role="form" action="/coupon/couponRegister" method="post">

                                        <div class="form-group">
                                            <label>쿠폰 이름..</label>
                                            <input class="form-control" name='couponName'>
                                            </div>
                                            <div class="form-group">
                                            <label>쿠폰 가격</label>
                                            <input class="form-control" name='couponPrice'>
                                            </div>
                                            <button type="submit" class="btn btn-default">등록</button>
                                            <button type="reset" class="btn btn-default">취소</button>
                                            </form>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            




<%@include file="../includes/footer.jsp" %>