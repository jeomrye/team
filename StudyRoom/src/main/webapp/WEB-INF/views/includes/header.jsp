<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
     
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<style>
.bar{
color: white;
}
 .bar:hover{
 
color: black;
}
</style>

    <div id="wrapper" >

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="border-color: black; background-color :black ; margin-bottom: 0;">
            

                <a class="navbar-brand" href="/main/mainpage">
                <img alt="/resources/main/top.png" src="/resources/main/top.png" style="padding-top: 10px;">
<!--                 <h4>SRFS</h4> -->
                </a>
            
            <!-- /.navbar-header -->
			
			<!-- 상단 배너 -->
            <ul class="nav navbar-top-links navbar-right">
			<!-- 각 리스트로 -->
               <li><a class="bar" href="/notice/list" ><h4>공지사항</h4></a></li>
               <li><a class="bar" href="/free/list"><h4>자유게시판</h4></a></li>
               <li><a class="bar" href="/place/list"><h4>장소</h4></a></li>
               <li><a class="bar" href="/coupon/couponList"><h4>쿠폰구매하기</h4></a></li>
               <li><a class="bar" href="/qna/list"><h4>Q&A</h4></a></li>
               <li><a class="bar" href="/faq/list"><h4>FAQ</h4></a></li>
               <sec:authorize access="isAuthenticated()">
               <li><a class="bar" href="/mypage/myinfo"><h4>마이페이지</h4></a></li>
               <li><a class="bar" href="/customLogout"><h4>로그아웃</h4></a></li>
               </sec:authorize>
               <sec:authorize access="isAnonymous()">
               <li><a class="bar" href="/customLogin"><h4>로그인</h4></a></li>
               </sec:authorize>
               	 
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

        </nav>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
           
        

