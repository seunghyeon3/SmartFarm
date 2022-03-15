<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


						<form name="memInsert" id="memInsert">
							<!--method="post"
							onsubmit="return checkRequired();"-->

							<ul class="cform">
								<li class="half pr-15"><input type="email"
									class="form-control" id="mem_email" name="mem_email"
									placeholder="이메일" required></li>

								<li class="half pl-15">
									<button type="button" onclick="checkEmail()" id="checkEmailFnc"
										class="fsubmit">이메일 확인</button>
								</li>

								<li class="half pr-15"
									style="padding-bottom: 0; margin-bottom: 10px;"><input
									type="password" class="form-control" id="mem_pw" name="mem_pw"
									placeholder="비밀번호" required></li>
								<li class="half pl-15"
									style="padding-bottom: 0; margin-bottom: 10px;"><input
									type="password" class="form-control" id="mem_pw_check"
									name="mem_pw_check" placeholder="비밀번호 확인" required></li>
								<li class="full" style="margin-left: 10px;"><span
									style="color: #f53738;">비밀번호는 대, 소문자, 숫자, 특수문자를 조합하여
										입력해주세요</span></li>

								<li class="half pr-15"><input type="text"
									class="form-control" id="mem_name" name="mem_name"
									placeholder="이름" required></li>


								<!-- 핸드폰 번호 -->
								<li class="half pl-15"><input type="text"
									class="form-control"
									style="width: 117px; float: left; -webkit-appearance: none;"
									id="mem_tel1" max="9999" name="mem_tel1" required> <span
									style="float: left; margin: 15px;">&mdash;</span> <input
									type="text" max="9999" class="form-control"
									style="width: 118px; float: left" id="mem_tel2" name="mem_tel2"
									required><span style="float: left; margin: 15px;">&mdash;</span>
									<input type="text" class="form-control" max="9999"
									style="width: 118px; float: left" id="mem_tel3" name="mem_tel3"
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
								<li class="half pl-15"><input type="hidden" id="mem_addr3"
									name="mem_addr3" class="form-control" placeholder=""></li>

								<li class="full"><a href="javascript:void(0)"
									onclick="openPInfo()" id="pInfo">개인정보 동의</a></li>

								<li><input type="hidden" name="mem_email_check"
									id="mem_email_check"> <input type="hidden"
									name="mem_addr" id="mem_addr"> <input type="hidden"
									name="pInfoCheck" id="pInfoCheck" class="form-control"
									placeholder="개인정보 동의"></li>

								<li class="half pr-15">
									<button type="button" onclick="memberInsert()" class="fsubmit">회원가입</button>
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
	</div>

	<!-- 개인정보 동의 창 -->
	<div id="lightPInfo" class="col-md-12 white_content"
		style="padding: 20px; z-index: 2;">
		<h5 style="padding: 20px;">
			개인정보 동의 <a onclick="closeFrm()"
				style="float: right; color: blue; font-size: medium"> X </a>
		</h5>
		<br> <br>

		<div id="pInfo" class="container" style="overFlow: auto;">
			<c:forEach items="${pInfo }" var="in">
				<p>${in }</p>
			</c:forEach>
		</div>

		<div class="container" id=""
			style="text-aline: center; padding-top: 50px; margin: 0; text-align: center;">

			<!-- 승인 버튼 + 취소버튼 -->
			<div class="single-post-tags"
				style="padding: 0; margin: 0; text-align: center;">
				<a onclick="accept()" id=""
					style="background-color: #66bb6a; color: #ffffff; cursor: pointer;">동의</a>&nbsp; <a
					onclick="closeFrm()" id=""
					style="background-color: #e11f3e; color: #ffffff; cursor: pointer;">취소</a>
			</div>

		</div>




	</div>

	<div id="fadePInfo" class="black_overlay" style="z-index: 1;"></div>

	<script>
		//=====카카오 로그인으로 들어오는 경우 ===== 
		$(document).ready(function () {
			var mem_email = $.urlParam('mem_email');
			$("#mem_email").val(mem_email);
			
			$('#checkEmailFnc').removeAttr('onclick');
			$('#checkEmailFnc').css('background-color', '#6c757d');
			$('#mem_email_check').val("true");
			
		});
		
		// ===== url 자르는 함수 ===== 
		$.urlParam = function(name){
		    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
   		 	return results [1] || 0;
		}


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
		
		//mem_pw에서 focusout 될때마다 유효성 검사하기
		$('#mem_pw').focusout(function () {
			checkPw();
		})
		
		// ===== 비밀번호 확인 체크 =====
		$('#mem_pw_check').focusout(function () {
			var mem_pw = $('#mem_pw').val();
	 		var mem_pw_check = $('#mem_pw_check').val();

	 		if(mem_pw !== mem_pw_check){
	 			toastr.error('비밀번호가 일치하지 않습니다');
	 		}
		});
		
		//memberInsert하기!
		function memberInsert() {
			console.log("memberInsert 들어감!!!! ");
			if(checkRequired() == true){
				console.log("확인하기!!!!!!!!!!!!!")
				
				var memEmail = document.getElementById('mem_email').value;
				var memPw = document.getElementById('mem_pw').value;
				var memName = document.getElementById('mem_name').value;
				var memTel = document.getElementById('mem_tel').value;
				var memAddr = document.getElementById('mem_addr').value;
				var memDetAddr = document.getElementById('mem_det_addr').value;
				var data = JSON.stringify({mem_email: memEmail,mem_pw : memPw, mem_name : memName,mem_tel : memTel,mem_det_addr : memDetAddr});
				
				$.ajax({
					url: "memberInsert.do",
					method : 'post',
					data :JSON.stringify( {
						"mem_email": memEmail,
						"mem_pw" : memPw, 
						"mem_name" : memName,
						"mem_tel" : memTel,
						"mem_addr" : memAddr,
						"mem_det_addr" : memDetAddr
					}),
				    contentType : "application/json; charset=utf-8",
				    dataType : "json",
					success:function(res){
						if(res === 1){
							alert('회원가입이 완료되었습니다.');
							location.href = 'home.do';
						}
					}
					
				});
				
			}
		} 
		
			
	 	// ===== 회원가입 버튼 누르기 전에 확인하기 =====
	   	function checkRequired() {
			
	 		//이메일 중복여부 확인
	 		var mem_email_check = $('#mem_email_check').val();
	 		var pInfoCheck = $("#pInfoCheck").val();
	 		
	 		if(mem_email_check !== 'true'){
	 			toastr.error('이메일 중복여부를 확인해주세요');
	 			return false;
	 			
	 		} else if(pInfoCheck !== 'true'){
	 			toastr.error('개인정보 이용을 동의해주세요');
	 			return false;
	 		} 
	 		
	 	
	 		checkPw();
	 		
	 		var mem_tel = document.getElementById('mem_tel1').value +"-"+document.getElementById('mem_tel2').value 
			+"-"+document.getElementById('mem_tel2').value ;
			document.getElementById('mem_tel').value = mem_tel;
	 		
	 		return true;
	 		
	    } 
	
		// ===== 입력한 이메일이 사용 가능한지 =====
		function checkEmail() {
			var memEmail = $("#mem_email").val();
			console.log(mem_email)
			var Menu = "homePage";
			var data = JSON.stringify({ mem_email: memEmail, menu: Menu});
			var mem_email_reg = memEmail.search(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
			
			if(mem_email_reg < 0){
				toastr.error('유효한 이메일 형식을 입력하세요');
			} else {
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
							
						}else{
							toastr.error('이미 사용중인 이메일입니다');
						}
					});
			}
			
			
			
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