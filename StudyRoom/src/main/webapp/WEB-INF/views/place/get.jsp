<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header"><c:out value="[ ${place.title } ]"></c:out></h1>
	</div>
</div>

<!-- 첨부 사진 -->
<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<!-- 첨부 사진 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">첨부파일 <span id='photo'>(사진 클릭시 확대 가능)</span></div>
			<div class="panel-body">
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
			<div class="panel-heading">장소 상세보기</div> <!-- list.jsp에서 넘어옴 -->
			<div class="panel-body">
			
			<!-- 점수 -->
			<div class="form-group">
			<label>평점</label><br>
			<c:set var="score" value="${score}"/>
			
 			<c:if test = "${fn:contains(score, '0')}">
        	<input type='image' src="/resources/img/score/0star.png">
      		</c:if>
      		<c:if test = "${fn:contains(score, '1')}">
        	<input type='image' src="/resources/img/score/1star.png">
      		</c:if>
      		<c:if test = "${fn:contains(score, '2')}">
        	<input type='image' src="/resources/img/score/2star.png">
      		</c:if>
      		<c:if test = "${fn:contains(score, '3')}">
        	<input type='image' src="/resources/img/score/3star.png">
      		</c:if>
      		<c:if test = "${fn:contains(score, '4')}">
        	<input type='image' src="/resources/img/score/4star.png">
      		</c:if>
      		<c:if test = "${fn:contains(score, '5')}">
        	<input type='image' src="/resources/img/score/5star.png">
      		</c:if>
			</div>
			
			<!-- 글 번호 -->
			<div class="form-group">
			<label>번호</label><input class="form-control" name='bno' value="<c:out value='${place.bno}'/>" readonly="readonly">
			</div>
			
			<!-- 상호명 -->
			<div class="form-group">
			<label>상호명</label><input class="form-control" name='title' value="<c:out value='${place.title}'/>" readonly="readonly">
			</div>
			
			<!-- 기본 구비품 -->
			<div class="form-group">
			<label>기본 구비품</label><br>

			<c:set var="offer" value="${place.offer }"/>
			
 			<c:if test = "${fn:contains(offer, '공기청정기')}">
        	<input type='image' src="/resources/img/offer/air.png"> <b>공기청정기  </b>
      		</c:if>
			<c:if test = "${fn:contains(offer, '개인 사물함')}">
			<input type='image' src="/resources/img/offer/locker.png"> <b>개인 사물함  </b>
			</c:if>
			<c:if test = "${fn:contains(offer, '냉난방기')}">
			<input type='image' src="/resources/img/offer/air-conditioner.png"> <b>냉난방기  </b>
			</c:if>
			<c:if test = "${fn:contains(offer, '개인 콘센트')}">
			<input type='image' src="/resources/img/offer/plug.png"> <b>개인 콘센트  </b>
			</c:if>
			<c:if test = "${fn:contains(offer, '취식공간')}">
			<input type='image' src="/resources/img/offer/lunchbox.png"> <b>취식공간  </b>
			</c:if>
			<c:if test = "${fn:contains(offer, '안마의자')}">
			<input type='image' src="/resources/img/offer/massage-chair.png"> <b>안마의자  </b>
			</c:if>
			<c:if test = "${fn:contains(offer, '엘레베이터')}">
			<input type='image' src="/resources/img/offer/elevator.png"> <b>엘레베이터  </b>
			</c:if>			
			<c:if test = "${fn:contains(offer, '와이파이')}">
			<input type='image' src="/resources/img/offer/wifi.png"> <b>와이파이  </b>
			</c:if>			
			<c:if test = "${fn:contains(offer, '없음')}">
			<input type='image' src="/resources/img/offer/x.png"> <b>제공품 없음  </b>
			</c:if>			
			</div>

			<!-- 추가적인 제공품 -->
			<div class="form-group">
			<label>추가 제공품</label><br>
			<div id="extra"></div>
			<script>		
			var extra = '<c:out value="${place.extra}"/>';
			console.log(extra);
			var extras = extra.split(',');
			console.log(extras);		
			var extraList = "";
			extraList += "<ul>"
			for(var i = 0; i<extras.length; i++){
				extraList += "<li>"+extras[i]+"</li>";
			}
			extraList += "</ul>"
			$("#extra").html(extraList);
			</script>

			</div>
			
			<!-- 내용 -->
			<div class="form-group">
			<label>내용</label><textarea rows="3" class="form-control" name='content' readonly="readonly"><c:out value="${place.content}"/></textarea>
			</div>
			
			<!-- 운영시간 -->
			<div class="form-group">
			<label>운영시간</label><input class="form-control" name='time' value="<c:out value='${place.time}'/>" readonly="readonly">
			</div>
			
			<!-- 청소시간 -->
			<div class="form-group">
			<label>청소시간</label><input class="form-control" name='clean' value="<c:out value='${place.clean}'/>" readonly="readonly">
			</div>
			
			<!-- 연락처 -->
			<div class="form-group">
			<label>연락처</label><input class="form-control" name='tel' value="<c:out value='${place.tel}'/>" readonly="readonly">
			</div>
			
			<!-- 주소 -->
			<div class="form-group">
			<label>주소</label><input class="form-control" name='address' value="<c:out value='${place.address}'/>" readonly="readonly">
			<div><a href="https://map.kakao.com/link/search/${place.address }" target="_blank">지도로 알아보기(Click)</a></div>
			<div id="map" style="width:100%;height:400px;"></div>
			<div style="text-align: center;"><br>
			<button id="mapbtn" onclick="setZoomable(false)">지도 확대/축소 끄기</button>
			<button id="mapbtn" onclick="setZoomable(true)">지도 확대/축소 켜기</button>
			</div>
			</div>
			
			<!-- 홈페이지,SNS계정 -->
			<div class="form-group">
			<label>홈페이지/SNS계정</label><div><a href="${place.page }" target="_blank">${place.page }</a></div>
			</div>
			
			<!-- 작성자 -->
			<div class="form-group">
			<label>작성자</label><input class="form-control" name='userid' value="<c:out value='${place.writer}'/>" readonly="readonly">
			</div>

			<sec:authentication property="principal" var="pinfo"/>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
					<c:if test="${pinfo.username eq place.writer or pinfo.authorities eq '[ROLE_ADMIN]' }">
						<button data-oper='modify' class="btn btn-default">수정</button>
					</c:if>
				</sec:authorize>
				
			<button data-oper='list' class="btn btn-info">목록</button>
			
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

