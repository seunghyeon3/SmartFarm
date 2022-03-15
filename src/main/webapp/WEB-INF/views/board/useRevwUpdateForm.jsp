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
                        <h3>이용 후기 수정</h3>
                        <form action="useRevwUpdate.do" method="post" enctype="multipart/form-data">
	                        <ul class="cform">
	                       	   <li class="full">
									<input class="form-control" value="${purHisSelect.pur_his_order_no } 상품 이름 : ${purHisSelect.product_name } | 가격 : ${purHisSelect.pur_his_price } | 수량 : ${purHisSelect.pur_his_sale_count } | 구매날짜 : ${purHisSelect.pur_his_pur_day }" readonly>
									<input type="hidden" id="pur_his_order_no" name="pur_his_order_no" value="${purHisSelect.pur_his_order_no }">
									<input type="hidden" id="use_revw_no" name="use_revw_no" value="${useRevwOne.use_revw_no }">
	                       	   </li>
	                           <li class="full">
	                              <input type="text" id="use_revw_title" name="use_revw_title" class="form-control" value="${useRevwOne.use_revw_title }" oninvalid="toastr.error('제목을 입력해주세요')" >
	                           </li>
	                            <li class="full">
	                              <textarea class="textarea-control" id="use_revw_con" name="use_revw_con" oninvalid="toastr.error('내용을 입력해주세요')" >${useRevwOne.use_revw_con }</textarea>
	                           </li>
	                           <!-- 파일업로드 버튼 구성 -->
	                           <li>
		                           <div class="filebox" style="float: right">
		  								<label for="file">사진 업로드</label>
		  								<input type="file" id="file" name="file">
								   </div>
							   </li>
                        		
	                           <li class="full">
	                              <input type="submit" value="수정" class="fsubmit">
	                           </li>
	                        </ul>
	                       </form>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <script>
         	
         </script>
</body>
</html>