<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Study Place</h1>
	</div>
</div>

<style>
.uploadResult {
width: 100%;
background-color: gray;
}

.uploadResult ul {
display: flex;
flex-flow: row;
justify-content: center;
align-items: center;
}

.uploadResult ul li {
list-style: none;
padding: 10px;
}

.uploadResult ul li img {
width: 100px;
}
</style>

<style>
.bigPictureWrapper {
position: absolute;
display: none;
justify-content: center;
align-items: center;
top:0%;
width:100%;
height:100%;
background-color: gray;
z-index: 100;
}

.bigPicture {
position: relative;
display:flex;
justify-content: center;
align-items: center;
}
</style>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">장소 등록</div>
			<div class="panel-body">
			
			<form role="form" action="/place/register" method="post">
			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
			
			<c:out value="${placeResult}"></c:out>
			<!-- 상호명 -->
			<div class="form-group">
			<label>Title</label><input class="form-control" name='title'>
			</div>
			
			<!-- 기본 구비품 -->
			<div class="form-group">
			<label>Offer</label><br>
			<input type="checkbox" name='offer' value="공기청정기"> 공기청정기<br>
			<input type="checkbox" name='offer' value="개인 사물함"> 개인 사물함<br>
			<input type="checkbox" name='offer' value="냉난방기"> 냉난방기<br>
			<input type="checkbox" name='offer' value="개인 콘센트"> 개인 콘센트<br>
			<input type="checkbox" name='offer' value="취식공간"> 취식공간<br>			
			<input type="checkbox" name='offer' value="안마의자"> 안마의자<br>			
			<input type="checkbox" name='offer' value="엘레베이터"> 엘리베이터<br>			
			<input type="checkbox" name='offer' value="와이파이"> 와이파이<br>			
<!-- 			<input class="form-control" name='offer'> -->
			</div>
			
			<!-- 추가적인 제공품 -->
			<div class="form-group">
			<label>Extra</label>
			<input type="checkbox" name='extra' value="인쇄"> 인쇄<br>
			컬러 : <input type="text" name="color" size="5">, 흑백 : <input type="text" name="black" size="5">
		<!-- 	<input class="form-control" name='extra'> -->
			</div>
			
			<!-- 내용 -->
			<div class="form-group">
			<label>Content</label>
			<textarea rows="3" class="form-control" name='content'></textarea>
			</div>
			
			<!-- 운영시간 -->
			<div class="form-group">
			<label>Time</label><input class="form-control" name='time'>
			</div>
			
			<!-- 청소시간 -->
			<div class="form-group">
			<label>Clean</label><input class="form-control" name='clean'>
			</div>
			
			<!-- 연락처 -->
			<div class="form-group">
			<label>Tel</label><input class="form-control" name='tel'>
			</div>
			
			<!-- 주소 -->
			<div class="form-group">
			<label>Address</label><input class="form-control" name='address'>
			</div>
			
			<!-- 홈페이지,SNS계정 -->
			<div class="form-group">
			<label>Page</label><input class="form-control" name='page'>
			</div>
			
			<!-- 작성자 -->
			<div class="form-group">
			<label>Writer</label><input class="form-control" name='writer'>
			</div>
			
			<button type="submit" class="btn btn-primary">Submit Button</button>
			<button type="reset" class="btn btn-default">Reset Button</button>
			</form>
			
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">File Attach</div>
			<div class="panel-body">
				<div class="form-group uploadDiv"><!--  class 이름 2개 -->
					<input type="file" name="uploadFile" multiple>
				</div>
				<div class="uploadResult">
					<ul>
					
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 
<script>
function checkboxArr() {
    var checkArr = [];     // 배열 초기화
    $("input[name='offer':checked]").each(function(i)){
    	checkArr.push($(this).val());// 체크된 것만 값을 뽑아서 배열에 push
    }
 
    $.ajax({
        url: 'test_check'
        , type: 'post'
        , dataType: 'text'
        , data: {
            valueArrTest: checkArr
        }
    });
}
</script> -->

<script>
$(document).ready(function(e){
	var formObj = $("form[role='form']");
	
	 $("button[type='submit']").on("click",function(e){
		 e.preventDefault();//실행만 하고 링크 연결은 하지 않는다
		 
		 console.log("submit clicked");
		 
		 var str ="";
		 
		 //파일 업로드
		 $(".uploadResult ul li").each(function(i, obj){
			 var jobj = $(obj);
			 console.dir(jobj);
			 
			 str += "<input type='hidden' name='photoList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			 str += "<input type='hidden' name='photoList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			 str += "<input type='hidden' name='photoList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			 str += "<input type='hidden' name='photoList["+i+"].fileType' value='"+jobj.data("type")+"'>";
		 });
			 formObj.append(str).submit();
		
	 });
	 
	 //파일 검사
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize>=maxSize){
			alert("파일 사이즈 초과");
			return false;
		}	
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}

	//var csrfHeaderName = "${_csrf.headerName}";
	//var csrfTokenValue = "${_csrf.token}";
	
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		for(var i = 0; i<files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile",files[i]);
		}
		
		$.ajax({
			url : '/uploadAjaxAction',
			processData : false,
			contentType : false,
			/* beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			}, */
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result){
				console.log(result);
				showUploadResult(result);
			}
		});//$.ajax
	});		
		function showUploadResult(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length==0){
				return;
			}
			
		var uploadUL = $(".uploadResult ul");
		var str = "";

		$(uploadResultArr).each(function(i,obj){
			if(obj.image==true){//이미지 파일일 때
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'>";
				str += "<i class='fa fa-times'></i></button><br>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div></li>";
			} else{//일반 파일일 때
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span>"+obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'>";
				str += "<i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'>";
				str += "</div></li>";		
			}
		});
		uploadUL.append(str);
		}	

		//업로드된 파일의 버튼을 클릭했을 때
	$(".uploadResult").on("click","button",function(e){
		console.log("delete file");
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url : '/deleteFile',
			data : {fileName : targetFile, type : type},
			/* beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			}, */
			dataType : 'text',
			type : 'POST',
			success : function(result){
				alert(result);
				targetLi.remove();
			}
		});// $.ajax
	});//$(".uploadResult")
});
</script>

<%@ include file="../includes/footer.jsp" %>