<style>
#mapbtn {
	background: salmon;
	border: none;
}
#mapbtn:hover {
  background: lightsalmon;
}
.uploadResult {
	width : 100%;
	background-color: white;
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
	background-color: #ffffff;
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
#photo {
	background-color: pink;
}
.warn{
	color: salmon;
}
</style>

<!-- 리뷰 댓글 등록 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>리뷰 댓글				
				<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
				<button id="addReplyBtn" class='btn btn-primary btn-xs pull-right'>새로운 리뷰</button>
				</sec:authorize>
			</div>
			
			<!-- 댓글 기본 틀 -->
			<div class="panel-body">
			<ul class="chat">
				<li class="left clearfix" data-rno='12'>
					<div>
						<div class="header">

						</div>

					</div>
				</li>
			</ul>
		</div>

<!-- 댓글 페이지 목록 -->
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
				<h4 class="modal-title" id="myModalLabel">리뷰</h4>
			</div>
			
			<div class='form-group'>
				<label>점수</label><br>
				<select id="score">
				<option value="5" selected="selected">5점(매우 만족)</option>
				<option value="4">4점(만족)</option>
				<option value="3">3점(보통)</option>
				<option value="2">2점(불만족)</option>
				<option value="1">1점(매우 만족)</option>
				</select>
			</div>
			
			<div class='form-group'>
				<label>내용<span class="warn">(150자 이상 입력해야 등록가능)</span></label>
				<textarea rows="5" cols="4" class='form-control' id="content" name='reply' maxlength="1000" value='New Reply!'></textarea>
				 <span class='pull-right' id="counter">###</span>
			</div>
			<div class='form-group'>
				<label>작성자<span class="warn">(하루 1인 1회 리뷰 제한)</span></label>
				<input class='form-control' name='replyer' value='replyer' readonly="readonly">
			</div>
			<div class='form-group'>
				<label>작성일</label>
				<input class='form-control' name='replyDate' value="">
			</div>
		<div class="modal-footer">


			<button type="button" id='modalModBtn' class="btn btn-warning">수정</button>
			<button type="button" id='modalRemoveBtn' class="btn btn-danger">삭제</button>

			<button type="button" id='modalRegisterBtn' class="btn btn-primary">등록</button>
			<button type="button" id='modalCloseBtn' class="btn btn-default" data-dismiss="modal">닫기</button>
		</div>
		</div> <!-- modal-content -->
	</div> <!-- modal-dialog -->
</div> <!-- modal -->

<%@ include file="../includes/footer.jsp" %>
<script type="text/javascript" src="/resources/js/reply.js"></script>

