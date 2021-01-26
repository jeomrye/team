console.log("***** Reply Module *****");

//장소게시판 리뷰 댓글
var placeReService = (function(){
	//댓글 등록
	function add(reply, callback, error){
		console.log("+ + + add reply + + +");
		$.ajax({
			type : 'post',
			url : '/placeRe/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {//xhr:객체	
				if (error) {
				error(er);
				}
			}
		});
	}	
	
	//댓글 목록
	function getList(param, callback, error){
		var bno = param.bno;
		var page = param.page || 1; //댓글 페이지 목록
		console.log("bno"+param.bno);
		$.getJSON("/placeRe/pages/" + bno + "/" + page + ".json",
			function(data){
				if(callback){
					callback(data.placeReCnt, data.list);
				}
			}).fail(function(xhr, status, err){
			if(error) {
			error();
			}
		});
	}
	
	//댓글 삭제
	function remove(rno, replyer, callback, error){
		console.log("- - - delete reply - - -");
		$.ajax({
			type : 'delete',
			url : '/placeRe/' + rno,
			data : JSON.stringify({rno:rno, replyer:replyer}),
			contentType : "application/json; charset=utf-8",
			success : function(deleteResult, status, xhr) {
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
				error(er);
				}
			}
		});
	}
	
	//댓글 수정
	function update(reply, callback, error){	
	console.log("update reply : "+reply.rno);
		$.ajax({
			type : 'put',
			url : '/placeRe/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
				error(er);
				}
			}
		});
	}
	
	//댓글 상세보기
	function get(rno, callback, error) {
		$.get("/placeRe/" + rno + ".json", function(result){
			if(callback){
					callback(result);
				}
		}).fail(function(xhr, status, error) {
			if (error) {
				error();
			}
		});
	}
	
	//댓글 시간
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str = "";
		
		//하루 이내 댓글
		if(gap < (1000 * 60 * 60 * 24)){
		
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		//시/분/초
		return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0')+ mi,':',(ss > 9 ? '' : '0') + ss].join('');
		} else {//연/월/일	
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();		
		return [ yy, '/', (mm > 9 ? '' : '0') + mm,'/',(dd > 9 ? '' : '0') + dd].join('');
	}
};
	return {
		add:add,
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		displayTime:displayTime
		};
})();

//자유게시판 댓글
var FreeReplyService = (function(){

	function add(reply, callback, error){
		console.log("add reply...............");
		
		$.ajax({
			type : 'post',
			url : '/Freereplies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) { //xhr:객체
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
				error(er);
				}
			}
		})
	}	
	
	function getList(param, callback, error){
		var fno = param.fno;
		var page = param.page || 1;
		
		$.getJSON("/Freereplies/pages/" + fno + "/" + page + ".json",
			function(data){
				if(callback){
				
					callback(data.replyCnt, data.list);
				}
			}).fail(function(xhr, status, err){
			if(error) {
			error();
			}
		});
	}
	
	function remove(rno, replyer, callback, error){
		$.ajax({
			type : 'delete',
			url : '/Freereplies/' + rno,
			data : JSON.stringify({rno:rno, replyer:replyer}),
			contentType : "application/json; charset=utf-8",
			success : function(deleteResult, status, xhr) {
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
				error(er);
				}
			}
		});
	}
	
	function update(reply, callback, error){	
	console.log("RNO : "+reply.rno);
		$.ajax({
			type : 'put',
			url : '/Freereplies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
				error(er);
				}
			}
		});
	}
	
	function get(rno, callback, error) {
		$.get("/Freereplies/" + rno + ".json", function(result){
			if(callback){
					callback(result);
				}
		}).fail(function(xhr, status, error) {
			if (error) {
				error();
			}
		});
	}
	
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)){
		
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		
		return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0')+ mi,':',(ss > 9 ? '' : '0') + ss]
		.join('');
		} else {
		
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		
		return [ yy, '/', (mm > 9 ? '' : '0') + mm,'/',(dd > 9 ? '' : '0') + dd].join('');
	}
}
;
	return {
		add:add,
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		displayTime:displayTime
		};
})();

var QaReplyService = (function(){

	function add(reply, callback, error){
		console.log("add reply...............");
		
		$.ajax({
			type : 'post',
			url : '/qnaRe/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) { //xhr:객체
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
				error(er);
				}
			}
		});
	}	
	
	function getList(param, callback, error){
		var questionNo = param.questionNo;
		var page = param.page || 1;
		console.log(questionNo);
		
		$.getJSON("/qnaRe/pages/" + questionNo + "/" + page + ".json",
			function(data){
				if(callback){
				
					callback(data.replyCnt, data.list);
				}
			}).fail(function(xhr, status, err){
			if(error) {
			error();
			}
		});
	}
	
	function remove(rno ,replyer, callback, error){ // 3개인데 지금 콜백으로
		$.ajax({
			type : 'delete',
			url : '/qnaRe/' + rno,
			data : JSON.stringify({rno:rno, replyer:replyer}),
			contentType : "application/json; charset=utf-8",
			success : function(deleteResult, status, xhr) {
				console.log("성공 접근");
				console.log(deleteResult);
				console.log(status);
				console.log(xhr);
				console.log("성공 접근");
				
				if(callback){
					// 콜백으로 데이터를 보내줘야
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				console.log("실패 접근");
				if (error) {
				error(er);
				}
			}
		});
	}
	
	function update(reply, callback, error){	
	console.log("RNO : "+reply.rno);
		$.ajax({
			type : 'put',
			url : '/qnaRe/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
				error(er);
				}
			}
		});
	}
	
	function get(rno, callback, error) {
		$.get("/qnaRe/" + rno + ".json", function(result){
			if(callback){
					callback(result);
				}
		}).fail(function(xhr, status, error) {
			if (error) {
				error();
			}
		});
	}
	
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)){
		
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		
		return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0')+ mi,':',(ss > 9 ? '' : '0') + ss]
		.join('');
		} else {
		
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		
		return [ yy, '/', (mm > 9 ? '' : '0') + mm,'/',(dd > 9 ? '' : '0') + dd].join('');
	}
}
;
	return {
		add:add,
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		displayTime:displayTime
		};
})();