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

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">장소 상세보기</div> <!-- list.jsp에서 넘어옴 -->
			<div class="panel-body">
			
			<!-- 점수 -->
			<div class="form-group">
			<label>Score</label><input class="form-control" name='score' value="<c:out value='${place.score}'/>" readonly="readonly">
			</div>
			
			<!-- 글 번호 -->
			<div class="form-group">
			<label>Bno</label><input class="form-control" name='bno' value="<c:out value='${place.bno}'/>" readonly="readonly">
			</div>
			
			<!-- 상호명 -->
			<div class="form-group">
			<label>Title</label><input class="form-control" name='title' value="<c:out value='${place.title}'/>" readonly="readonly">
			</div>
			
			<!-- 기본 구비품 -->
			<div class="form-group">
			<label>Offer</label><input class="form-control" name='offer' value="<c:out value='${place.offer}'/>" readonly="readonly">
			</div>
			
			<!-- 추가적인 제공품 -->
			<div class="form-group">
			<label>Extra</label><input class="form-control" name='extra' value="<c:out value='${place.extra}'/>" readonly="readonly">
			</div>
			
			<!-- 내용 -->
			<div class="form-group">
			<label>Content</label>
			<textarea rows="3" class="form-control" name='content' readonly="readonly"><c:out value="${place.content}"/></textarea>
			</div>
			
			<!-- 운영시간 -->
			<div class="form-group">
			<label>Time</label><input class="form-control" name='time' value="<c:out value='${place.time}'/>" readonly="readonly">
			</div>
			
			<!-- 청소시간 -->
			<div class="form-group">
			<label>Clean</label><input class="form-control" name='clean' value="<c:out value='${place.clean}'/>" readonly="readonly">
			</div>
			
			<!-- 연락처 -->
			<div class="form-group">
			<label>Tel</label><input class="form-control" name='tel' value="<c:out value='${place.tel}'/>" readonly="readonly">
			</div>
			
			<!-- 주소 -->
			<div class="form-group">
			<label>Address</label><input class="form-control" name='address' value="<c:out value='${place.address}'/>" readonly="readonly">
			</div>
			
			<!-- 홈페이지,SNS계정 -->
			<div class="form-group">
			<label>Page</label><input class="form-control" name='page' value="<c:out value='${place.page}'/>" readonly="readonly">
			</div>
			
			<!-- 작성자 -->
			<div class="form-group">
			<label>Writer</label><input class="form-control" name='userid' value="<c:out value='${place.userid}'/>" readonly="readonly">
			</div>

			<%-- <sec:authentication property="principal" var="pinfo"/>
				<sec:authorize access="isAuthenticated()">
					<c:if test="${pinfo.username eq board.writer }">
						<button data-oper='modify' class="btn btn-default">Modify</button>
					</c:if>
				</sec:authorize> --%>
				
			<button data-oper='modify' class="btn btn-default">Modify</button>
			<button data-oper='list' class="btn btn-info">List</button>
			
			<!-- modify로 넘어가면서 가져가게 되는 값 -->
			<form id='openForm' action="/place/modify" method="get">
				<input type="hidden" id='bno' name='bno' value='<c:out value="${place.bno}"/>'>
				<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<input type="hidden" name='type' value='<c:out value="${cri.type}"/>'>
			</form>
			
			</div>
		</div>
	</div>
</div>

