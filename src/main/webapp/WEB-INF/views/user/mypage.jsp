<%@page import="co.smartFarm.user.memberService.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<head>
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>

</style>
</head>
<body>
	<section class="wf100 p80 blog">
		<div class="causes-listing">
			<div class="container">
				<h1>마이페이지</h1>
				<br><br><br>

				<div class="row">

					<div class="col-lg-6 col-md-2">
						<div class="sidebar">
							<div class="side-widget project-list-widget">

								<ul >
									<li style="margin-bottom:50px"><a style="font-size:25px;" href="javascript:void(0)" 
										onclick="editMember()">회원정보수정</a></li>
									<li style="margin-bottom:50px"><a style="font-size:25px;" href="javascript:void(0)"
										onclick="cultivationHistory()">재배내역</a></li>
									<li style="margin-bottom:50px"><a style="font-size:25px;" href="javascript:void(0)"
										onclick="purchaseHistory()">구매내역</a></li>
									<li><a style="font-size:25px;" href="javascript:void(0)"
										onclick="bidHistory()">입찰내역</a></li>	
								</ul>
							</div>
						</div>
					</div>
						<div class="col-lg-6 col-md-2">
						<div class="sidebar">
							<div class="side-widget project-list-widget">

								<ul>		
									<li style="margin-bottom:50px"><a style="font-size:25px;" href="javascript:void(0)"
										onclick="farmerApplicationStatus()">농부신청현황</a></li>
									<li style="margin-bottom:50px"><a style="font-size:25px;" href="nftholdings.do">NFT보유현황</a></li>
									<li style="margin-bottom:80px"><a style="font-size:25px;" href="javascript:void(0)" onclick="withdrawal()">회원탈퇴</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div id="light" class="col-md-12 white_content">
					 <a href="javascript:void(0)" onclick="exitPopup()" onkeyup="escKeyExit(event)" style="float:right">Close </a> <br> <br>
						<div id="content">123</div>
					</div>
					<div id="123"></div>
					<!-- 220308 PSH loading page 수정 -->
					<div id="fade" class="black_overlay loading"></div>
				</div>
			</div>
		</div>
	</section>
	<script
		src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
	<script src="resources/js/GrowDiary.js"></script>
	<script type="text/javascript"
		src="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.js"></script>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

	<script>

		/* ----------팝업 esc로 닫기 ( 미 완 성 )---------- */
		function escKeyExit(e){
			console.log("123")
            if (e.keyCode == "27") {
                alert("esc");
    			document.getElementById('light').style.display='none';
    			document.getElementById('fade').style.display='none';
			}
		}
		
		/* ----------팝업 로딩생성---------- */
		function createLoading(){
			<!-- 220308 PSH loading page 수정 -->
			/* document.getElementById('fade').style.display = 'block'; */
			document.getElementById('fade').innerHTML = "";
			document.getElementById('fade').style.display="flex";
			var img = document.createElement("img");
			img.setAttribute("src","resources/images/loadingicon.gif");
			img.setAttribute("alt","로딩중입니다");
			img.setAttribute("class","mx-auto d-block");
			document.getElementById('fade').appendChild(img);
		}
	
		/* ----------팝업 생성---------- */
		function createPopup(){
			document.getElementById('light').style.display = 'block';
			document.getElementById('content').classList
					.add("blog-single-content");
			document.getElementById('content').innerHTML = "";
		}
		
		/* ----------팝업 창닫기---------- */
		function exitPopup(){
			document.getElementById('light').style.display='none';
			document.getElementById('fade').style.display='none';
		}
		
		/* ----------회원정보수정---------- */
		function editMember() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			
			//로딩창
			createLoading();
			
			//팝업
			createPopup();
			
			var content = document.getElementById('content');
			editForm =  `<section class="contact-page wf100 p80" style="padding-top: 0px; padding-bottom: 0px;">
				<div class="container">
				<div class="row">
				<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="contact-form mb60">
							<h3 style="margin-bottom: 40px;">
							회원정보수정</h3>


							<form action="memberUpdate.do" method="post"
								onsubmit="return checkRequired();">

								<ul class="cform">
									
									<li class="full">
										&lt; 이메일 &gt;
									<input type="email"
										class="form-control" id="mem_email" name="mem_email" value = "${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}"
										 readonly>  </li>

									<li class="full" style="padding:0; margin-bottom:10px;">
										&lt; 비밀번호 &gt;
									<input type="password"
										class="form-control" id="mem_pw" name="mem_pw"
										placeholder="새로운 비밀번호 입력" required></li>
									<li class="full" style="padding:0; margin-bottom:10px;"><input type="password"
										class="form-control" id="mem_pw_check" name="mem_pw_check"
										placeholder="새로운 비밀번호 확인" required></li>
									<li class="full" style="margin-left:10px;"><span style="color:#f53738;">비밀번호는 대, 소문자, 숫자, 특수문자를 조합하여
											입력해주세요</span></li>

									<li class="half pr-15">&lt; 이름 &gt;<input type="text"
										class="form-control" id="mem_name" name="mem_name"
											value = "${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name}" readonly></li>


									<!-- 핸드폰 번호 -->
									
									<li class="full"><p>&lt 핸드폰 번호 &gt</p>
										<input type="text" class="form-control"
										style="width: 126px; float: left; -webkit-appearance: none;"
										id="mem_tel1" name="mem_tel1" value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_tel.substring(0,3)}"required> <span
										style="float: left; margin-top: 15px;">&nbsp;&nbsp;&mdash;&nbsp;&nbsp;</span>
										<input type="text" class="form-control" value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_tel.substring(4,8)}"
										style="width: 126px; float: left" id="mem_tel2" name="mem_tel2"
										required><span style="float: left; margin-top: 15px;">&nbsp;&nbsp;&mdash;&nbsp;&nbsp;</span>
										<input type="text" class="form-control" value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_tel.substring(9)}"
										style="width: 126px; float: left" id="mem_tel3" name="mem_tel3"
										required> <input type="hidden" id="mem_tel"
										name="mem_tel" value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_tel}"></li>
									
										
									<!-- 주소 -->
									<li class="half pr-15"><input type="text"
										class="form-control" id="mem_addr1" name="mem_addr1" value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_addr.substring(1,6)}"
										placeholder="우편번호" required readonly></li>

									<li class="half pl-15">
										<button type="button" onclick="findAddr()" class="fsubmit">우편번호
											찾기</button>
									</li>
									<li class="full"><input type="text" id="mem_addr2"
										name="mem_addr2" value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_addr.substring(8)}" class="form-control" placeholder="주소" required
										readonly></li>

									<li class="full"><input type="text" id="mem_det_addr"
										name="mem_det_addr" class="form-control" value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_det_addr}" placeholder="상세주소"
										required></li>
									<li class="full"><input type="hidden" id="mem_addr3"
										name="mem_addr3" class="form-control" placeholder=""></li>
									
									<li><input type="hidden" name="mem_email_check"
										id="mem_email_check"> <input type="hidden"
										name="mem_addr" id="mem_addr" value="${SPRING_SECURITY_CONTEXT.authentication.principal.mem_addr}">
									</li>
									
									<li class="half pr-15">
										<button type="submit" class="fsubmit">회원 정보 수정</button>
									</li>

									<li class="half pl-15">
										<button type="reset" class="fsubmit"
											style="background-color: #f8f9fa;; color: #66bb6a; border: 1px solid #66bb6a;">취소</button>
									</li>

								</ul>



							</form>


						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- 주소 찾기 api -->
		<div id="layer"
			style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
				id="btnCloseLayer"
				style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
				onclick="closeFrm()" alt="닫기 버튼">
		</div>`;
		$("#content").html(editForm);
			//로딩끄기
			document.getElementById('fade').style.display = 'none';
			document.getElementById('light').style.height = '125%';
		}
		
		/* ----------재배내역---------- */
		function cultivationHistory() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			//로딩창
			createLoading();
			//팝업
			createPopup();
			
			cultivationHistoryTitle = `<h3 style="margin-bottom: 40px;">
				재배내역</h3>`
			$("#content").html(cultivationHistoryTitle); 
				
			//표 출력
			var grid = new tui.Grid({
				el : document.getElementById('content'),
				rowHeight : 73,
				rowWidth : 'auto',
				rowHeaders : [ {
					type : 'rowNum',
					width : 80,
					height : 73,
					align : 'center',
					valign : 'bottom'
				} ],//번호 매기기
				scrollX : false,
				scrollY : false,
				columns : [ {
					header : '작물이름',
					name : 'plant_name',
					filter : 'select'
				}, {
					header : '품질',
					name : 'grow_diary_grd',
					filter : 'select'
				}, {
					header : '점수',
					name : 'grow_diary_point',
				}, {
					header : 'NFT생성여부',
					name : 'grow_diary_nft_create_ennc',
					sortable: true,
				    sortingType: 'asc'
				} ],
				pageOptions : {
					useClient : true,
					perPage : 5
				}
			});

			$.ajax({
						type : "POST",
						url : "cultivationHistory.do",
						success : function(data) {
							//데이터 입력
							//console.log(data);
							grid.resetData(data);
								
							
							//생성가능여부 가능할때 버튼생성 
							for (var i = 0; i < data.length; i++) {
								if (grid.getValue(i,
										'grow_diary_nft_create_ennc') == 'Y') {
									//console.log(data[i]);
									var growDiary = data[i];
									var input = `<div class="container" style="text-aline:center;">
									<a id=createNft data-no=\${data[i].grow_diary_grow_no} href="javascript:nftGeneration('\${data[i].grow_diary_grow_no}');" class="read-post" style="padding:0 0px 10px 30px; width: 80px; height:30px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">생성가능</a></div>`;
			
									grid.setValue(i,
											'grow_diary_nft_create_ennc',
											input, true);
								} else {
									//console.log("123")
									var input = '생성됨';
									grid.setValue(i,
											'grow_diary_nft_create_ennc',
											input, true);
								}
								}
								document.getElementById('fade').style.display = 'none';
								document.getElementById('light').style.height = '80%';
								
								//메타마스크 로그인체크
								web3.eth.getAccounts(function(err,accs){
						             if(err != null){
						                 alert('There was an error fetching your accounts.')
						                 exitPopup();
						                 return
						             }
						             if(accs.length ===0){
						                 alert("NFT 생산을 위해 메타마스크 로그인을 해주세요")
						                 exitPopup();
						                 return
						             }
						             account = accs[0];
						             console.log(account);
						         }) 
							
						} //success
					});

		}
		/* ----------구매내역---------- */
		function purchaseHistory() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			
			//로딩창
			createLoading();
			
			//팝업
			createPopup();
			purchaseHistoryTitle = `<h3 style="margin-bottom: 40px;">
				구매내역</h3>`
			$("#content").html(purchaseHistoryTitle); 
			//표 출력
			var grid = new tui.Grid({
				el : document.getElementById('content'),
				rowHeight : 73,
				rowWidth : 'auto',
				rowHeaders : [ {
					type : 'rowNum',
					width : 80,
					height : 73,
					align : 'center',
					valign : 'bottom'
				} ],//번호 매기기
				scrollX : false,
				scrollY : false,
				columns : [ {
					header : '상품이름',
					name : 'product_name',
					filter : 'select'
				},{
					header : '가격',
					name : 'pur_his_price',
					filter : 'select'
				}, {
					header : '구매날짜',
					name : 'pur_his_pur_day',
					filter : 'select'
				}, {
					header : '수량',
					name : 'pur_his_sale_count',
				} ],
				pageOptions : {
					useClient : true,
					perPage : 5
				}
			});

			$.ajax({
						type : "POST",
						url : "purHisSelect.do",
						success : function(data) {
							//데이터 입력
							console.log(data);
							grid.resetData(data);
								
							document.getElementById('fade').style.display = 'none';
							document.getElementById('light').style.height = '80%';
						} //success
					});
		}
		
		/* ----------입찰내역---------- */
		function bidHistory() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			//로딩창
			createLoading();
			//팝업
			createPopup();
			
			bidHistoryTitle = `<h3 style="margin-bottom: 40px;">
				입찰내역</h3>`
			$("#content").html(bidHistoryTitle); 
			//표 출력
			var grid = new tui.Grid({
				el : document.getElementById('content'),
				rowHeight : 73,
				rowWidth : 'auto',
				rowHeaders : [ {
					type : 'rowNum',
					width : 80,
					height : 73,
					align : 'center',
					valign : 'bottom'
				} ],//번호 매기기
				scrollX : false,
				scrollY : false,
				columns : [ {
					header : '입찰금액',
					name : 'bid_history_bid',
					filter : 'select'
				}, {
					header : '출금여부',
					name : 'withdraw_whet',
					filter : 'select'
				} ],
				pageOptions : {
					useClient : true,
					perPage : 5
				}
			});

			$.ajax({
						type : "POST",
						url : "bidHistory.do",
						success : function(data) {
							grid.resetData(data);
							
							//출금 가능할때 버튼생성 
							for (var i = 0; i < data.length; i++) {
								if (grid.getValue(i,
										'withdraw_whet') == 'N') {
									console.log(data[i]);
									var bidHistory = data[i];
									var input = `<div class="container" style="text-aline:center;">
									<a id=bidHistoryWithdraw data-no=\${data[i].bid_history_no} href="javascript:withdraw('\${data[i].bid_history_no}');" class="read-post" style="padding:0 0px 10px 30px; width: 80px; height:30px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">출금가능</a></div>`;
			
									grid.setValue(i,
											'withdraw_whet',
											input, true);
								}
								}
								document.getElementById('fade').style.display = 'none';
								document.getElementById('light').style.height = '70%';
							
						} //success
					});

		}
		
		
		
		/* ----------농부신청현황---------- */
		function farmerApplicationStatus() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			
			//로딩창
			createLoading();
			
			//팝업
			createPopup();
			
			var content = document.getElementById('content');
			if('${SPRING_SECURITY_CONTEXT.authentication.principal.mem_athr}' == 'B2'){
				document.getElementById('fade').style.display = 'none';
				
				farmer = `<p style="font-size:1.2em"> <span style="border-bottom: 3px solid #000000;">${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name} 귀하는 농부이십니다. </span><br><br>
														재배키트를 구매후 재배컨트롤러를 이용하여 재배가 가능하고<br>
														생산된 작물을 판매할 수 있습니다.<br><br>
														<strong class="trank">작물을 생성하시겠습니까?</strong>
														<a
														href="grow.do" class="view-more"
														style="color: white; cursor: pointer; margin-right: 380px; margin-top: 20px; display:inline-block">재배하러가기</a>
														</p>`
				$("#content").html(farmer);
				document.getElementById('light').style.textAlign = "center";
				document.getElementById('light').style.height = '40%';
			}else if('${SPRING_SECURITY_CONTEXT.authentication.principal.mem_athr}' == 'B1' && '${SPRING_SECURITY_CONTEXT.authentication.principal.mem_fm_req}' == 'Reject'){
				
				document.getElementById('fade').style.display = 'none';
				
				farmer = `<div class="col-md-12" style="text-align:center; font-size:1.5em">
						${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name} 님 농부 신청이 거절되었습니다 <br><br>
						 자세한 사항은 고객센터에 문의 바랍니다 <br><br>
						 (이메일) <span class="trank">yedam@yedam.ac</span><br>
						 (전화) <span class="trank">053-421-2460</span>
						 </div>`
				$("#content").html(farmer);
				document.getElementById('light').style.height = '50%';
			}else if('${SPRING_SECURITY_CONTEXT.authentication.principal.mem_athr}' == 'B1' && '${SPRING_SECURITY_CONTEXT.authentication.principal.mem_fm_req}' != ''){
				
				document.getElementById('fade').style.display = 'none';
				
				farmerIng = `<div class="col-md-12" style="text-align:center">
								<strong class="trank" style="font-size:1.6em"> ${SPRING_SECURITY_CONTEXT.authentication.principal.mem_name} 님은 이미 농부 신청을 하셨습니다. <br><br>
														<span style="border-bottom: 2px solid #66BB6A;">관리자가 승인할 때까지 조금만 더 기다려주세요...</span></strong>
							</div>`
				$("#content").html(farmerIng);
				document.getElementById('light').style.height = '30%';
			}else{ //권한이 일반인 농부신청
			farmerForm =  `<section class="contact-page wf100 p80" style="padding-top: 0px;">
				<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="contact-form mb60">
							<h3 style="margin-bottom: 40px;">
							농부신청</h3>

							<h5>농부 (인증할만한) 증빙서류
							(ex 농지, 사업자번호, 커리어, 이미지 )</h5> <br><br>
							<form action="memberFarmer.do" method="post"
								onsubmit="return checkFile();">

								<ul class="cform">
									
									<li class="full">
										&lt; 농부증명서등록 &gt;
									<input type="file"
										class="form-control" id="mem_fm_req" name="mem_fm_req" style="height: 60px;"
										 readonly>  </li>
									
									<li class="half pr-15">
										<button type="submit" class="fsubmit">농부 신청</button>
									</li>

									<li class="half pl-15">
										<button type="reset" class="fsubmit"
											style="background-color: #f8f9fa;; color: #66bb6a; border: 1px solid #66bb6a;">취소</button>
									</li>

								</ul>



							</form>


						</div>
					</div>
				</div>
			</div>
		</section>
		`;
		$("#content").html(farmerForm);
			//로딩끄기
			document.getElementById('fade').style.display = 'none';
			document.getElementById('light').style.height = '70%';
			}
			
		}
		/* ----------회원탈퇴---------- */
		function withdrawal() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			
			//로딩창
			createLoading();
			
			//팝업
			createPopup();
			
			var withdrawForm = `
				<div class="col-md-12">
				<h3 style="margin-bottom: 40px;">
				회원탈퇴</h3>
				<div class="login-box" style="background-color:#dddddd">
				<p style="font-size:1.1em">사용하고 계신 아이디 <span style="border-bottom: 3px solid #000000">${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}</span> 는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br><br>
					탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<br><br>
					탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.<br><br>
					회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며<br><br>
					<span style="color:#e11f3e; border-bottom: 3px solid #e11f3e;">삭제된 데이터는 복구되지 않습니다.</span><br><br>	
					<span style="color:#e11f3e; border-bottom: 3px solid #e11f3e;">삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</span><br>
				
				<form action="memberDelete.do" onsubmit="return passwordCheck()">
				<div class="input-group">
					<input id="password" type="password" class="form-control"
						placeholder="마지막으로 비밀번호를 입력해주세요" required>
				</div>
				<div class="input-group">
					<button class="login-btn" style="cursor: pointer;background-color:#e11f3e;color:#ffffff;" type="submit">탈퇴</button>
				</div>
				</form>
				</div>
				</div>
				`
			$("#content").html(withdrawForm);
			
			//로딩끄기
			document.getElementById('fade').style.display = 'none';
			document.getElementById('light').style.height = '80%';
		}

		//nft블록체인 생성, db입력
		function nftGeneration(growDiary) {
			//로딩창
			createLoading();
			//console.log(growDiary);
			$.ajax({
				url : "nftGeneration.do",
				data : {
					"growDiaryNo" : growDiary
				}
			}).done(function(nftNo) {
				console.log(nftNo);
				setTimeout( function(){
					cultivationHistory();
					document.getElementById('fade').style.display = 'none';
					// 일종의 이벤트 리스너가 텍스트 입력값을 취한다:	
					// 우리 컨트랙트의 `createGrowDiaryNft`함수를 호출한다:
					GrowDiary.methods.createGrowDiaryNft(nftNo, '${SPRING_SECURITY_CONTEXT.authentication.principal.mem_email}')
					.send({from: account, })
					.then(function(result){console.log(result);})	
				},5000);
			});
			

		}

		//입찰내역 솔리디티출금, db 행 삭제
		function withdraw(bidHistoryNo){
			//로딩창
			createLoading();
			
			$.ajax({
				url : "withdraw.do",
				data : {
					"bidHistoryNo" : bidHistoryNo
				}
			}).done(function(result) {
				console.log(result);
				setTimeout( function(){
					bidHistory();
					document.getElementById('fade').style.display = 'none';
					// 일종의 이벤트 리스너가 텍스트 입력값을 취한다:	
					// 우리 컨트랙트의 `createGrowDiaryNft`함수를 호출한다:	
				},5000);
			});
		}
		
		
 		//회원정보수정
		
		// ===== 비밀번호 유효성 검사 =====
		function checkPw() {
			var mem_pw = $('#mem_pw').val();
	 		var reg = mem_pw.search(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]/);
	 			
			if(mem_pw.length > 20 || mem_pw.length < 8){
				toastr.error('비밀번호는 8자리 이상 20자리 이하로 지정해 주세요');
		 		return false;
		 		
			} else {
				
				if (reg < 0){
		 			toastr.error('비밀번호는 대소문자, 특수문자, 숫자를 조합하여 설정해주세요');
		 			return false;
		 		}
				
				return true;
			}
			
		}
		
		$("#content").on("focusout", "#mem_pw" , function(){
			checkPw();
		})
		
		// ===== 비밀번호 확인 체크 =====
		$("#content").on("focusout", "#mem_pw_check" , function(){
			var mem_pw = $('#mem_pw').val();
	 		var mem_pw_check = $('#mem_pw_check').val();
	
	 		if(mem_pw !== mem_pw_check){
	 			toastr.error('비밀번호가 일치하지 않습니다');
	 		}
		})
		
		//=====주소 api=====
		var element_layer = document.getElementById('layer');

	    function closeDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_layer.style.display = 'none';
	    }
	    
	     function findAddr() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                        //console.log("1"+extraAddr);
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                        //console.log("2"+extraAddr);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                     
	                    }
	                 // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("mem_addr3").value = extraAddr;
	                    //console.log("3"+extraAddr);
	                    
	                
	                } else {
	                    document.getElementById("mem_addr3").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('mem_addr1').value = data.zonecode;//우편번호
	                document.getElementById("mem_addr2").value = addr;//주소
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("mem_det_addr").focus();
	                
	                //전체 주소 합쳐서 mem_addr에 넣기
	                var resultAddr = '[' + data.zonecode +']' + ' '+ addr  + extraAddr ;
	                //console.log(resultAddr);
	                
	                document.getElementById('mem_addr').value = resultAddr;
	            }
	        }).open();
	    };
	  
	  // ===== 농부신청할때 파일 유무체크
	  		function checkFile() {
	  			if(document.getElementById('mem_fm_req').value == ''){
					alert('파일을 등록해주세요.');
					return false;
				}else{
					alert('신청이 완료되었습니다.');
					return true;
				} 
		  
	 	 	}
	    
	  // ===== 회원가입 버튼 누르기 전에 확인하기 =====
		   	function checkRequired() {
		 		
		 		checkPw();
		 		var mem_tel = document.getElementById('mem_tel1').value +"-"+document.getElementById('mem_tel2').value 
				+"-"+document.getElementById('mem_tel2').value ;
				document.getElementById('mem_tel').value = mem_tel;
		 		
		 		return true;
		 		
		    }
	  
	  function passwordCheck(){
		  
		  if(document.getElementById('password').value == '${SPRING_SECURITY_CONTEXT.authentication.principal.mem_pw}'){
				alert('정상적으로 입력되었습니다.');
				return true;
			}else{
				alert('비밀번호가 일치하지 않습니다.');
				return false;
			} 
	  }
	</script>
	

		
</body>
</html>