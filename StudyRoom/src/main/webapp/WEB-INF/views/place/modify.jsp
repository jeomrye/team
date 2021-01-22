<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">장소 수정</h1>
	</div>
</div>

<!-- 첨부 사진 -->
<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">첨부파일</div>
			<div class="panel-body">
			
			<div class="form-group uploadDiv">
				<input type="file" name='uploadFile' multiple="multiple">
			</div>
			
				<div class="uploadResult">
					<ul>
					
					</ul>
				</div>
				
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">장소 수정</div>
			<div class="panel-body">
		
			<form role="form" action="/place/modify" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name='keyword' value='<c:out value="${cri.keyword}"/>'>
			<input type="hidden" name='type' value='<c:out value="${cri.type}"/>'>
			
			<!-- 글번호-->
			<div class="form-group">
			<label>번호</label>
			<input class="form-control" name='bno' value="<c:out value='${place.bno}'/>" readonly="readonly">
			</div>
			
			<!-- 상호명 -->
			<div class="form-group">
			<label>상호명<span>(필수)</span></label>
			<input class="form-control" name='title' placeholder="서울 광진구 랭스터디카페(카페형/무인)" value="<c:out value='${place.title}'/>">
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
			<input class="form-control" name='extra' placeholder="카누,맥심,담요,충전기,개인 스탠드,귀마개,인쇄(흑:100/칼:500),팩스" value="<c:out value='${place.extra}'/>">
			</div>
			
			<!-- 내용 -->
			<div class="form-group">
			<label>내용<span>(필수)</span></label>
			<textarea rows="3" class="form-control" name='content' 
			placeholder="테이블형 15석, 독서실형 10석	 1층:카페형/2층:독서실형 분리 	1시간권:1,500원/4시간권:3,500원/8시간권:8,500원/종일권:1만원"><c:out value="${place.content}"/></textarea>
			</div>
			
			<!-- 운영시간 -->
			<div class="form-group">
			<label>운영시간<span>(필수)</span></label><input class="form-control" name='time' placeholder="새벽4시~다음날 새벽3시(연중무휴)" value="<c:out value='${place.time}'/>">
			</div>
			
			<!-- 청소시간 -->
			<div class="form-group">
			<label>청소시간<span>(필수)</span></label>
			<input class="form-control" name='clean' placeholder="새벽3시~새벽4시" value="<c:out value='${place.clean}'/>">
			</div>
			
			<!-- 연락처 -->
			<div class="form-group">
			<label>연락처<span>(필수)</span></label>
			<input class="form-control" name='tel' value="<c:out value='${place.tel}'/>">
			</div>
			
			<!-- 주소 -->
			<div class="form-group">
			<label>주소<span>(필수)</span></label>
			<input class="form-control" name='address' value="<c:out value='${place.address}'/>">
			</div>
			
			<!-- 홈페이지,SNS계정 -->
			<div class="form-group">
			<label>홈페이지/SNS계정</label>
			<input class="form-control" name='page' placeholder="홈페이지/SNS계정" value="<c:out value='${place.page}'/>">
			</div>
			
			<!-- 작성자 -->
			<div class="form-group">
			<label>Writer</label>
			<input class="form-control" name='writer' value="<c:out value='${place.writer}'/>" readonly="readonly">
			</div>
			
			<!-- 작성일 -->
			<div class="form-group">
			<label>작성일</label>
			<input class="form-control" name="regDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${place.regdate }"/>' readonly="readonly">
			</div>
			
			<!-- 수정일 -->
			<div class="form-group">
			<label>수정일</label>
			<input class="form-control" name="updateDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${place.updateDate }"/>' readonly="readonly">
			</div>
			
			<sec:authentication property="principal" var="pinfo"/>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
					<c:if test="${pinfo.username eq place.writer or pinfo.authorities eq '[ROLE_ADMIN]' }">
						<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
						<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
					</c:if>
				</sec:authorize>	

			<button type="submit" data-oper='list' class="btn btn-info">목록</button>
			
			</form>
			</div>
		</div>
	</div>