<!-- 첨부 사진 -->
<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<style>
.uploadResult {
	width : 100%;
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
	background: rgba9255,255,255,0.5;
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

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Files</div>
			<div class="panel-body">
				<div class="uploadResult">
					<ul>
					
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 리뷰 댓글 등록 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>Reply				
				<%-- <sec:authorize access="isAuthenticated()"> --%>
				<button id="addReplyBtn" class='btn btn-primary btn-xs pull-right'>New Reply</button>
				<%-- </sec:authorize> --%>
			</div>
			
			<!-- 댓글 기본 틀 -->
			<div class="panel-body">
			<ul class="chat">
				<li class="left clearfix" data-rno='12'>
					<div>
						<div class="header">
							<strong class="primary-font">user00</strong>
							<small class="pull-right text-muted">2018-01-01 13:13</small>
						</div>
						<p>Good job!</p>
					</div>
				</li>
			</ul>
		</div>

	<div class="panel-footer">
	
	</div>
</div>
</div>
</div>

<!-- Modal -->
<div class='modal fade' id='myModal' tabindex='-1' role='dialog' 
aria-labelledby='myModalLabel' aria-hidden='true'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY</h4>
			</div>
			<div class='form-group'>
				<label>Reply</label>
				<input class='form-control' name='reply' value='New Reply!'>
			</div>
			<div class='form-group'>
				<label>Replyer</label>
				<input class='form-control' name='replyer' value='replyer'>
			</div>
			<div class='form-group'>
				<label>Reply Date</label>
				<input class='form-control' name='replyDate' value="">
			</div>
		<div class="modal-footer">
			<button type="button" id='modalModBtn' class="btn btn-warning">Modify</button>
			<button type="button" id='modalRemoveBtn' class="btn btn-danger">Remove</button>
			<button type="button" id='modalRegisterBtn' class="btn btn-primary">Register</button>
			<button type="button" id='modalCloseBtn' class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
		</div> <!-- modal-content -->
	</div> <!-- modal-dialog -->
</div> <!-- modal -->

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
	$(document).ready(function () {
		
		var bnoValue = '<c:out value="${place.bno}"/>';
		var replyUL = $(".chat"); //191 댓글 기본 틀
		
		showList(1);
		
		function showList(page){
			console.log("show list : "+page); //1페이지																		
			placeReService.getList({bno:bnoValue, page: page||1}, function(placeReCnt, list){

				console.log("placeReCnt : "+ placeReCnt);
				console.log("list : "+ list);
				
				if(page==-1){
					pageNum = Math.ceil(placeReCnt/10.0);
					showList(pageNum);
					return;
				}
				
				if(list == null || list.lenth == 0){
					replyUL.html("");
					return;
				}
				
				var str="";
				
				for(var i = 0, len = list.length || 0; i<len; i++){
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += "	<div><div class='header'><strong class='primary-font'>["
						+list[i].rno+"]"+list[i].replyer+"</strong>";
					str += "	<small class='pull-right text-muted'>"
					+placeReService.displayTime(list[i].replyDate)+"</small></div>";
					str += "	<p>"+list[i].reply+"</p></div></li>";
				}
				replyUL.html(str);
				showReplyPage(replyCnt);
			});//end function
		}//end showList

		//페이지 목록 번호
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer"); //204줄
		
		function showReplyPage(placeReCnt){
			//끝번호
			var endNum = Math.ceil(pageNum/10.0) * 10;
			var startNum = endNum - 9; //시작번호
			
			var prev = startNum != 1; //이전 페이지목록
			var next = false; //다음 페이지 목록
			
			
			if(endNum * 10 >= placeReCnt){
				endNum = Math.ceil(placeReCnt/10.0);
			}
			
			if(endNum * 10 < placeReCnt){
				next = true; //다음페이지 존재
			}
			
			var str = "<ul class='pagination pull-right'>";
			
			//시작페이지 -1로 이동
			if(prev){
				str += "<li class='page-item'><a class ='page-link' href='"
				+(startNum -1)+"'>Previous</a></li> ";
			}
			
			//페이지 목록 출력, 링크 달기
			for(var i = startNum; i<=endNum; i++){
				var active = pageNum == i ? "active":"";	
				str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			//마지막페이지 +1로 이동
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li> ";
			}
			
			str += "</ul></div>"
			
			console.log(str);
			replyPageFooter.html(str);
		}

		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");

		/* var replyer = null;
		<sec:authorize access="isAuthenticated()">
		replyer = '<sec:authentication property="principal.username" />';
		</sec:authorize>
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}"; */

		//댓글 등록 버튼
		$("#addReplyBtn").on("click",function(e){
			modal.find("input").val("");//input 내부 빈 내용으로 만들기
			//modal.find("input[name='replyer']").val(replyer);
			modalInputReplyDate.closest("div").hide(); //날짜 숨기기
			modal.find("button[id != 'modalCloseBtn']").hide(); //id가 다른 값 숨기기
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});

		//Ajax spring security header...
		/* $(document).ajaxSend(function(e,xhr, options){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		}); */
		
		//모달에 있는 등록 버튼 클릭
		modalRegisterBtn.on("click", function(e){
			var reply = {
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					bno:bnoValue
			}; //댓글 정보
			
			//실질적 댓글 등록
			placeReService.add(reply, function(result){
				alert(result);
			
				modal.find("input").val("");//input 내부 빈 내용으로 만들기
				modal.modal("hide");//모달 숨기기

			showList(-1); //방금 남긴 댓글이 있는 댓글 페이지 목록으로 넘어감	
			});
		});
		
		//댓글 내용 클릭
		$(".chat").on("click","li",function(e){
			var rno = $(this).data("rno");
			console.log(rno);
			 
			//댓글 내용 상세보기
			placeReService.get(rno, function(reply){
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(placeReService.displayTime(reply.replyDate)).attr("readonly","readonly");
				modal.data("rno",reply.rno);
				
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");			
			});
		});
			//댓글 수정
			modalModBtn.on("click", function(e){
				var originalReplyer = modalInputReplyer.val(); 
				
				var reply = {rno:modal.data("rno"), reply:modalInputReply.val(), replyer: originalReplyer};
				
				/* if(!replyer){//미로그인시
					alert("로그인 후 수정이 가능합니다.");
					modal.modal("hide");
					return;
				}
				
				console.log("Original Replyer : "+originalReplyer);
				
				if(replyer != originalReplyer){//로그인한 사람과 작성자가 다를시
					alert("자신이 작성한 댓글만 삭제 가능합니다.");
					modal.modal("hide");
					return;
				} */
				
				placeReService.update(reply,function(result){
					alert(result);
					modal.modal("hide");
					showList(pageNum);
				});
			});

			//Remove
			modalRemoveBtn.on("click", function(e){
				var rno = modal.data("rno");
				
				console.log("RNO : "+rno);
				console.log("REPLYER : "+replyer);
				
				/* if(!replyer){//미로그인시
					alert("로그인 후 삭제가 가능합니다.");
					modal.modal("hide");
					return;
				}
				
				var originalReplyer = modalInputReplyer.val();
				
				console.log("Original Replyer : "+originalReplyer);
				
				if(replyer != originalReplyer){//로그인한 사람과 작성자가 다를시
					alert("자신이 작성한 댓글만 삭제 가능합니다.");
					modal.modal("hide");
					return;
				} */
				
				placeReService.remove(rno,function(result){
					alert(result);
					modal.modal("hide");
					showList(pageNum);
				});
			});

			//댓글 페이지 목록 번호
			replyPageFooter.on("click","li a", function(e) {
				e.preventDefault();//a태그를 클릭해도 페이지 이동이 없도록 하는 부분
				console.log("page click");
				
				var targetPageNum = $(this).attr("href");
				
				console.log("targetPageNum : " + targetPageNum);
				
				pageNum = targetPageNum;
				
				showList(pageNum);
			})
	
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	console.log(placeReService);
});
</script>

<script type="text/javascript">
	$(document).ready(function(){
		
		var openForm = $("#openForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			openForm.attr("action","/place/modify").submit();//get.jsp -> modify.jsp
		});
		
		$("button[data-oper='list']").on("click", function(e){
			openForm.find("#bno").remove(); //bno값만 지우고 나머지 값을 다 가진채로 list로 이동
			openForm.attr("action","/place/list"); //get.jsp->list.jsp
			openForm.submit();
		});
	});
