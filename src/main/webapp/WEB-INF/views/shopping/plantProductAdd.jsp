<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
<body>


<section class="contact-page wf100 p80">
            <div class="container">
               <div class="row">
                  <div class="col-md-1"></div>
                  <div class="col-md-10">
                     <div class="contact-form mb60">
                        <h3>작물 판매 등록</h3>
                        <form action="plantSaleInsert.do" onsubmit="return check();" method="post">
	                        <ul class="cform">
	                       	   <li class="full">
	                       	   		<select class=" full form-control" id="plant_no" name="plant_no" onchange="selectFnc(this)">
	                       	   			<option value="-1">작물목록</option>
		                       	   		<c:forEach var="list" items="${selectMemList}">
											<option value="${list.plant_no }"> 작물 종류 : ${list.plant_name } | 등급 : ${list.plant_grd } | 재고 : ${list.plant_ivy } | 총 재배량 : ${list.plant_tot_grow_amnt }</option>
										</c:forEach>
									</select>
	                       	   </li>
	                           <li class="full">
	                              <input type="text" id="plant_sale_title" name="plant_sale_title" class="form-control" placeholder="제목" oninvalid="toastr.error('제목을 입력해주세요')" >
	                           </li>
	                           <li class="half pr-15">
	                              <input type="number" id="plant_sale_price" name="plant_sale_price" class="form-control" placeholder="가격"  min="0" oninvalid="toastr.error('가격을 입력해주세요')"  >
	                           </li>
	                           <li class="half pl-15">
	                              <input type="number" id="plant_count" name="plant_count" class="form-control" placeholder="수량"  min="1" oninput="countCheck()" oninvalid="toastr.error('수량을 입력해주세요')" >
	                           </li>
	                            <li class="full">
	                              <textarea class="textarea-control" id="plant_sale_con" name="plant_sale_con" placeholder="내용" oninvalid="toastr.error('내용을 입력해주세요')" ></textarea>
	                           </li>
	                           <!-- 파일업로드 버튼 구성 -->
	                           <li>
		                           <div class="filebox" style="float: right">
		  								<label for="ex_file">사진 업로드</label>
		  								<input type="file" id="ex_file">
								   </div>
							   </li>
		                        <input type="text" id="mem_email" name="mem_email" value="${member.mem_email}">
		                        <input type="text" id="mem_name" name="mem_name" value="${member.mem_name }">
		                        <input type="text" id="plant_sale_plant_class" name="plant_sale_plant_class">
                        		
	                           <li class="full">
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