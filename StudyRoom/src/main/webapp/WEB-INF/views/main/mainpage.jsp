<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<%@ include file="../includes/header.jsp"%>
<div class="row" style="width:100%; height:100%;background-size:100% 100%; background-repeat:no-repeat;  background-position:inherit;  background-image:url('/resources/main/srfsback.PNG'); ">




<!-- <img alt="/resources/main/srfsback.png" src="/resources/main/srfsback.png" style=" width: 100%;"> -->

	<a href="/main/mainpage" style="color: black; text-decoration: none; ">
		<img alt="/main/mainpage" src="/resources/main/srfs.PNG"
		style=" padding-left: 600px; padding-top:200px; width:auto; height:550px;" >
	</a> <br> <br>
	<form id="searchForm" action="/notice/list" method="get">
		<!-- <select name="type"> -->
		<!-- 			<option value="" -->
		<%-- 				<c:out value="${pageMaker.cri.type == null ? 'selected' :'' }" />>-----선 택-----</option> --%>
		<!-- 			<option value="T" -->
		<%-- 				<c:out value="${pageMaker.cri.type eq 'T'? 'selected' :'' }" />>지역</option> --%>
		<!-- 			<option value="C" -->
		<%-- 				<c:out value="${pageMaker.cri.type eq 'C'? 'selected' :'' }" />>독서실이름</option> --%>
		<!-- 			<option value="TC" -->
		<%-- 				<c:out value="${pageMaker.cri.type eq 'TC'? 'selected' :'' }" />>지역 or 독서실이름</option> --%>
		<!-- 		</select>  -->
		<div class="search-wrapper">
			<div class="input-holder">

				<input type="text" class="search-input" name="keyword"
					onfocus="this.value=''"
					value='지역/독서실이름 입력하세요<c:out value="${pageMaker.cri.keyword }"/>'>

				<button class="search-icon" onclick="searchToggle(this, event);">
					<span></span>
				</button>
			</div>
			<span class="close" onclick="searchToggle(this, event);"></span>
		</div>
	</form>
</div>

<!-- <div class="col-md-6" style="background-color: silver; height: 100%;"> -->
<!-- 	<img alt="" src="/resources/main/srfs_main_side.PNG"> -->
<!-- </div> -->

<script>
	function searchToggle(obj, evt) {
		var container = $(obj).closest('.search-wrapper');
		if (!container.hasClass('active')) {
			container.addClass('active');
			evt.preventDefault();
		} else if (container.hasClass('active')
				&& $(obj).closest('.input-holder').length == 0) {
			container.removeClass('active');
			// clear input
			container.find('.search-input').val('');
		}
	}
</script>
<style>
.search-wrapper {
	position: absolute;
	transform: translate(-50%, -50%);
	top: 75%;
	padding-left: 105%;
}

.search-wrapper.active {
	
}

.search-wrapper .input-holder {
	height: 70px;
	width: 70px;
	overflow: hidden;
	background: rgba(255, 255, 255, 0);
	border-radius: 6px;
	position: relative;
	transition: all 0.3s ease-in-out;
}

.search-wrapper.active .input-holder {
	width: 450px;
	border-radius: 50px;
	background: rgba(0, 0, 0, 0.5);
	transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
}

.search-wrapper .input-holder .search-input {
	width: 100%;
	height: 50px;
	padding: 0px 70px 0 20px;
	opacity: 0;
	position: absolute;
	top: 0px;
	left: 0px;
	background: transparent;
	box-sizing: border-box;
	border: none;
	outline: none;
	font-family: "Open Sans", Arial, Verdana;
	font-size: 16px;
	font-weight: 400;
	line-height: 20px;
	color: #FFF;
	transform: translate(0, 60px);
	transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
	transition-delay: 0.3s;
}

.search-wrapper.active .input-holder .search-input {
	opacity: 1;
	transform: translate(0, 10px);
}

.search-wrapper .input-holder .search-icon {
	width: 70px;
	height: 70px;
	border: none;
	border-radius: 6px;
	background: #FFF;
	padding: 0px;
	outline: none;
	position: relative;
	z-index: 2;
	float: right;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
}

.search-wrapper.active .input-holder .search-icon {
	width: 50px;
	height: 50px;
	margin: 10px;
	border-radius: 30px;
}

.search-wrapper .input-holder .search-icon span {
	width: 22px;
	height: 22px;
	display: inline-block;
	vertical-align: middle;
	position: relative;
	transform: rotate(45deg);
	transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
}

.search-wrapper.active .input-holder .search-icon span {
	transform: rotate(-45deg);
}

.search-wrapper .input-holder .search-icon span::before, .search-wrapper .input-holder .search-icon span::after
	{
	position: absolute;
	content: '';
}

.search-wrapper .input-holder .search-icon span::before {
	width: 4px;
	height: 11px;
	left: 9px;
	top: 18px;
	border-radius: 2px;
	background: #FE5F55;
}

.search-wrapper .input-holder .search-icon span::after {
	width: 14px;
	height: 14px;
	left: 0px;
	top: 0px;
	border-radius: 16px;
	border: 4px solid #FE5F55;
}

.search-wrapper .close {
	position: absolute;
	z-index: 1;
	top: 24px;
	right: 20px;
	width: 25px;
	height: 25px;
	cursor: pointer;
	transform: rotate(-180deg);
	transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
	transition-delay: 0.2s;
}

.search-wrapper.active .close {
	right: -50px;
	transform: rotate(45deg);
	transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
	transition-delay: 0.5s;
	padding-top: 100px;
}

.search-wrapper .close::before, .search-wrapper .close::after {
	position: absolute;
	content: '';
	background: #FE5F55;
	border-radius: 2px;
}

.search-wrapper .close::before {
	width: 5px;
	height: 25px;
	left: 10px;
	top: 0px;
}

.search-wrapper .close::after {
	width: 25px;
	height: 5px;
	left: 0px;
	top: 10px;
}

input {
	width: 50%;
	padding: .8em .5em;
	font-family: inherit;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 1px solid #999;
	border-radius: 0px;
}

select {
	width: 30%;
	padding: .8em .5em;
	font-family: inherit;
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 1px solid #999;
	border-radius: 0px;
}
</style>
<%@ include file="../includes/footer.jsp"%>