</script>

<script>
$(document).ready(function(){
  
  (function(){
  
    var bno = '<c:out value="${place.bno}"/>';

    $.getJSON("/place/getPhotoList", {bno: bno}, function(arr){ //사진 목록 가져오기
        
       console.log(arr);
       
       var str = "";
       
       $(arr).each(function(i, photo){
       
         //image type
         if(photo.fileType){
           var fileCallPath =  encodeURIComponent( photo.uploadPath+ "/s_"+photo.uuid +"_"+photo.fileName); 
           str += "<li data-path='"+photo.uploadPath+"' data-uuid='"+photo.uuid+"' data-filename='"+photo.fileName+"' data-type='"+photo.fileType+"' ><div>";
           str += "<img src='/display?fileName="+fileCallPath+"'>";
           str += "</div>";
           str +="</li>";
         }else{          
           str += "<li data-path='"+photo.uploadPath+"' data-uuid='"+photo.uuid+"' data-filename='"+photo.fileName+"' data-type='"+photo.fileType+"' ><div>";
           str += "<span> "+ photo.fileName+"</span><br/>";
           str += "<img src='/resources/img/photo.png'></a>";
           str += "</div>";
           str +="</li>";
         }
       });    
       $(".uploadResult ul").html(str);         
     });//end getjson   
  })();//end function
  
  //575
  $(".uploadResult").on("click","li",function(e){
	 console.log("view image");
	 var liObj = $(this);
	 
	 var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
	 
	 if(liObj.data("type")){
		 showImage(path.replace(new RegExp(/\\/g),"/"));
	 } else {
		 //download
		 self.location = "/download?fileName="+path;
	 }
  });
  
  function showImage(fileCallPath){
	  alert(fileCallPath);
	  $(".bigPictureWrapper").css("display","flex").show();
	  
	  $(".bigPicture")
	  .html("<img src = '/display?fileName="+fileCallPath+"'>")
	  .animate({width:'100%', height:'100%'},1000);
  }
  
  $(".bigPictureWrapper").on("click",function(e){
	  $(".bigPicture").animate({width:'0%', height:'0%'},1000); //1초에 걸쳐서 켜짐
	  setTimeout(function(){
		  $(".bigPictureWrapper").hide();},1000); //1초 동안 사라지게
  });
});
</script>

<%@ include file="../includes/footer.jsp" %>