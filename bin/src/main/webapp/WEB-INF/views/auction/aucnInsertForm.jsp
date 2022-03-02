<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="resources/css/datetimepicker.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js" integrity="sha512-LGXaggshOkD/at6PFNcp2V2unf9LzFq6LE+sChH7ceMTDP0g2kn6Vxwgg7wkPP7AAtX+lmPqPdxB47A0Nz0cMQ==" crossorigin="anonymous"></script>
    <script type="text/javascript" src="resources/js/datetimepicker.js"></script>
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
                        <h3>NFT 경매 등록</h3>
                        <form action="aucnInsert.do" method="post">
	                        <ul class="cform">
		                        <li class="full">
		                        	<input type="hidden" id="nft_no" name="nft_no" value="${nftVo.nft_no }">
		                        </li>
	                           <li class="full">
	                              <input type="text" id="aucn_title" name="aucn_title" class="form-control" placeholder="제목" oninvalid="toastr.error('제목을 입력해주세요')" >
	                           </li>
	                          <li class="full">
	                              <textarea class="textarea-control" id="aucn_con" name="aucn_con" placeholder="내용" oninvalid="toastr.error('내용을 입력해주세요')" ></textarea>
	                           </li>
	                           <li class="half pr-15">
	                              <input type="number" id="aucn_first_bid" name="aucn_first_bid" class="form-control" placeholder="경매시작금액  [ eth ]" oninvalid="toastr.error('날짜를 입력해주세요')" >
	                           </li>
	                           <li class="half pr-15">
	                          	<div class="filebox" >
		  							경매 시작 시간 설정 
								</div>
	                           	  <div id="aucn_start_time" style="text-align:center;"></div>
	                              <input type="hidden" id="aucn_start_time" name="aucn_start_time" class="form-control" oninvalid="toastr.error('날짜를 입력해주세요')" >
	                           </li>
	                            
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
         
         <script>
         $(document).ready( function () {
             $('#aucn_start_time').dateTimePicker();
         })
         </script>
</body>
</html>