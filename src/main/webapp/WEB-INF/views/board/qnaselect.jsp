<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A상세페이지</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
</head>
<style>
.filebox label {
   display: inline-block;
   padding: .5em .75em;
   color: #fff;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #5cb85c;
   cursor: pointer;
   border: 1px solid #4cae4c;
   border-radius: .25em;
   -webkit-transition: background-color 0.2s;
   transition: background-color 0.2s;
}

.filebox label:hover {
   background-color: #6ed36e;
}

.filebox label:active {
   background-color: #367c36;
}

.filebox input[type="file"] {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0;
}

ul>li>p {
   border: 2px solid #e1e1e1;
   background: #fafafa;
   color: #555555;
   height: auto;
   line-height: 49px;
   padding: 0 20px;
}
</style>
<body>

	<section class="shop wf100 p80">
		<div class="container">
			<div class="row">
		<div class="blog-single-content">
								<h3>${qna.qna_title}</h3>
							<ul class="post-meta">
							<li><i class="fas fa-user-circle"></i>${qna.mem_name}</li>
							<li><i class="fas fa-calendar-alt"></i>${qna.qna_day}</li>
							<li><i class="fas fa-comments"></i>${qna.qna_hit}</li>
							</ul>
							<!-- <div class="blog-single-thumb" style="border-bottom:thick double #32a1ce;"> -->
							<div style="width: 100%; text-align : center;">
							<img src="downloadq.do?img=${qna.qna_phy_rou}"style="width: 100%; max-width: 1200px; vertical-align: middle"onError="this.style.visibility='hidden'">
							</div> 
							<div>
							<a href="downloadq.do?img=${qna.qna_phy_rou}"><p>${qna.qna_phy_rou}</p></a>
							</div>
							<h5 style="margin-top:80px">${qna.qna_con}</h5>
							<div>
							<ul class="cform">
							<li id="modi"><input type="button" value="수정하기"
								onclick="location.href='qnaupdateForm.do?qna_no=${qna.qna_no}'"
								class="fsubmit">
							</li>
							<li id="back">
							<input type="button" value="뒤로가기"
								onclick="history.back(-1);" class="fsubmit">
								</li>
							
							</div>
							<!--답글-->
							<div class="col-md-8" style="margin-top:100px">
							<div class="wf100 comment-form" style="border-bottom: 1px solid #dddddd; margin-bottom:40px;">
						 	<h4>답글</h4>
							<ul>
								<form id="commentForm" name="commentForm" method="post">
									<br> <br>
									<div>
										<div>
											<span id="cCnt"></span>
										</div>

										<sec:authorize access="hasRole('ADMIN')">
											<div>
												<table class="table">
													<tr>
														<td><textarea style="width: 800px" rows="3" cols="30"
																id="reply_con" placeholder="댓글을 입력하세요" name="reply_con">${reply.reply_con}</textarea>
															<br>
															<div>
																<!--  style="display:none;"> -->
																<a href='#' onClick="fn_comment('${qna.qna_no}')"
																	class="btn pull-right btn-success">등록</a>
															</div></td>
													</tr>
												</table>
											</div>
										</sec:authorize>
									</div>
									<input type="hidden" id="qna_no" name="qna_no"
										value="${qna.qna_no}" />
								</form>
							</ul>
					</div>
					</ul>
				</div>

			</div>
		</div>
	</section>
	<script>

	    /*
		 * 댓글 등록하기(Ajax)
		 */
		 
		 if('${qna.mem_email}' == '${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}'){
			 document.getElementById('modi').setAttribute('class', 'half pr-15')
			 document.getElementById('back').setAttribute('class', 'half pr-15')
			 
		 }else{
			 document.getElementById('modi').remove();
			 document.getElementById('back').setAttribute('class', 'full')
		 }
		 
		 
		function fn_comment(code) {

			$.ajax({
				type : 'POST', //post 방식 
				url : "replyadd.do", 
				data : JSON.stringify({ reply_con : $('#reply_con').val(), qna_no : code}),
				// reply_con : reply_con, qna_no:qna_no -> json 받음 
				//data를 -> replycontroller로 보냄 
				contentType:"application/json; charset=utf-8",
				success : function(data) {
					console.log(data);
					if (data == "success") {
						getCommentList();
						$("#reply_con").val("");
					}
				},
				error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}

			});
		}

		/**
		 * 초기 페이지 로딩시 댓글 불러오기
		 */
		$(function() {
			getCommentList();
		
			
		});

		/**
		 * 댓글 불러오기(Ajax)
		 */
		 
		function reply_con(reply_no){
			
			 if(!document.getElementById('m'+reply_no)){
				var reply = document.getElementById(reply_no);
				var modifyText = document.createElement("input");
				modifyText.value = reply.textContent;
				modifyText.setAttribute('id', 'm'+reply_no);
				var abtn = document.createElement("a");
				
				abtn.setAttribute('onclick', 'replyUpdate('+reply_no+')');
				abtn.style.cursor = "pointer";
				abtn.textContent = "수정";
				
				reply.parentNode.append(modifyText, abtn);
			}
		 } 
		
		function getCommentList() {
			$.ajax({
						type : 'POST',  //post 형식으로 보내고 
						url : "replycommend.do", 
						dataType : "json", 
						data : JSON.stringify({ qna_no : Number($('#qna_no').val())}), // qna_no : Number.val -> json형식으로 변환
						//data ->replycontroller 데이터를 담아서 보내줌 
						contentType:"application/json; charset=utf-8", // 한글 번역 
						success : function(data) { 
							console.log(data);
							var commentlist = "";								
							if (data.length > 0) {

								for (i = 0; i < data.length; i++) {
									commentlist += `<div><h6><strong> \${data[i].mem_name}</strong></h6>
									<span id="\${data[i].reply_no}"> \${data[i].reply_con}</span>
									<tr><td></td></tr>
									<sec:authorize access="hasRole('ADMIN')">
								    <a href='javascript:replyDelete("\${data[i].reply_no}");'style="cursor: pointer; color:#38761d; float:right; font-size:1.2em">삭제</a>
								    <a href='javascript:reply_con("\${data[i].reply_no}");'style="cursor: pointer; color:#38761d; float:right; font-size:1.2em">수정</a>
								    </sec:authorize>
									</div>`;
								}

							}
							
							else {
								commentlist =`<div>
								<div><table class='table'><h6><strong>등록된 답글이 없습니다.</strong></h6>
								</table></div></div>`
							}

									$("#cCnt").html(commentlist);
							

							},

						error : function(error) {
							console.log(errer);
						}
						});
		}
	 function replyDelete(qna_no){
				var paramData = {reply_no: qna_no};
				$.ajax({
					url: 'replydelete.do',
					type : 'post',
					data : paramData,
					datatype : 'json',
					success: function(){
						alert("삭제 완료");
						location.reload();
					}, 
					error: function(data){
						console.log("에러 : " + error);
					}
				}); 
			}   
	 function replyUpdate(replyId){
		 
		 		 
		 var paramData = JSON.stringify({reply_no: replyId, qna_no: $('#qna_no').val(), reply_con: $('#m'+replyId).val()});
		 
		 $.ajax({
			 url: 'replyUpdate.do', //요청 웹문서의 url주소
			 type : 'post', //요청방식
			 data : paramData, //전달할 변수와 값 설정(1. QueryString형식, 2.objest객체형식{})
			 contentType:"application/json; charset=utf-8", // 한글 번역 
			 success: function(data){ //정상적인 응답결과를 제공받아 처리하는 함수 설정
				 alert("수정 완료")  // 응답결과가 자동으로 함수의 매개변수에 전달되어 저장
				 getCommentList(); 
			 },
			 error: function(data){ //비정상적인 응답결과를 제공받아 처리하는 함수를 설정
				 console.log("에러 : " + error);
			 }
		 })
	 }
	
	</script>
</body>
</html>