</div>

<style>
span {
	color: red;
}
.uploadResult {
	width : 100%;
	background-color: pink;
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
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span{
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: purple;
	z-index: 100;
	background: rgba9255,255,255,0.5);
}
.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}
.bigPicture img {
	width: 600px;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form");
		
		$("button").on("click", function(e){
			e.preventDefault();//a태그를 클릭해도 페이지 이동이 없도록 하는 부분
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove'){//remove 버튼일 때
				formObj.attr("action", "/place/remove");
			}else if(operation === 'list'){//list 버튼일 때
				formObj.attr("action", "/place/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				formObj.empty(); //비우기
				//복사해둔 값들 넣기
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			} else if(operation ==='modify'){//modify 확인 버튼
				console.log("submit clicked");
				
				var str ="";
				
				//파일 첨부 부분 -> 각각
				$(".uploadResult ul li").each(function(i, obj){
					 var jobj = $(obj);
					 console.dir(jobj);
					 
					 str += "<input type='hidden' name='photoList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					 str += "<input type='hidden' name='photoList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					 str += "<input type='hidden' name='photoList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					 str += "<input type='hidden' name='photoList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				 });
					 formObj.append(str).submit();
			}
			formObj.submit();
		});
	});
</script>

<script>
$(document).ready(function(){
	  
	  (function(){
	  
	    var bno = '<c:out value="${place.bno}"/>';

	    $.getJSON("/place/getPhotoList", {bno: bno}, function(arr){
	        
	       console.log(arr);
	       
	       var str = "";
	       
	       $(arr).each(function(i, photo){
	    	   var type = photo.fileType;
	           console.log("type : "+type);
	           
	         //image type
	         if(type==="true"){//이미지 파일
	        //섬네일
	           var fileCallPath =  encodeURIComponent( photo.uploadPath+ "\s_"+photo.uuid +"_"+photo.fileName); 
	         
	           str += "<li data-path='"+photo.uploadPath+"' data-uuid='"+photo.uuid+"' data-filename='"+photo.fileName+"' data-type='"+photo.fileType+"' ><div>";
	           str += "<span> "+photo.fileName+"</span><br/>";//상단에 파일 이름
	           str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' ";
	           str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>" 
	           str += "<img src='/placePho/display?fileName="+fileCallPath+"'>";
	           str += "</div>";
	           str +="</li>";
	         }else{//이미지 아닌 파일
	           str += "<li data-path='"+photo.uploadPath+"' data-uuid='"+photo.uuid+"' data-filename='"+photo.fileName+"' data-type='"+photo.fileType+"' ><div>";
	           str += "<span> "+ photo.fileName+"</span><br/>";//상단에 파일 이름
	           str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' ";
	           str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"	           
	           str += "<img src='/resources/img/attach.png'></a>";//이미지 대체 사진
	           str += "</div>";
	           str +="</li>";
	         }
	       });    
	       $(".uploadResult ul").html(str);         
	     });//end getjson   
	  })(); //end function
	  
	  //각각의 사진 혹은 파일의 버튼 클릭시
	 $(".uploadResult").on("click","button",function(e){
		 console.log("delete file");
		 
		 if(confirm("Remove this tile?")){//확인창
			 var targetLi = $(this).closest("li");
			 targetLi.remove();
		 }
	 });
	  
	  //파일 확인
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");//제외 리스트
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
		
		//파일 업로드
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
				data : formData,
				type : 'POST',
				beforeSend : function(xhr){
					xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
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
				if(obj.image){
					var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"'";
					str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'>";
					str += "<i class='fa fa-times'></i></button><br>";
					str += "<img src='/placePho/display?fileName="+fileCallPath+"'>";
					str += "</div></li>";
				} else{
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
});
</script>

<%@ include file="../includes/footer.jsp" %>