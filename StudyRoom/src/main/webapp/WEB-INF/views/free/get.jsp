<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Free List Page
				<button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Free</button>
			</div>
				<div class="panel-body">
					<div class="form-group">
					<label>Fno</label> <input class="form-control" name="fno" value='<c:out value="${free.fno }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title" value='<c:out value="${free.title }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${free.content }"/></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer" value='<c:out value="${free.writer }"/>' readonly="readonly">
					</div>
					<!-- 로그인 사용자만 수정/삭제 가능 -->
					<sec:authentication property="principal" var="pinfo"/>
					<sec:authorize access="isAuthenticated()">
					<c:if test="${pinfo.username eq free.writer }">
					<button data-oper="modify" class="btn btn-default">Modify</button>
					</c:if>
					</sec:authorize>
					<button data-oper="list" class="btn btn-info">List</button>
					<form id="operForm" action="/free/modify" method="get">
						<input type="hidden" id="fno" name="fno" value='<c:out value="${free.fno }"/>'>
						<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
						<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
						<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
						<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
					</form>
			</div>
		</div>
	</div>
</div>

<div class='row'>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"> 
					<i class="fa fa-comments fa-fw"></i> Reply 
					<sec:authorize access="isAuthenticated()">	<!-- 조회 화면에서 댓글 추가버튼 -->
					<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
					</sec:authorize>
			</div> 
			
			<div class="panel-body">
				<ul class="chat">
				
					<li class="left clearfix" data-rno="12">
					<div>
						<div class="header">
						</div>
					</div>
					</li>
				</ul>
			</div>
			<!-- p.439 댓글 페이지 번호를 출력-->
			<div class="panel-footer"></div>
		</div>
	</div>
</div>
<!--  Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label>
					<input class="form-control" name="reply" value="New Reply!!!!">
				</div>
				<div class="form-group">
					<label>Replyer</label>
					<input class="form-control" name="replyer" value="replyer">
				</div>
				<div class="form-group">
					<label>Reply Date</label>
					<input class="form-control" name="replyDate" value="">
				</div>
			</div>
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
				<button id="modalRegisterBtn" type="button" class="btn btn-default">Register</button>
				<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">

//댓글 목록 가져오기
$(document).ready(function(){
  	var fnoValue = '<c:out value="${free.fno}"/>';
  	var replyUL = $(".chat");	// . : class , # : id

   	showList(1);
  	
   	function showList(page) {
   		
   		console.log("show list " +page);
		
		FreeReplyService.getList({fno:fnoValue,page: page||1}, function(replyCnt, list) {
			
			console.log("replyCnt : "+replyCnt);
			console.log("list : "+list);
			
			if(page == -1){	//마지막 페이지를 찾아서 다시 호출
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			var str = "";
			if(list == null || list.length==0){
				return;
			}
			for (var i = 0, len = list.length || 0; i<len; i++) {
				str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str += " <div><div class='header'><strong class='primary-font'>["+list[i].rno+"] "+list[i].replyer+"</strong>";
				str += " <small class='pull-right text-muted'>"+FreeReplyService.displayTime(list[i].replyDate)+"</small></div>";
				str += " <p>"+list[i].reply+"</p></div></li>";
			}
			replyUL.html(str);
			showReplyPage(replyCnt);	
		});//end function
	}//end showList


	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt){
		var endNum = Math.ceil(pageNum / 10.0) *10;
		var startNum = endNum-9;
		var prev = startNum != 1;
		var next = false;
		if(endNum *10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		if(endNum *10 < replyCnt){
			next = true;
		}
		var str = "<ul class='pagination pull-right'>";
		
		if(prev){
			str +="<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
		
		for(var i=startNum; i <=endNum; i++){
			var active = pageNum == i? "active":"";
			str +="<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next){
			str +="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
		}
		
		str += "</ul></div>";
		console.log(str);
		replyPageFooter.html(str);
	}
	
	//modal function
	var modal =$(".modal");
  	var modalInputReply = modal.find("input[name='reply']");
  	var modalInputReplyer = modal.find("input[name='replyer']");
  	var modalInputReplyDate = modal.find("input[name='replyDate']");
  	
  	var modalModBtn = $("#modalModBtn");
  	var modalRemoveBtn = $("#modalRemoveBtn");
  	var modalRegisterBtn = $("#modalRegisterBtn");
  	
  	$("#addReplyBtn").on("click",function(e){
  		modal.find("input").val("");
  		modalInputReplyDate.closest("div").hide();
  		modal.find("button[id !='modalCloseBtn']").hide();
  		
  		modalRegisterBtn.show();
  		$(".modal").modal("show");
  	});
  	
	//댓글 등록
  	modalRegisterBtn.on("click",function(e){
  			var reply = {
  					reply : modalInputReply.val(),
  					replyer : modalInputReplyer.val(),
  					fno:fnoValue
  			};
  			FreeReplyService.add(reply, function(result){
  				alert(result);
  				modal.find("input").val("");
  				modal.modal("hide");
  				
  				showList(-1);
  			});
	}); 
  	 
  	//댓글 조회 처리
  	  $(".chat").on("click","li",function(e){
  		 var rno = $(this).data("rno");
  		 FreeReplyService.get(rno, function(reply){
  			 modalInputReply.val(reply.reply);
  			 modalInputReplyer.val(reply.replyer);
  			 modalInputReplyDate.val(FreeReplyService.displayTime( reply.replyDate)).attr("readonly","readonly");
  			 modal.data("rno", reply.rno);
  			 
  			 modal.find("button[id !='modalCloseBtn']").hide();
  			 modalModBtn.show();
  			 modalRemoveBtn.show();
  			 
  			 $(".modal").modal("show");
  		 });
  	  });
  	
  	// 페이지 번호 클릭시 새댓글 가져오기
  	replyPageFooter.on("click","li a", function(e){
  		e.preventDefault();
  		console.log("page click");
  		
  		var targetPageNum = $(this).attr("href");
  		console.log("targetPageNum: "+targetPageNum);
  		
  		pageNum = targetPageNum;
  		showList(pageNum);
  	});
  	
  	//댓글 수정
  	modalModBtn.on("click", function(e){
  		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
  		
  		FreeReplyService.update(reply, function(result){
  			 alert(result);
  			 modal.modal("hide");
  			 showList(pageNum);
  		});
  	});
  	
  	// 댓글 삭제
  	modalRemoveBtn.on("click", function(e){
  		var rno = modal.data("rno");
  		FreeReplyService.remove(rno, function(result){
  			alert(result);
  			modal.modal("hide");
  			showList(pageNum);
  		});
  	});
  	
  });
  
</script>

<script type="text/javascript">
//modify 클릭시 수정창으로 이동, list클릭시 메인으로 이동
 $(document).ready(function(){
	var operForm = $("#operForm");
	$("button[data-oper='modify']").on("click",function(e){
		operForm.attr("action","/free/modify").submit();
	});
	
	$("button[data-oper='list']").on("click",function(e){
		operForm.find("#fno").remove();
		operForm.attr("action","/free/list")
		operForm.submit();
	});
 });
</script>
<%@ include file="../includes/footer.jsp" %>