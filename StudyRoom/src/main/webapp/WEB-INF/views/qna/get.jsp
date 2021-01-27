<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
			<!-- 로그인 사용자만 수정/삭제 가능 -->
			<sec:authentication property="principal" var="pinfo"/>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER','ROLE_USER')">
			<c:if test="${pinfo.username eq qna.writer or pinfo.authorities eq '[ROLE_ADMIN]' }">
			<button data-oper='modify' class="btn bnt-default" onclick="location.href='/qna/modify?questionNo=<c:out value="${qna.questionNo }"/>'">수정</button>
			</c:if>
			</sec:authorize>
			<button data-oper='list' class="btn bnt-default" onclick="location.href='/qna/list'">목록</button>
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
							<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
							<button id="addReplyBtn" class='btn btn-primary btn-xs pull-right'>Q&A 답변달기</button>
							</sec:authorize>
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
						<h4 class="modal-title" id="myModalLabel">답변</h4>
					</div>
					
					<div class="modal-body">
						<div class="form-group">
						<label>답변 내용</label>
						<input class="form-control" name='reply' value='New Reply!!!!' onkeyup="chkword(this, 4000)">
						</div>
						<div class="form-group">
						<label>답변 작성자</label>
						<input class="form-control" name='replyer' value='replyer' readonly="readonly">
						</div>
						<div class="form-group">
						<label>답변 작성일</label>
						<input class="form-control" name='replyDate' value=''>
						</div>
					</div>
				<div class="modal-footer">
				<sec:authentication property="principal" var="pinfo"/> 	<!-- 조회 화면에서 댓글 추가버튼 -->
				<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER','ROLE_USER')">
				<c:if test="${pinfo.username eq qna.writer or pinfo.authorities eq '[ROLE_ADMIN]' or pinfo.authorities eq '[ROLE_MANAGER]' }"> 
					<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
						</c:if>
				</sec:authorize>
					<button id='modalRegisterBtn' type="button" class="btn btn-success" data-dismiss='modal'>등록</button>
				
					<button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss='modal'>닫기</button>
				</div>
				
				</div>
<!-- 				/.modal-content -->
			</div>
<!-- 			/.modal-dialog -->
		</div>
<!-- 		/.modal -->


<%@ include file="../includes/footer.jsp"%> 

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
	
	var replyer = null;
  	var ROLE_ADMIN = null;
  	<sec:authorize access="isAuthenticated()">
  	replyer ='<sec:authentication property="principal.username"/>';
  	ROLE_ADMIN = '<sec:authentication property="principal.authorities"/>';
  	</sec:authorize>
  	var csrfHeaderName ="${_csrf.headerName}";
  	var csrfTokenValue="${_csrf.token}";
	
	
	
	$("#addReplyBtn").on("click", function(e) {
		modal.find("input").val("");
		modal.find("input[name='replyer']").val(replyer);	//모달창에 고정
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		
		$(".modal").modal("show");
	});
	
 	//Ajax spring security header	== ajax 를 이용한 csrf 토큰 전송
  	$(document).ajaxSend(function(e, xhr, options){
  		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
  	});
	
	//댓글 등록 및 목록 갱신
	modalRegisterBtn.on("click",function(e){
		var reply = {
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				questionNo: questionNoValue
		};
		QaReplyService.add(reply, function(result){
			alert("등록완료");
			
			modal.find("input").val("");
			$(".modal").modal("hide");
			
			//showList(1) //수정 후 댓글목록 갱신
			showList(-1) // page번호가 -1로 전달되면 마지막페이지를 다시 찾아서 호출 >> 전체댓글 숫자 파악 >> 마지막페이지 호출
		});
	});
	
	//댓글 조회 처리
	$(".chat").on("click", "li", function(e){
		var rno = $(this).data("rno");
		QaReplyService.get(rno, function(reply){
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer).attr("readonly","readonly");
			modalInputReplyDate.val(QaReplyService.displayTime(reply.replyDate)).attr("readonly","readonly");
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
		var originalReplyer = modalInputReplyer.val();
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val(),replyer: originalReplyer};
		if(!replyer){
  			alert("로그인하세요.");
  			modal.modal("hide");
  			return;
  		}
  		console.log("Original Replyer : "+originalReplyer);
  		
  		if(ROLE_ADMIN != '&#91;ROLE&#95;ADMIN&#93;'){
	  		if(replyer != originalReplyer){
	  			alert("자신의 글이 아닙니다.수정불가");
	  			modal.modal("hide");
	  			return;
	  			}
  		}
		QaReplyService.update(reply, function(result){
			alert("수정완료");
			$(".modal").modal("hide");
			showList(pageNum);
		});	
	});
	
	
	//댓글 삭제
	modalRemoveBtn.on("click", function(e){
			console.log("클릭접근")
		var rno = modal.data("rno");
			// 여기 보면 , function 자리가 콜백인데
			if(!replyer){
	  			alert("로그인하세요.");
	  			modal.modal("hide");
	  			return;
	  		}
	  		var originalReplyer = modalInputReplyer.val();
	  
	  		console.log("Original Replyer :" +originalReplyer);	//원래 댓글 작성자
	  		if(ROLE_ADMIN != '&#91;ROLE&#95;ADMIN&#93;'){
	  		if(replyer != originalReplyer){
	  			alert("자신의 글이 아닙니다. 삭제 불가!");
	  			modal.modal("hide");
	  			return;
	  		}
	  		}
			
		QaReplyService.remove(rno, originalReplyer, function(result){
			
			console.log("결과접근")
			alert("삭제완료");
			$(".modal").modal("hide");
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
	
	<script>
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
