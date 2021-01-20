<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>


  
 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">쿠폰 정보</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            쿠폰 정보 페이지
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
<div class="form-group">
<input type="hidden" class="form-control" name='couponNumber' value='<c:out value="${coupon.couponNumber}"/>' readonly="readonly">
</div>



<div class="form-group">
<label>쿠폰 이름</label><input class="form-control" name='couponName' value='<c:out value="${coupon.couponName}"/>' readonly="readonly">
</div>

<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<style>
.uploadResult{
width:100%;
background-color:gray;
}
.uploadResult ul{
display:flex;
flex-flow:row;
justify-content:center;
align-items:center;
}
.uploadResult ul li{
list-style:none;
padding:10px;
align-content:center;
text-align:center;
}
.uploadResult ul li img{
width:100px;
}
.uploadResult ul li span{
color:white;
}
.bigPictureWrapper{
position:absolute;
display:none;
justify-content:center;
align-items:center;
top:0%;
width:100%;
height:100%;
bacckground-color:gray;
z-index:100;
background:rgba(255,255,255,0.5);
}
.bigPicture{
position: relative;
display:flex;
justify-content:center;
align-items:center;
}
.bigPicture img{
width:600px;
}
</style>
<div class="row">
<div class="col-lg-12">
<div class="panel panel-default">

<div class="panel-heading">쿠폰 이미지</div>
<div class="panel-body">
<div class='uploadResult'>
<ul>
</ul>
</div>
</div>
</div>
</div>
</div>
<div class="form-group">
<label>쿠폰 가격</label><input class="form-control" name='couponPrice' value='<fmt:formatNumber value="${coupon.couponPrice}" pattern="###,###,###"/>' readonly="readonly">
</div>

<!-- 쿠폰 상세보기 에서 수정이나 목록페이지로 이동 -->
<button data-oper='modify' class="btn btn-default">수정</button>
<button data-oper='sbumit' class="btn btn-primary">구입</button>
<button data-oper='list' class="btn btn-info">목록</button>

 <form id='operForm' action="/coupon/couponModify" method="get">
			        <input type='hidden' id='couponNumber' name='couponNumber' value='<c:out value="${coupon.couponNumber}"/>'>

			        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			        <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			        <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
			        <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
    
			      
			      </form>  



<%@include file="../includes/footer.jsp" %>


<script type="text/javascript">
$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		
		operForm.attr("action", "/coupon/couponModify").submit();
		
	});
	
	$("button[data-oper='list']").on("click", function(e){
		
		operForm.find("#couponNumber").remove();
		operForm.attr("action", "/coupon/couponList")
		operForm.submit();
	});
	
	(function(){
		
		var couponNumber = '<c:out value="${coupon.couponNumber}"/>';
		
		$.getJSON("/coupon/getAttachList", {couponNumber:couponNumber}, function(arr){
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i, attach){
				//image type
				if(attach.fileType){
					var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				}else{
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
					str += "<span> "+attach.fileName+"</span><br/>";
					str += "<img src='/resources/img/44438480.png'>";
					str += "</div>";
					str += "</li>";
				}
			});
			$(".uploadResult ul").html(str);
		});//JSON끝
	})();
	
	$(".uploadResult").on("click", "li", function(e){
		
		console.log("view image");
		
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g), "/"));
		}else{
			//download
			self.location = "/download?fileName="+path
		}
	});
	
	function showImage(fileCallPath){
		
		alert(fileCallPath);
		
		$(".bigPictureWrapper").css("display", "flex").show();
		
		$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%', height:'100%'}, 1000);
		
		
	}
	
	$(".bigPictureWrapper").on("click", function(e){
		$(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
		setTimeout(function(){
			$('.bigPictureWrapper').hide();
		}, 1000);
	});
	
});
</script>

































