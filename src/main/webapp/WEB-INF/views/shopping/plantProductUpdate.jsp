<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <h3>작물 판매 수정</h3>
                        <ul class="cform">
	                       	   <li class="full">
	                       	   			
								작물 종류 : ${plantSale.plant_name } | 등급 : ${plantSale.plant_grd } | 재고 : ${plantSale.plant_ivy } | 총 재배량 : ${plantSale.plant_tot_grow_amnt }
									
	                       	   </li>
	                           <li class="full">
	                              <input type="text" id="plant_sale_title" name="plant_sale_title" class="form-control" placeholder="제목" value="${ plantSale.plant_sale_title}" oninvalid="toastr.error('제목을 입력해주세요')" >
	                           </li>
	                           <li class="half pr-15">
	                              <input type="number" id="plant_sale_price" name="plant_sale_price" class="form-control" placeholder="가격"  min="0" value="${plantSale.plant }"oninvalid="toastr.error('가격을 입력해주세요')"  >
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
		  								<label for="oriFile">사진 업로드</label>
		  								<input type="file" id="oriFile" name="oriFile">
								   </div>
							   </li>
							   
							   <!-- hidden 목록 추후수정 -->
		                        <input type="hidden" id="mem_email" name="mem_email" value="${member.mem_email}">
		                        <input type="hidden" id="mem_name" name="mem_name" value="${member.mem_name }">
		                        <input type="hidden" id="plant_sale_plant_class" name="plant_sale_plant_class">
                        		
	                           <li class="full">
	                              <input type="submit" value="등록" class="fsubmit">
	                           </li>
	                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </section>
</body>
</html>