<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>

         <div class="panel-heading">
                            <h2>쿠폰 정보 수정</h2>
                          
                        </div>

<form role="form" action="/coupon/couponModify" method="post">

<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum }" />'>
<input type="hidden" name='amount' value='<c:out value="${cri.amount }" />'>
<input type="hidden" name='keyword' value='<c:out value="${cri.keyword }" />'>
<input type="hidden" name='type' value='<c:out value="${cri.type }" />'>

<div class="form-group">
	<label>쿠폰 번호</label>
	<input class="form-control" name='couponNumber' value='<c:out value="${coupon.couponNumber}"/>' readonly='readonly'>
</div>




<div class="form-group">
	<label>쿠폰 이름</label>
	<input class="form-control" name='couponName' value='<c:out value="${coupon.couponName}"/>'>
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
<div class="form-group uploadDiv">
<input type="file" name='uploadFile' multiple="multiple">
</div>

</div>
</div>
</div>
</div>

<div class="form-group">
	<label>쿠폰 가격</label>
	<input class="form-control" name='couponPrice' value='<fmt:formatNumber value="${coupon.couponPrice}" pattern="###,###,###"/>'>
</div>

<div class="form-group">
	<label>등록 날짜</label>
	<input class="form-control" name='couponregDate' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${coupon.couponregDate}"/>' readonly='readonly'>
</div>

<div class="form-group">
	<label>수정 날짜</label>
	<input class="form-control" name='couponupdateDate' value='<fmt:formatDate pattern="yyyy/MM/dd" value=""/>'>
</div>

<button type="submit" data-oper='modify' class="btn btn-default">수정.</button>
<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
<button type="submit" data-oper='list' class="btn btn-info">목록</button>
</form>



<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/coupon/couponRemove")
		}else if(operation === 'list'){
			//리스트로 이동
			formObj.attr("action", "/coupon/couponList").attr("method", "get")
			var pageNumTag = $("input=[name='pageNum']").clone();
			var amountTag = $("input=[name='amount']").clone();
			var keywordTag = $("input=[name='keyword']").clone();
			var typeTag = $("input=[name='type']").clone();
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
			
		}else if(operation === 'modify'){
			console.log("submit clicked");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			});
			formObj.append(str).submit();
		}
		formObj.submit();
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
					str += "<span> "+attach.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' ";
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				}else{
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
					str += "<span> "+attach.fileName+"</span><br/>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' ";
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/44438480.png'>";
					str += "</div>";
					str += "</li>";
				}
			});
			$(".uploadResult ul").html(str);
		});//JSON끝
	})();
	
	$(".uploadResult").on("click", "button", function(e){
		
		console.log("delete file");
		
		if(confirm("Remove this file?")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	$("input[type='file']").change(function(e){
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		for(var i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : '/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result){
				console.log(result);
				showUploadResult(result);//업로드 결과 처리 함수
			}
		});//ajax 끝
	});
		function showUploadResult(uploadResultArr){
			
			if(!uploadResultArr || uploadResultArr.length == 0){return;}
			
			var uploadUL = $(".uploadResult ul");
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
				//image type
				console.log(obj.image);
				if(obj.image){
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					
					str += "<li data-path='"+obj.uploadPath+"'";
					str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
					str += " ><div>";
					str += "<span>" + obj.fileName + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' ";
					str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				}else{
					var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					str += "<li ";
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span>" + obj.fileName + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' ";
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/44438480.png'></a>";
					str += "</div>";
					str += "</li>";
				}
			});
			uploadUL.append(str);
		}
	
	
});
</script>