<!-- 지도 API -->
 <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63fb6aced8c696fa4afe90f914194f7a&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee625889bb79159eb35ac638afa725f1&libraries=services,clusterer,drawing"></script>
    <script>    
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center : new daum.maps.LatLng(36.633535, 127.425882), // 지도의 중심좌표
            level : 4// 지도의 확대 레벨
        };
 
        // 지도를 생성합니다    
        var map = new daum.maps.Map(mapContainer, mapOption);
        
    	 // 버튼 클릭에 따라 지도 확대, 축소 기능을 막거나 풀고 싶은 경우에는 map.setZoomable 함수를 사용합니다
        function setZoomable(zoomable) {
            // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
            map.setZoomable(zoomable);    
        }
     
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new daum.maps.services.Geocoder();
 		var address = '<c:out value="${place.address}"/>';
        var myAddress = [address];
 		console.log("address : "+myAddress);
        function myMarker(number, address) {
            // 주소로 좌표를 검색합니다
            geocoder
                    .addressSearch(
                            //'주소',
                            address,
                            function(result, status) {
                                // 정상적으로 검색이 완료됐으면 
                                if (status === daum.maps.services.Status.OK) {
 
                                    var coords = new daum.maps.LatLng(
                                            result[0].y, result[0].x);
 
                                    // 결과값으로 받은 위치를 마커로 표시합니다   
                                    var marker = new daum.maps.Marker({
                                        map : map,
                                        position : coords
                                    });

                                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                    map.setCenter(coords);
                                }
                            });
        }
 
        for (i = 0; i < myAddress.length; i++) {
            myMarker(i + 1, myAddress[i]);
        }
    </script>
    <script>
    //reply 글자수 세기
    $(function() {
        $('#content').keyup(function (e){
            var content = $(this).val();
            $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
            	 $('#counter').css("background-color","rgba(255,0,0,0.5)");
            	 $('#counter').html('글자수 : ' + content.length + '/1000');
        });
        $('#content').keyup();
  });
    </script>
