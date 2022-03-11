<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 상세페이지</title>
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
	<section class="contact-page wf100 p80">
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="contact-form mb60">
						<h3>QNA</h3>
						<ul class="cform">
							<li class="half pr-15">
								<p>제목: ${qna.qna_title}</p>
							</li>
							<li class="half pr-15">
								<p>날짜: ${qna.qna_day}</p>
							</li>
							<li class="full">
								<p>내용: ${qna.qna_con}</p>
							</li>
							<li class="full"><img
								src="downloadq.do?img=${qna.qna_phy_rou}"
								onError="this.style.visibility='hidden'"></li>
							<li class="full"><a
								href="downloadq.do?img=${qna.qna_phy_rou}">${qna.qna_phy_rou}</a>
							</li>
							<li class="half pr-15"><input type="button" value="수정하기"
								onclick="location.href='qnaupdateForm.do?qna_no=${qna.qna_no}'"
								class="fsubmit"></li>
							<li class="half pr-15"><input type="button" value="뒤로가기"
								onclick="history.back(-1);" class="fsubmit"></li>
							<!--Leave a Comment Start-->
							<h4>댓글</h4>
							<ul>
								<form id="commentForm" name="commentForm" method="post">
									<br>
									<br>
									<div>
										<div>
											<span><strong>Comments</strong></span> <span id="cCnt"></span>
										</div>
										<input type="radio" name="qna_open_whet" id="qna_open_whet" value="Y"/><span class="ml_10">공개</span>&nbsp;&nbsp;&nbsp;&nbsp;
    									<input type="radio" name="qna_open_whet" id="qna_open_whet" value="N"/><span class="ml_10">비공개</span>&nbsp;
										<div>
											<table class="table">
												<tr>
													<td><textarea style="width: 800px" rows="3" cols="30"
															id="reply_con" placeholder="댓글을 입력하세요" name="reply_con">${reply.reply_con}</textarea>
														<br>
														<div>
															<a href='#' onClick="fn_comment('${qna.qna_no}')"
																class="btn pull-right btn-success">등록</a>
														</div>
												    </td>
												</tr>
											</table>
										</div>
									</div>
									<input type="hidden" id="qna_no" name="qna_no"
										value="${qna.qna_no}"/>
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
		function fn_comment(code) {

			$.ajax({
				type : 'POST', //post 방식 
				url : "replyadd.do", 
				data : JSON.stringify({ reply_con : $('#reply_con').val(), qna_no : Number($('#qna_no').val())}),
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
							var html = "";
							var cCnt = data.length;

							if (data.length > 0) {

								for (i = 0; i < data.length; i++) {
									html += "<div>";
									html += "<div><table class='table'><h6><strong>"
											+ data[i].mem_name + "</strong></h6>";
									html += data[i].reply_con
											+ "<tr><td></td></tr>";
								    html += "<a href='javascript:replyDelete();'>삭제</a>";
					
									html += "</table></div>";
									html += "</div>";
								}

							} else {

								html += "<div>";
								html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
								html += "</table></div>";
								html += "</div>";

							}

							$("#cCnt").html(html);
							//$("#commentList").html(html);

						},
						error : function(request, status, error) {

						}

					});
		}
		 	
	 function replyDelete(qna_no){
				var paramData = {"reply_no": qna_no};
				$.ajax({
					url: 'replydelete.do',
					method : 'post',
					data : paramData,
					datatype : 'json',
					success: function(data){
						showReplyList(data);
						alert("삭제 완료");
						location.reload();
					}, 
					error: function(data){
						console.log("에러 : " + error);
					}
				}); 
			}                                          
	</script>
</body>
</html>