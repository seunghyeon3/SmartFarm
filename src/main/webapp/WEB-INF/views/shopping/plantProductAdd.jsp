<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: white;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #66bb6a;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
} /* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

/* imaged preview */
.filebox .upload-display { /* 이미지가 표시될 지역 */
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img { /* 추가될 이미지 */
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}
</style>
<body>


<section class="contact-page wf100 p80">
            <div class="container">
               <div class="row">
                  <div class="col-md-1"></div>
                  <div class="col-md-10">
                     <div class="contact-form mb60">
                        <h3>작물 판매 등록</h3>
                        <form action="plantSaleInsert.do" onsubmit="return check();" method="post" enctype="multipart/form-data">
	                        <ul class="cform">
	                       	   <li class="full">
	                       	   <span style="margin:10px 15px;color:#666666;font-size:large;">작물목록</span>
	                            
	                       	   		<select style="margin-top:10px;" class=" full form-control" id="plant_no" name="plant_no" onchange="selectFnc(this)">
	                       	   			<option value="-1">작물목록</option>
		                       	   		<c:forEach var="list" items="${selectMemList}">
											<option value="${list.plant_no }"> 작물 종류 : ${list.plant_name } | 등급 : ${list.plant_grd } | 재고 : ${list.plant_ivy } | 총 재배량 : ${list.plant_tot_grow_amnt }</option>
										</c:forEach>
									</select>
	                       	   </li>
	                           <li class="full">
	                           		<span style="margin:10px 15px;color:#666666;font-size:large;">제목</span>
	                              <input type="text" style="margin-top:10px;" id="plant_sale_title" name="plant_sale_title" class="form-control"  oninvalid="toastr.error('제목을 입력해주세요')" required>
	                           </li>
	                           <li class="half pr-15">
	                           		<span style="margin:10px 15px;color:#666666;font-size:large;">가격</span>
	                              <input type="number" style="margin-top:10px;" id="plant_sale_price" name="plant_sale_price" class="form-control"   min="0" oninvalid="toastr.error('가격을 입력해주세요')"  required>
	                           </li>
	                           <li class="half pl-15">
	                           	<span style="margin:10px 15px;color:#666666;font-size:large;">수량</span>
	                              <input type="number" style="margin-top:10px;" id="plant_count" name="plant_count" class="form-control"   min="1" oninput="countCheck()" oninvalid="toastr.error('수량을 입력해주세요')" required>
	                           </li>
	                            <li class="full">
	                            <span style="margin:10px 15px;color:#666666;font-size:large;">내용</span>
	                              <textarea class="textarea-control" style="margin-top:10px;" id="plant_sale_con" name="plant_sale_con" oninvalid="toastr.error('내용을 입력해주세요')" required></textarea>
	                           </li>
	                           <!-- 파일업로드 버튼 구성 -->
							   <li class="full">
									<div class="filebox preview-image" style="float:right;margin-bottom: 30px;">
										<input class="upload-name" value="파일선택" disabled="disabled">
										<label for="oriFile">업로드</label> <input type="file"
											id="oriFile" name=oriFile class="upload-hidden">
									</div>
								</li>

							   <!-- hidden 목록 -->
		                       <sec:authorize access="isAuthenticated()">
									<sec:authentication property="principal" var="member"/>
									<input type="hidden" id="mem_email" name="mem_email"
										value="${member.mem_email}">
									<input type="hidden" id="mem_name" name="mem_name"
										value="${member.mem_name }">
									<input type="hidden" id="plant_sale_plant_class"
										name="plant_sale_plant_class">
								</sec:authorize>
								<li class="half pr-15">
	                              <input type="submit" onclick="back()" value="취소" style="background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;" class="fsubmit">
	                           </li>
	                           <li class="half pl-15">
	                              <input type="submit" value="등록" class="fsubmit">
	                           </li>
	                        </ul>
	                       </form>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         
         <script type="text/javascript">
         // ===== 파일 업로드 =====
         $(document).ready(function(){
  		   var fileTarget = $('.filebox .upload-hidden');

  		    fileTarget.on('change', function(){
  		        if(window.FileReader){
  		            // 파일명 추출
  		            var filename = $(this)[0].files[0].name;
  		        } 

  		        else {
  		            // Old IE 파일명 추출
  		            var filename = $(this).val().split('/').pop().split('\\').pop();
  		        };

  		        $(this).siblings('.upload-name').val(filename);
  		    });

  		    //preview image 
  		    var imgTarget = $('.preview-image .upload-hidden');

  		    imgTarget.on('change', function(){
  		        var parent = $(this).parent();
  		        parent.children('.upload-display').remove();

  		        if(window.FileReader){
  		            //image 파일만
  		            if (!$(this)[0].files[0].type.match(/image\//)) return;
  		            
  		            var reader = new FileReader();
  		            reader.onload = function(e){
  		                var src = e.target.result;
  		                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
  		            }
  		            reader.readAsDataURL($(this)[0].files[0]);
  		        }

  		        else {
  		            $(this)[0].select();
  		            $(this)[0].blur();
  		            var imgSrc = document.selection.createRange().text;
  		            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

  		            var img = $(this).siblings('.upload-display').find('img');
  		            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
  		        }
  		    });
  		});
         
         //뒤로가기 버튼
         function back() {
        	 window.history.back();
		}
         	
         	// ===== 폼 넘기기 전에 확인할 목록 =====
         	function check() {
         		//작물 입력 안한 경우
				var plant_no = $("#plant_no").val();
				if(plant_no === '-1'){
					toastr.error('판매할 작물을 입력해주세요');
					return false;	
				}
				
				return true;
			}
         
         	// ===== 입력한 작물 개수가 수량보다 많은 경우 =====
         	function countCheck() {
         		var list = ${selectMemScript}
         		
				var plant_count = $("#plant_count").val();
         		var index = $("#plant_no option").index($("#plant_no option:selected")) -1 ;
	
         		
         		if(index >= 0){
         			var max = Number(list[index].plant_ivy);
         			//alert(max);
         			
         			
         			if(plant_count > max){
    					toastr.error('재고보다 많은 수량을 판매할 수 없습니다');
    					$("#plant_count").val('');
    					return false;
    				}
         			return true;
         			
         		}
         		
				return true;
			}
         	
         	function selectFnc(e) {
         		var list = ${selectMemScript}
         		var index = $("#plant_no option").index($("#plant_no option:selected")) -1 ;
         		
         		var plant_sale_plant_class = list[index].plant_class
         		$("#plant_sale_plant_class").val(plant_sale_plant_class);
			}
         	
         	
         	
         </script>
         
</body>
</html>