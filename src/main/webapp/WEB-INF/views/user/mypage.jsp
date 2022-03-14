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
				<br>
				<h2>&lt; 판매현황 &gt;</h2>
				<br> <br>

				<div class="row">
					<!-- 차트 출력 -->

					<div class="col-lg-9 col-md-8">
						<canvas id="myChart" style="z-index: 1;"></canvas>
					</div>

					<div class="col-lg-3 col-md-4">
						<div class="sidebar">
							<div class="side-widget project-list-widget">

								<ul>
									<li><a href="javascript:void(0)" onclick="editMember()">회원정보수정</a></li>
									<li><a href="javascript:void(0)"
										onclick="cultivationHistory()">재배내역</a></li>
									<li><a href="javascript:void(0)"
										onclick="purchaseHistory()">구매내역</a></li>
									<li><a href="javascript:void(0)"
										onclick="farmerApplicationStatus()">농부신청현황</a></li>
									<li><a href="nftholdings.do">NFT보유현황</a></li>
									<li><a href="javascript:void(0)" onclick="withdrawal()">회원탈퇴</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div id="light" class="col-md-12 white_content">
					 <a href="javascript:void(0)" onclick="exitPopup()" onkeyup="escExit(event)" style="float:right">Close </a> <br> <br>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

	<script>

		/* ----------팝업 esc로 닫기 ( 미 완 성 )---------- */
		function escExit(e){
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
			editForm =  `<section class="contact-page wf100 p80" style="padding-top: 0px;">
				<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="contact-form mb60">
							<h3 style="margin-bottom: 40px;">
							회원정보수정</h3>


							<form action="memberUpdate.do" method="post"
								onsubmit="return checkRequired();">

								<ul class="cform">
									
									<li class="full">
										&lt; 이메일 &gt;
									<input type="email"
										class="form-control" id="mem_email" name="mem_email" value = "${member.mem_email}"
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
											value = "${member.mem_name}" readonly></li>


									<!-- 핸드폰 번호 -->
									
									<li class="full"><p>&lt 핸드폰 번호 &gt</p>
										<input type="text" class="form-control"
										style="width: 126px; float: left; -webkit-appearance: none;"
										id="mem_tel1" name="mem_tel1" required> <span
										style="float: left; margin-top: 15px;">&nbsp;&nbsp;&mdash;&nbsp;&nbsp;</span>
										<input type="text" class="form-control"
										style="width: 126px; float: left" id="mem_tel2" name="mem_tel2"
										required><span style="float: left; margin-top: 15px;">&nbsp;&nbsp;&mdash;&nbsp;&nbsp;</span>
										<input type="text" class="form-control"
										style="width: 126px; float: left" id="mem_tel3" name="mem_tel3"
										required> <input type="hidden" id="mem_tel"
										name="mem_tel"></li>

									<!-- 주소 -->
									<li class="half pr-15"><input type="text"
										class="form-control" id="mem_addr1" name="mem_addr1"
										placeholder="우편번호" required readonly></li>

									<li class="half pl-15">
										<button type="button" onclick="findAddr()" class="fsubmit">우편번호
											찾기</button>
									</li>
									<li class="full"><input type="text" id="mem_addr2"
										name="mem_addr2" class="form-control" placeholder="주소" required
										readonly></li>

									<li class="full"><input type="text" id="mem_det_addr"
										name="mem_det_addr" class="form-control" placeholder="상세주소"
										required></li>
									<li class="full"><input type="hidden" id="mem_addr3"
										name="mem_addr3" class="form-control" placeholder=""></li>
									
									<li><input type="hidden" name="mem_email_check"
										id="mem_email_check"> <input type="hidden"
										name="mem_addr" id="mem_addr">
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
		}
		
		/* ----------재배내역---------- */
		function cultivationHistory() {
			//클릭시 페이지 최상단으로 이동.
			window.scrollTo(0,0);
			//로딩창
			createLoading();
			//팝업
			createPopup();
			
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
			if('${member.mem_athr}' == "B2"){
				document.getElementById('fade').style.display = 'none';
				
				farmer = `<h1> ${member.mem_name} 귀하는 농부이십니다. </h1>`
				$("#content").html(farmer);
				
			}else if('${member.mem_athr}' == "B1" && '${member.mem_fm_req}' != null){
				
				document.getElementById('fade').style.display = 'none';
				farmerIng = `<img src="/prj/resources/images/memberDelete.gif">
								<br>
								<h5> 아직 관리자가 농부 승인을 하지않았습니다. </h5>`
				$("#content").html(farmerIng);
				
			}else{
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
										class="form-control" id="mem_fm_req" name="mem_fm_req"
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
			
			var withdrawForm = `<p>사용하고 계신 아이디 ${member.mem_email} 는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>
				<p>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
				<p>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</p>
				<p>회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
				<p>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p>
				
				<div class="login-box">
				<form action="memberDelete.do" onsubmit="return passwordCheck()">
				<div class="input-group">
					<input id="password" type="password" class="form-control"
						placeholder="마지막으로 비밀번호를 입력해주세요" required>
				</div>
				<div class="input-group">
					<button class="login-btn" type="submit">탈퇴</button>
				</div>
				</form>
				<img src="/prj/resources/images/memberDelete.gif">
				</div>
				`
			$("#content").html(withdrawForm);
			
			//로딩끄기
			document.getElementById('fade').style.display = 'none';
		}

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
					GrowDiary.methods.createGrowDiaryNft(nftNo, '${member.mem_email}')
					.send({from: account, })
					.then(function(result){console.log(result);})	
				},5000);
			});
			

		}

		//=====차트=====
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context, {

			type : 'line', // 차트의 형태 line, pie, bar
			data : { // 차트에 들어갈 데이터

				labels : [ '1', '2', '3', '4', '5', '6', '7' ], //x 축
				datasets : [ { //데이터
					label : '총매출', //차트 제목
					fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data : [ 21, 19, 25, 20, 23, 26, 25 //x축 label에 대응되는 데이터 값
					],
					backgroundColor : [
					//색상
					'rgba(255, 206, 86, 1)' ],
					borderColor : [
					//경계선 색상
					'rgba(255, 206, 86, 1)' ],
					borderWidth : 1
				//경계선 굵기

				}, { //데이터
					label : '키트매출', //차트 제목
					fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data : [ 2, 3, 14, 25, 13, 41, 12 //x축 label에 대응되는 데이터 값
					],
					backgroundColor : [
					//색상
					'rgba(75, 192, 192, 1)', ],
					borderColor : [
					//경계선 색상
					'rgba(75, 192, 192, 1)', ],
					borderWidth : 1
				//경계선 굵기
				} ]

			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
		
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
		  
		  if(document.getElementById('password').value == ${member.mem_pw}){
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