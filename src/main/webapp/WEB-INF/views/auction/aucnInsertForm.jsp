<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>    
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
                        <form action= "aucnInsert.do" method="post" id = "aucnInsert">
	                        <ul class="cform">
		                        <li class="full">
		                        	<input type="hidden" id="nft_no" name="nft_no" value="${nftVo.nft_no }">
		                        </li>
	                        <li class="full" style="margin-bottom:10px;"><span
									style="color: #666666; font-size: large; margin-left: 10px;">&lt; 제목 &gt;</span></li>
	                           <li class="full">
	                              <input type="text" id="aucn_title" name="aucn_title" class="form-control" placeholder="제목" oninvalid="toastr.error('제목을 입력해주세요')" >
	                           </li>
	                           <li class="full" style="margin-bottom:10px;"><span
									style="color: #666666; font-size: large; margin-left: 10px;">&lt; 내용 &gt;</span></li>
	                          <li class="full">
	                              <textarea class="textarea-control" id="aucn_con" name="aucn_con" placeholder="내용" oninvalid="toastr.error('내용을 입력해주세요')" ></textarea>
	                           </li>
	                           <li class="half pr-15" style="margin-bottom:10px;"><span
									style="color: #666666; font-size: large; margin-left: 10px;">&lt; 경매시작금액 &gt;</span></li>
	                           <li class="half pr-15" style="margin-bottom:10px;"><span
									style="color: #666666; font-size: large; margin-left: 10px;">&lt; 경매시작시간 &gt;</span></li>
	                           <li class="half pr-15">
	                              <input type="number" step="0.1" id="first_bid" name="first_bid" class="form-control" placeholder="경매시작금액  [ wei ]" oninvalid="toastr.error('금액을 입력해주세요')" >
	                           </li>
	                           <li class="half pr-15">
	                          	<div class="filebox" >
								</div>
	                           	  <div id="aucn_start_time" style="text-align:center;"></div>
	                              <input type="hidden" id="aucn_start_time" name="aucn_start_time" class="form-control" value="<%= sf.format(nowTime) %>"	 >
	                           </li>
	                            
	                           <li class="full">
	                              <input type="button" value="등록" class="fsubmit" onclick="metamaskCheck()">
	                              
	                           </li>
	                        </ul>
	                       </form>
                     </div>
                  </div>
            <div id="fade" class="black_overlay loading"></div>
               </div>
            </div>
         </section>
         	<script
				src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js">
			</script>
			<script src="resources/js/NFTAuction.js"></script>
         <script>
         
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
         
         async function metamaskCheck(){
        	 var result = false;
	        	//메타마스크 로그인체크
	        	await web3.eth.getAccounts( function(err,accs){
		             if(err != null){
		                 alert('There was an error fetching your accounts.');
		             }else if(accs.length ===0){
		                 alert("NFT 생산을 위해 메타마스크 로그인을 해주세요");
		             }else{
		             	account = accs[0];
		             	
	             	 createLoading();
	          		 NFTAuction.methods.NFTAuction(account,'${aucnNo}',account,0,0,false)
	 					.send({from: account, })
	 					.then( function(result){
	 						console.log(result);
	 		        		alert("경매가 정상적으로 등록되었습니다.");
	 		        		aucnInsert.submit();
	 					});	
		             }
		         })
	        	
	        	
	         }
         	
	         $(document).ready( function () {
	             $('#aucn_start_time').dateTimePicker();
	         })
	         
	         function timerFunc(func, dateTime){
				//ex) timerFunc(function(){console.log('test');},'20210108144740');
			    //시간은 24시간을 기준으로 입력하여야 합니다.
			    var year = Number(dateTime.substring(0,4));
			    var month = Number(dateTime.substring(4,6));
			    var day = Number(dateTime.substring(6,8));
			    var time = Number(dateTime.substring(8,10));
			    var minute = Number(dateTime.substring(10,12));
			    var second = Number(dateTime.substring(12,14));
			     
			    var oprDate = new Date(year, month-1, day, time, minute, second); //동작을 원하는 시간의 Date 객체를 생성합니다.
			    var nowDate = new Date();                                         //현재 날짜와 시간을 확인
			     
			    var timer = oprDate.getTime() - nowDate.getTime(); //동작시간의 밀리세컨과 현재시간의 밀리세컨의 차이를 계산합니다.
			    if(timer < 0){ //타이머가 0보다 작으면 함수를 종료합니다.
			       return;
			    }else{
			       setTimeout(func, timer);
			    }
			}
	         
	       
	         
         </script>
</body>
</html>