<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">자유게시판</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">자유게시판</div>
				<div class="panel-body">
					<div class="form-group">
					<label>번호</label> <input class="form-control" name="fno" value='<c:out value="${free.fno }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="title" value='<c:out value="${free.title }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${free.content }"/></textarea>
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="writer" value='<c:out value="${free.writer }"/>' readonly="readonly">
					</div>
					<!-- 로그인 사용자만 수정/삭제 가능 -->
					<sec:authentication property="principal" var="pinfo"/>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER','ROLE_USER')">
					<c:if test="${pinfo.username eq free.writer or pinfo.authorities eq '[ROLE_ADMIN]' }">
					<button data-oper="modify" class="btn btn-default">수정</button>
					</c:if>
					</sec:authorize>
					<button data-oper="list" class="btn btn-info">목록</button>
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
					<i class="fa fa-comments fa-fw"></i> 댓글
					<sec:authentication property="principal" var="pinfo"/> 	<!-- 조회 화면에서 댓글 추가버튼 -->
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER','ROLE_USER')">
					<c:if test="${pinfo.username eq free.writer or pinfo.authorities eq '[ROLE_ADMIN]' }"> 
					<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">새 댓글 작성</button>
					</c:if>
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
				<h4 class="modal-title" id="myModalLabel">댓글 작성</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>댓글 내용</label>
					<input class="form-control" name="reply" value="" onkeyup="chkword(this, 4000)">
				</div>
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="replyer" value="" readonly>
				</div>
				<div class="form-group">
					<label>작성일</label>
					<input class="form-control" name="replyDate" value="">
				</div>
			</div>
			<div class="modal-footer">
				<sec:authentication property="principal" var="pinfo"/> 	<!-- 조회 화면에서 댓글 추가버튼 -->
				<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER','ROLE_USER')">
				<c:if test="${pinfo.username eq free.writer or pinfo.authorities eq '[ROLE_ADMIN]' }"> 
				<button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
				<button id="modalRegisterBtn" type="button" class="btn btn-default">등록</button>
				</c:if>
				</sec:authorize>
				<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">취소</button>
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
  	
  	//로그인 사용자가 댓글 등록시 작성자가 됨
  	var replyer = null;
  	var ROLE_ADMIN = null;
  	<sec:authorize access="isAuthenticated()">
  	replyer ='<sec:authentication property="principal.username"/>';
  	ROLE_ADMIN = '<sec:authentication property="principal.authorities"/>';
  	</sec:authorize>
  	
  	
  	$("#addReplyBtn").on("click",function(e){
  		modal.find("input").val("");
  		modal.find("input[name='replyer']").val(replyer);	//모달창에 고정
  		modalInputReplyDate.closest("div").hide();
  		modal.find("button[id !='modalCloseBtn']").hide();
  		
  		modalRegisterBtn.show();
  		$(".modal").modal("show");
  	});
  	
  	
  	var csrfHeaderName ="${_csrf.headerName}";
  	var csrfTokenValue="${_csrf.token}";
  	//Ajax spring security header	== ajax 를 이용한 csrf 토큰 전송
  	$(document).ajaxSend(function(e, xhr, options){
  		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
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
  			 modalInputReplyer.val(reply.replyer).attr("readonly","readonly");
  			 modalInputReplyDate.val(FreeReplyService.displayTime(reply.replyDate)).attr("readonly","readonly");
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
  		var originalReplyer = modalInputReplyer.val();
  		var reply = {rno:modal.data("rno"), reply: modalInputReply.val(), replyer: originalReplyer};
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
  		FreeReplyService.update(reply, function(result){
  			 alert(result);
  			 modal.modal("hide");
  			 showList(pageNum);
  		});
  	});
  	
  	// 댓글 삭제
  	modalRemoveBtn.on("click", function(e){
  		var rno = modal.data("rno");
  		console.log("rno :"+rno);
  		console.log("replyer: "+replyer);
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


  		FreeReplyService.remove(rno, originalReplyer, function(result){
  			alert(result);
  			modal.modal("hide");
  			showList(pageNum);
  		});

  	});
  	
  });
  
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