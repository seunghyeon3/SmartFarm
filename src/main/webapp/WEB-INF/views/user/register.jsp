<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 70%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
</head>

<body>
	<!--회원가입-->
	<section class="contact-page wf100 p80">
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="contact-form mb60">
						<h3>회원가입</h3>

						<form action="memberInsert.do" onsubmit="checkRequired()"
							method="post">
							<ul class="cform">
								<li class="half pr-15"><input type="email"
									class="form-control" id="mem_email" name="mem_email"
									placeholder="이메일"></li>

								<li class="half pl-15">
									<button type="button" onclick="checkEmail()" id="checkEmailFnc"
										class="fsubmit">이메일 확인</button>
								</li>

								<li class="half pr-15"><input type="password"
									class="form-control" id="mem_pw" name="mem_pw"
									placeholder="비밀번호"></li>
								<li class="half pl-15"><input type="password"
									class="form-control" id="mem_pw_check" name="mem_pw_check"
									placeholder="비밀번호 확인"></li>

								<li class="half pr-15"><input type="text"
									class="form-control" id="mem_name" name="mem_name"
									placeholder="이름"></li>
								<li class="half pl-15"><input type="text"
									class="form-control" id="mem_tel" name="mem_tel"
									placeholder="전화번호"></li>

								<!-- 주소 -->
								<li class="half pr-15"><input type="email"
									class="form-control" id="mem_addr1" name="mem_addr1"
									placeholder="우편번호"></li>

								<li class="half pl-15">
									<button type="button" onclick="findAddr()" class="fsubmit">우편번호
										찾기</button>
								</li>
								<li class="full"><input type="text" id="mem_addr2"
									name="mem_addr2" class="form-control" placeholder="주소"></li>

								<li class="half pr-15"><input type="text" id="mem_det_addr"
									name="mem_det_addr" class="form-control" placeholder="상세주소"></li>
								<li class="half pl-15"><input type="text" id="mem_addr3"
									name="mem_addr3" class="form-control" placeholder=""></li>

								<li class="full"></li>

								<li class="full"><a href="javascript:void(0)"
									onclick="openPInfo()" id="pInfo">개인정보 동의</a></li>

								<li class="half pr-15">
									<button type="button" class="fsubmit" type="submit">회원가입</button>
								</li>

								<li class="half pl-15">
									<button type="button" class="fsubmit"
										style="background-color: #f8f9fa;; color: #66bb6a; border: 1px solid #66bb6a;">취소</button>
								</li>

							</ul>
							<input type="text" name="mem_addr" id="mem_addr">
							<input type="text" name="mem_addr" id="mem_email_check">
							 <input
								type="text" name="pInfoCheck" id="pInfoCheck"
								class="form-control" placeholder="개인정보 동의">
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
	</div>

	<!-- 개인정보 동의 창 -->
	<div id="lightPInfo" class="col-md-12 white_content">
		개인정보 동의 <a onclick="closeFrm()">Close </a> <br> <br>

		<div id="container">어쩌구 저쩌구 개인정보 동의 내용</div>

		<div class="container" id=""
			style="text-aline: center; padding-top: 50px; margin: 0; text-align: center;">

			<!-- 승인 버튼 + 취소버튼 -->
			<div class="single-post-tags"
				style="padding: 0; margin: 0; text-align: center;">
				<a onclick="accept()" id=""
					style="background-color: #66bb6a; color: #ffffff;">동의</a>&nbsp; <a
					onclick="closeFrm()" id=""
					style="background-color: #e11f3e; color: #ffffff;">취소</a>
			</div>

		</div>




	</div>

	<div id="fadePInfo" class="black_overlay"></div>

	<script>
	
	 	// ===== 회원가입 버튼 누르기 전에 확인하기 =====
	   	function checkRequired() {
			var mem_email = $("#mem_email").val();
			alert(mem_email);
			if(mem_email == ''){
				alert("이메일 입력해주세요!")
				return false; 
			}
	    }
	
		// ===== 입력한 이메일이 사용 가능한지 =====
		function checkEmail() {
			var mem_email = $("#mem_email").val();
			console.log(mem_email)
			var data = JSON.stringify({ mem_email: mem_email});
			fetch("memberEmailCheck.do",
					{ method:'post',
				 	headers: {
					    'Content-Type': 'application/json;charset=utf-8'
					  },
					  body: data
				}).then(response => response.json())
				.then(function(result) {
					console.log(result)
					if(result == '1'){
						$('#checkEmailFnc').removeAttr('onclick');
						$('#checkEmailFnc').css('background-color', '#6c757d');
						$('#mem_email_check').val("true");
						
					}
				})
		}
		
		// ===== 개인정보 동의 폼 열기 =====
		function openPInfo() {
			document.getElementById('lightPInfo').style.display = 'block';
			document.getElementById('fadePInfo').style.display = 'block';
			$('html, body').scrollTop(0);
		}
		
		// ===== 개인정보 동의 폼 닫기 =====
		function closeFrm(){
			document.getElementById('lightPInfo').style.display='none';
			document.getElementById('fadePInfo').style.display='none';
		}
		
		// ===== 개인정보 동의 폼 허용 누르기  =====
		function accept() {
			
			$('#pInfo').removeAttr('onclick');
			$('#pInfo').html("개인정보 사용에 동의하였습니다.");
			$('#pInfo').css("color", "#6c757d");
			$("#pInfoCheck").val("true");
			closeFrm();
			
		}
		
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
	    }
	   
	
</script>

</body>
</html>