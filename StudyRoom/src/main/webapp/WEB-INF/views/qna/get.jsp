<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Q&A</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Q&A</div>
<!-- 			Q&A 상세보기 -->
<!-- 화면에 보이는 부분 -->
			<div class="form-group">
				<label>제목</label><input class="form-control" name='title' value='<c:out value="${qna.title }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>작성자</label><input class="form-control" name='writer' value='<c:out value="${qna.writer }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>내용</label><textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${qna.content }"/></textarea>
			</div>
			<button data-oper='modify' class="btn bnt-default" onclick="location.href='/qna/modify?questionNo=<c:out value="${qna.questionNo }"/>'">Modify</button>
			<button data-oper='list' class="btn bnt-default" onclick="location.href='/qna/list'">List</button>
			<form action="/qna/modify" id="operForm" method="get">
				<input type="hidden" id="questionNo" name="questionNo" value='<c:out value="${qna.questionNo }"/>'>
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
			</form>
		</div>
	</div>
</div>

<!-- 댓글창 -->
<div class='row'>

<div class="col-lg-12">
	<!-- /.pannel -->
	<div class="panel panel-default">		
					
<!-- 						<div class="panel-heading"> -->
<!-- 							<i class="fa fa-comments fa-fw"></i> Reply -->
<!-- 						</div> -->

						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> Q&A 답변
							<button id="addReplyBtn" class='btn btn-primary btn-xs pull-right'>Q&A 답변달기</button>
						</div>
						
						<div class="panel-body">
						<ul class="chat">
							<li class="left clearfix" data-rno='12'>
							<div>
								<div class="header">
									
								</div>
							</div>
							</li>
							<!-- end reply -->
						</ul>
						<!-- ./ end ul -->
						</div>
						<!-- /.panel .chat-panel 439p-->
						<div class="panel-footer">
						
						</div>
						<!-- ./end panel-default -->
					</div>
					<!-- ./end col-lg-12 -->
				</div>
				<!-- ./end row -->
			</div>
			

<!-- Modal -->
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
						<input class="form-control" name='reply' value='New Reply!!!!'>
						</div>
						<div class="form-group">
						<label>Replyer</label>
						<input class="form-control" name='replyer' value='replyer'>
						</div>
						<div class="form-group">
						<label>Reply Date</label>
						<input class="form-control" name='replyDate' value=''>
						</div>
					</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-success" data-dismiss='modal'>Register</button>
					<button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss='modal'>Close</button>
				</div>
				
				</div>
<!-- 				/.modal-content -->
			</div>
<!-- 			/.modal-dialog -->
		</div>
<!-- 		/.modal -->


			<script type="text/javascript" src="/resources/js/reply.js"></script>
			<script type="text/javascript">
			console.log("=================");
			console.log("JS TEST");
			
			var questionNoValue = '<c:out value= "${qna.questionNo}"/>';
			var replyUL = $(".chat");
			
			showList(1);
			
			function showList(page){
				console.log("show list " + page);
				QaReplyService.getList({questionNo:questionNoValue,page: page|| 1}, function(replyCnt, list){
					
					console.log("replyCnt: " + replyCnt);
					console.log("list: " + list);
					console.log(list);
					
					if(page == -1){//마지막 페이지를 찾아서 다시 호출
						pageNum = Math.ceil(replyCnt / 10.0);
						showList(pageNum);
						return;
					}
					
					var str = "";
					if(list == null || list.length == 0){
						replyUL.html("");
						
						return;
					}
					for (var i = 0, len = list.length || 0; i < len; i++){
						str +="<li class= 'left clearfix' data-rno='"+list[i].rno+"'>";
						str +=" <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
						str +=" <small class='pull-right text-muted'>"+QaReplyService.displayTime(list[i].replyDate)+"</small></div>";
						str +=" <p>"+list[i].reply+"</p></div></li>";
					}
					replyUL.html(str);
					
					showReplyPage(replyCnt);
				});//end function
			}//end show List
			
			//440
			var pageNum = 1;
			var replyPageFooter = $(".panel-footer");
			
			function showReplyPage(replyCnt) {


				var endNum = Math.ceil(pageNum / 10.0) * 10;
				var startNum = endNum - 9;
				
				var prev = startNum != 1;
				var next = false;
				
				if (endNum * 10 >= replyCnt) {
					endNum = Math.ceil(replyCnt/10.0);
				}

				if (endNum * 10 < replyCnt) {
					next = true;
				}
				
				var str = "<ul class='pagination pull-right'>";
				
				if(prev){
					str += "<li class='page-item'><a class ='page-link' href='"+(startNum -1)+"'>Previous</a></li> ";
				}
				
				for(var i = startNum ; i <= endNum; i++) {
					var active = pageNum == i? "active":"";
					str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
				}
				
				if(next){
					str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li> ";
				}
				str += "</ul></div>";
				
				console.log(str);
				
				replyPageFooter.html(str);
				
			}
			
			//modal function
			var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#addReplyBtn").on("click", function(e) {
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		
		$(".modal").modal("show");
	});
	//댓글 등록 및 목록 갱신
	modalRegisterBtn.on("click",function(e){
		var reply = {
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				questionNo: questionNoValue
		};
		QaReplyService.add(reply, function(result){
			alert(result);
			
			modal.find("input").val("");
			modal.modal("hide");
			
			//showList(1) //수정 후 댓글목록 갱신
			showList(-1) // page번호가 -1로 전달되면 마지막페이지를 다시 찾아서 호출 >> 전체댓글 숫자 파악 >> 마지막페이지 호출
		});
	});
	
	//댓글 조회 처리
	$(".chat").on("click", "li", function(e){
		var rno = $(this).data("rno");
		QaReplyService.get(rno, function(reply){
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(QaReplyService.displayTime(reply.replyDate)).attr("readonly","readeonly");
			modal.data("rno", reply.rno);
			
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
		console.log(rno);
	});
	
	//댓글 수정
	modalModBtn.on("click", function(e){
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		QaReplyService.update(reply, function(result){
			
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});	
	});
	
	
	//댓글 삭제
	modalRemoveBtn.on("click", function(e){
		var rno = modal.data("rno");
		QaReplyService.remove(rno, function(result){
			
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	
	//댓글 페이징처리
	replyPageFooter.on("click","li a", function(e){
		e.preventDefault();
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum: " + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
	});
	</script>

<script type="text/javascript">
$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper = 'modify']").on("click",function(e){
		operForm.attr("action","/qna/modify").submit();
	});
	$("button[data-oper = 'list']").on("click",function(e){
		operForm.find("questionNo").remove();
		operForm.attr("action","/qna/list")
		operForm.submit();
	});
	
});
</script>

<%@ include file="../includes/footer.jsp"%>