<script>
	$(document).ready(function () {
		
		var bnoValue = '<c:out value="${place.bno}"/>';
		var placeReCnt = ${place.placeReCnt};
		var replyUL = $(".chat"); //191 댓글 기본 틀
		
		showList(1);
		
		function showList(page){
			console.log("show list : "+page); //1페이지	
			//page가 null 이거나 undefined면 1
			placeReService.getList({bno:bnoValue, page: page||1}, function(replyCnt, list){

				console.log("placeReCnt : "+ placeReCnt);
				console.log("list : ", list);
				
				//댓글 단 페이지로 이동
				if(page==-1){
					pageNum = Math.ceil(placeReCnt/10.0);
					showList(pageNum);
					return;
				}
				
				if(list == null || list.length == 0){
					replyUL.html("");
					return;
				}
				
				var str="";
				//댓글
				for(var i = 0, len = list.length || 0; i<len; i++){
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += " <div><div>";
					//댓글 점수별 별점 이미지 출력
					if(list[i].score=="1"){
						str += "<input type='image' src='/resources/img/red/1red.png'>"
					}else if(list[i].score=="2"){
						str += "<input type='image' src='/resources/img/red/2red.png'>"
					}else if(list[i].score=="3"){
						str += "<input type='image' src='/resources/img/red/3red.png'>"		
					}else if(list[i].score=="4"){
						str += "<input type='image' src='/resources/img/red/4red.png'>"		
					}else if(list[i].score=="5"){
						str += "<input type='image' src='/resources/img/red/5red.png'>"
					}	
					str += "</div><div class='header'><strong class='primary-font'>["+list[i].rno+"] "+list[i].replyer+"</strong>";
					str += " <small class='pull-right text-muted'>"+placeReService.displayTime(list[i].replydate)+"</small></div>";
					str += " <p>"+list[i].reply+"</p></div></li>";
				}
				replyUL.html(str);
				showReplyPage(placeReCnt);
			});//end function
		}//end showList

		//페이지 목록 번호
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer"); //204줄
		
		function showReplyPage(placeReCnt){
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= placeReCnt){
				endNum = Math.ceil(placeReCnt/10.0);
			}
			
			if(endNum * 10 < placeReCnt){
				next = true;
			}
			
			var str = "<ul class='pagination pull-right'>";
			
			if(prev){
				str += "<li class='page-item'><a class ='page-link' href='"+(startNum -1)+"'>Previous</a></li> ";
			}
			
			for(var i = startNum; i<=endNum; i++){
				var active = pageNum == i ? "active":"";				
				str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li> ";
			}
			
			str += "</ul></div>"
			
			console.log(str);
			replyPageFooter.html(str);
		}

		var modal = $(".modal");
		var modalInputScore = modal.find("select[id='score']");
		var modalInputReply = modal.find("textarea[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");

		var replyer = null;
		var ROLE_ADMIN = null; 
		<sec:authorize access="isAuthenticated()">
		replyer = '<sec:authentication property="principal.username" />';
		ROLE_ADMIN = '<sec:authentication property="principal.authorities"/>';
		</sec:authorize>
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";

		//댓글 등록 버튼
		$("#addReplyBtn").on("click",function(e){
			alert("<주의사항>\n1. 150자 이상 입력시 등록이 가능합니다.\n2. 리뷰는 하루 1인 1회로 제한됩니다.")
			modal.find("input").val("");//input 내부 빈 내용으로 만들기
			modal.find("input[name='replyer']").val(replyer);
			modalInputReplyDate.closest("div").hide(); //날짜 숨기기
			modal.find("button[id != 'modalCloseBtn']").hide(); //id가 다른 값 숨기기
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});

		//Ajax spring security header...
		$(document).ajaxSend(function(e,xhr, options){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		});
		
		//모달에 있는 등록 버튼 클릭
		modalRegisterBtn.on("click", function(e){
			var reply = {
					score : modalInputScore.val(),
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					bno:bnoValue
			}; //댓글 정보
			
			//실질적 댓글 등록
			placeReService.add(reply, function(result){
				alert("<경고>\n※리뷰 삭제시 적립된 마일리지가 회수됩니다※");
			
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
				modalInputScore.val(reply.score);
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(placeReService.displayTime(reply.replydate)).attr("readonly","readonly");
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
				
				var reply = {score:modalInputScore.val(),
						rno:modal.data("rno"),
						reply:modalInputReply.val(),
						replyer: originalReplyer};
				
				if(!replyer){//미로그인시
					alert("로그인 후 수정이 가능합니다.");
					modal.modal("hide");
					return;
				}
				
				console.log("Original Replyer : "+originalReplyer);
				if(ROLE_ADMIN != '&#91;ROLE&#95;ADMIN&#93;'){//관리자가 아닌사람
					if(replyer != originalReplyer){//로그인한 사람과 작성자가 다를시
						alert("자신이 작성한 리뷰만 수정 가능합니다.");
						modal.modal("hide");
						return;
					}
				}	
	
				placeReService.update(reply,function(result){
					alert("리뷰가 수정되었습니다.");
					modal.modal("hide");
					showList(pageNum);
				});
			});

			//댓글 삭제
			modalRemoveBtn.on("click", function(e){
				var rno = modal.data("rno");
				
				console.log("RNO : "+rno);
				console.log("REPLYER : "+replyer);
				
				if(!replyer){//미로그인시
					alert("로그인 후 삭제가 가능합니다.");
					modal.modal("hide");
					return;
				}
				
				var originalReplyer = modalInputReplyer.val();

				console.log("Original Replyer : "+originalReplyer);
				
				if(ROLE_ADMIN != '&#91;ROLE&#95;ADMIN&#93;'){//관리자가 아닌사람
			        if(replyer != originalReplyer){
			           alert("자신의 글이 아닙니다. 삭제 할 수 없습니다.");
			           modal.modal("hide");
			           return;
					}
				}			

				placeReService.remove(rno,originalReplyer,function(result){
					alert("리뷰가 삭제되었습니다.\n적립된 마일리지가 회수됩니다.");
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
           var type = photo.fileType;
           console.log("type : "+type);
           //image type
           if(type==="true"){
        	 var fileCallPath =  encodeURIComponent(photo.uploadPath+ "/s_"+photo.uuid +"_"+photo.fileName); 
	         str += "<li data-path='"+photo.uploadPath+"' data-uuid='"+photo.uuid+"' data-filename='"+photo.fileName+"' data-type='"+photo.fileType+"' ><div>";
	         str += "<img src='/placePho/display?fileName="+fileCallPath+"'>";
             str += "</div>";
             str +="</li>";
           }else{          
             str += "<li data-path='"+photo.uploadPath+"' data-uuid='"+photo.uuid+"' data-filename='"+photo.fileName+"' data-type='"+photo.fileType+"' ><div>";
             str += "<span style='color:black;'> "+ photo.fileName+"</span><br/>";
             str += "<img src='/resources/img/attach.png'>";
             str += "</div>";
             str +="</li>";
           }
         });    
         $(".uploadResult ul").html(str);            
     });//end getjson   
  })();//end function
  
  $(".uploadResult").on("click","li",function(e){
	 console.log("view image");
	 var liObj = $(this);
	 
	 var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
	 
	 if(liObj.data("type")){
		 showImage(path.replace(new RegExp(/\\/g),"/"));
	 } else {
		 //download
		 self.location = "/placePho/download?fileName="+path;
	 }
  });
  
  function showImage(fileCallPath){
	  //alert(fileCallPath);
	  $(".bigPictureWrapper").css("display","flex").show();
	  
	  $(".bigPicture")
	  .html("<img src = '/placePho/display?fileName="+fileCallPath+"'>")
	  .animate({width:'100%', height:'100%'},1000);
  }
  
  $(".bigPictureWrapper").on("click",function(e){
	  $(".bigPicture").animate({width:'0%', height:'0%'},1000); //1초에 걸쳐서 켜짐
	  setTimeout(function(){
		  $(".bigPictureWrapper").hide();},1000); //1초 동안 사라지게
  });
});
</script>
