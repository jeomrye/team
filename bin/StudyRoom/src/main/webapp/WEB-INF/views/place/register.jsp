<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">새로운 장소 등록</h1>
	</div>
</div>

<style>
span {
	color: red;
}
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
			<div class="panel-heading">새로운 장소 등록</div>
			<div class="panel-body">
			
			<form role="form" action="/place/register" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
			<c:out value="${placeResult}"></c:out>
			<!-- 상호명 -->
			<div class="form-group">
			<label>상호명<span>(필수)</span></label>
			<input class="form-control" name='title' placeholder="서울 광진구 랭스터디카페(카페형/무인)">
			</div>
			
			<!-- 기본 구비품 -->
			<div class="form-group">
			<label>기본 구비품<span>(필수)</span></label><br>
			<input type="checkbox" name='offer' value="공기청정기"> 공기청정기<br>
			<input type="checkbox" name='offer' value="개인 사물함"> 개인 사물함<br>
			<input type="checkbox" name='offer' value="냉난방기"> 냉난방기<br>
			<input type="checkbox" name='offer' value="개인 콘센트"> 개인 콘센트<br>
			<input type="checkbox" name='offer' value="취식공간"> 취식공간<br>			
			<input type="checkbox" name='offer' value="안마의자"> 안마의자<br>			
			<input type="checkbox" name='offer' value="엘레베이터"> 엘리베이터<br>			
			<input type="checkbox" name='offer' value="와이파이"> 와이파이<br>			
			<input type="checkbox" name='offer' value="없음"> 없음<br>			
			</div>
			
			<!-- 추가적인 제공품 -->
			<div class="form-group">
			<label>추가 제공품</label>
			<input class="form-control" name='extra' placeholder="카누,맥심,담요,충전기,개인 스탠드,귀마개,인쇄(흑:100/칼:500),팩스">
			</div>
			
			<!-- 내용 -->
			<div class="form-group">
			<label>내용<span>(필수)</span></label><textarea rows="3" class="form-control" name='content' onkeyup="chkword(this, 4000)" 
			placeholder="테이블형 15석, 독서실형 10석	 1층:카페형/2층:독서실형 분리 	1시간권:1,500원/4시간권:3,500원/8시간권:8,500원/종일권:1만원"></textarea>
			</div>
			
			<!-- 운영시간 -->
			<div class="form-group">
			<label>운영시간<span>(필수)</span></label>
			<input class="form-control" name='time' placeholder="새벽4시~다음날 새벽3시(연중무휴)">
			</div>
			
			<!-- 청소시간 -->
			<div class="form-group">
			<label>청소시간<span>(필수)</span></label>
			<input class="form-control" name='clean' placeholder="새벽3시~새벽4시">
			</div>
			
			<!-- 연락처 -->
			<div class="form-group">
			<label>연락처<span>(필수)</span></label>
			<input class="form-control" name='tel'>
			</div>
			
			<!-- 주소 -->
			<div class="form-group">
			<label>주소<span>(필수)</span></label>
			<input class="form-control" name='address'>
			</div>
			
			<!-- 홈페이지,SNS계정 -->
			<div class="form-group">
			<label>홈페이지/SNS계정</label>
			<input class="form-control" name='page' placeholder="홈페이지/SNS계정">
			</div>
			
			<!-- 작성자, 로그인한 아이디 읽어옴 -->
			<div class="form-group">
			<label>작성자</label>
			<input class="form-control" name='writer' value='<sec:authentication property="principal.username"/>' readonly="readonly">
			</div>
			
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="reset" class="btn btn-default">초기화</button>
			</form>
			
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">첨부파일</div>
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

<script>
//400자 초과 입력 불가
function chkword(obj, maxByte){
    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len=0;
    var oneChar="";
    var str2="";
    
    for(var i=0; i<strLen; i++){
       oneChar = strValue.charAt(i);
       if(escape(oneChar).length >4){
          totalByte +=3;
       } else {
          totalByte++;
    }
    
    //입력한 문자 길이보다 넘치면 잘라내기 위해 저장
    if(totalByte <= maxByte){
       len = i+1;
    }
 }
 
 // 넘어가는 글자는 자른다.
 if(totalByte > maxByte){
    alert(maxByte+"자를 초과 입력 할 수 없습니다.");
    str2= strValue.substr(0, len);
    obj.value = str2;
    chkword(obj, 4000);
 }
}

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

	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
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
			url : '/placePho/uploadAjaxAction',
			processData : false,
			contentType : false,
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
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
			var image = obj.image;
			console.log(obj.image);
			if(image===true){//이미지 파일일 때
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'>";
				str += "<i class='fa fa-times'></i></button><br>";
				str += "<img src='/placePho/display?fileName="+fileCallPath+"'>";
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
			url : '/placePho/deleteFile',
			data : {fileName : targetFile, type : type},
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
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