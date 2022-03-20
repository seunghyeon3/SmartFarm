<!doctype html>
<%@page import="jdk.jfr.Percentage"%>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../resources/images/favicon.png">
<title>ECO HTML</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<style type="text/css">
input {
	border: none;
	width: 100%;
}
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
</head>


<body>


	<div class="wrapper">

		<!--Causes Start-->
		<section class="wf100 p80 blog">



			<div class="projects-grid"></div>
			<div class="container">
				<h1>키트 관리</h1>

				<br> <br>
				<div class="row">
					<div class="col-md-7 col-sm-6"></div>

					<div class="col-md-5 col-sm-1">

						<div class="side-search">

							<input type="search" id="searchKit" class="form-control"
								placeholder="키트 이름을 입력하세요" style="margin: 0 10px; float: left;">
							<button onclick="searchKit()">
								<i class="fas fa-search"></i>
							</button>

						</div>
					</div>




					<!-- 표 -->
					<div class="col-md-12 col-sm-6" style="padding: 20px; z-index: 1;">
						<div id="grid" style="width: 100%;"></div>
					</div>
					<div class="col-md-8 col-sm-8"></div>
					<div class="col-md-4 col-sm-4">
						<div class="wf100 comment-form">
							<ul>
								<li class="w3 np"><button onclick="openInstP()"
										class="post-btn" style="width: 200px; margin: 0 150px;">키트등록</button></li>

							</ul>
						</div>
					</div>
				</div>


			</div>
		</section>
		<!--Causes End-->



	</div>

	<!-- 팝업창 -->
	<div id="lightInstP" class="col-md-12 white_content"
		style="text-align: center; height: 800px; top: 70px; z-index: 3;">


		<div style="text-align: center;">
			<h3 style="text-align: center;">
				키트등록 <a href="" style="float: right; font-size: small;"
					onclick="close()">Close
				</a>
			</h3>

		</div>
		<br>

		<div class="blog-single-content"
			style="width: 80%; display: inline-block;">
			<form action="kitInsert.do" method="post"
				enctype="multipart/form-data">

				<div class="single-post-tags wf50" style="margin-bottom:15px;">
				
					<a onclick="changeCol(this)" id="business" style="background-color: #66bb6a;color:#f8f9fa">상업용</a>&nbsp;&nbsp;&nbsp; <a
						onclick="changeCol(this)" id="hobby" style="background-color: #f8f9fa;color:#666666">취미용</a>
				</div>

				<table class="GeneratedTable" style="margin: 0;">
					<tbody>
						<tr>
							<th>작물종류</th>
							<td><select class=" full form-control" id="kit_plant_class"
								name="kit_plant_class"
								style="border: none; padding: 0; height: 22px;">
									<option value="채소">채소</option>
									<option value="과일">과일</option>
							</select>
						</tr>
						<tr>
							<th>키트이름</th>
							<td><input type="text" id="kit_name" name="kit_name"></td>
						</tr>
						<tr>
							<th>작물이름</th>
							<td><input type="text" id="kit_plant_name"
								name="kit_plant_name"></td>
						</tr>
						<tr>
							<th>재배기간</th>
							<td><input type="number" id="kit_grow_day"
								name="kit_grow_day"></td>
						</tr>
						<tr>
							<th>적정온도</th>
							<td><input type="number" id="kit_tp" name="kit_tp"></td>
						</tr>
						<tr>
							<th>습도</th>
							<td><input type="number" id="kit_hd" name="kit_hd"></td>
						</tr>
						<tr>
							<th>일사량</th>
							<td><input type="number" id="kit_sun" name="kit_sun"></td>
						</tr>
						<tr>
							<th>급액량</th>
							<td><input type="number" id="kit_water" name="kit_water"></td>
						</tr>
						<!-- 상업용에만 있는 컬럼 -->
						<tr class="forC">
							<th>농약량</th>
							<td><input type="number" id="kit_pes" name="kit_pes"></td>
						</tr>
						<!-- 상업용에만 있는 컬럼 -->
						<tr class="forC">
							<th>cctv</th>
							<td><input type="text" id="kit_cctv" name="kit_cctv"
								value="Y" readonly></td>
						</tr>
						<tr>
							<th>키트 가격</th>
							<td><input type="number" id="kit_price" name="kit_price"></td>
						</tr>
						

						
						<tr>
							<th>대표 이미지</th>
							<td><div class="filebox preview-image" >
										<input class="upload-name" value="파일선택" disabled="disabled"style="height:35px; width:80%;float: left; display:inline-block; margin-bottom:0;">
										<label for="img" style="float:right;height:35px;padding-top: 5px;">업로드</label> <input type="file"
											id="img" name=img class="upload-hidden">
									</div></td><!-- <input type="file" id="kit_main_img" name="img"> -->
						</tr>
						<tr>
							<th>설명 이미지</th>
							<td><div class="filebox preview-image" >
										<label for="img" style="float:right;height:35px;padding-top: 5px; float:left;">업로드</label>
										<input class="upload-name" value="파일선택" disabled="disabled"style="float:left; height:35px; width:65%;float: left; display:inline-block; margin-bottom:0;">
										
										<input type="file"
											id="img" name=img class="upload-hidden">
									</div></td><!-- <input type="file" id="kit_exp_img" name="img"> -->
						</tr>

						<!-- hidden 영역 -->
						<tr style="display: none;">
							<th>판매여부</th>
							<td><input type="text" value="Y" id="kit_sale_whet"
								name="kit_sale_whet"></td>
						</tr>

						<tr style="display: none;">
							<th>조회수</th>
							<td><input type="text" value=0 id="kit_hit" name="kit_hit"></td>
						</tr>
						<tr style="display: none;">
							<th>판매수</th>
							<td><input type="text" value=0 id="kit_sale_count"
								name="kit_sale_count"> <input type="text" id="kit_prpos"
								name="kit_prpos" value="상업용"></td>
						</tr>
					</tbody>


				</table>

				<div class="wf100 comment-form"
					style="width: 80%; text-align: center;">

					<ul style="width: 100%; height:80px;">
						<li class="w2 np"></li>
						<li class="w3 np" style="float: right"><button
								class="post-btn" type="submit">키트등록</button></li>

						<li class="w3 np" style="float: right">
							<button type="button" onclick="close()" class="post-btn"
								style="background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">취소</button>
						</li>
					</ul>

				</div>
			</form>
		</div>
	</div>


	<div id="fadeInstP" class="black_overlay loading" style="z-index: 2;"></div>


	<!--   JS Files Start  -->
	<script type="text/javascript"
		src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
	<script type="text/javascript"
		src="https://uicdn.toast.com/tui.pagination/v3.3.0/tui-pagination.js"></script>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
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
	//=====닫기 =====
	function close() {
		document.getElementById('lightInstP').style.display='none';
		document.getElementById('fadeInstP').style.display='none';
	}
	
	//=====팝업창=====
	function openInstP() {
		document.getElementById('lightInstP').style.display = 'block';
		document.getElementById('fadeInstP').style.display = 'block';
		//농부신청 클릭시 페이지 최상단으로 이동.
		window.scrollTo(0, 0);
	}	
	
	// ===== 표 출력 ======
		var grid = new tui.Grid({
			rowHeight : 'auto',
			el : document.getElementById('grid'),
			rowHeaders : [ 'rowNum' ],//번호 매기기
			scrollX : false,
			scrollY : false,
			columnOptions : {
				rowHeight : 50
			},
			columns : [ {
				header : '키트 번호',
				name : 'kit_no',
				sortingType : 'asc',
				sortable : true,
				display : false
			}, {
				header : '키트 이름',
				name : 'kit_name',
				sortingType : 'desc',
				sortable : true
			}, {
				header : '용도',
				name : 'kit_prpos',
				align: 'center',
				width : '135',
				filter : 'select'
			},
			
			{
				header : '분류',
				name : 'kit_plant_class',
				align: 'center',
				width : '135',
				filter : 'select'
			}, 
			
			{
				header:'조회수',
				name : 'kit_hit',
				align: 'right',
				width : '145',
				sortingType : 'desc',
				sortable : true
				
			},
			{
				header:'판매수',
				name : 'kit_sale_count',
				align: 'right',
				width : '145',
				sortingType : 'desc',
				sortable : true
				
			},
			{
				header : '관리',
				name : 'kit_sale_whet',
				width : '200',
				sortingType : 'desc',
				sortable : true

			} ],
			columnOptions : {
				resizable : true
			},
			pageOptions: {
		        useClient: true,
		        perPage: 5
		    }

		});

		// 표 데이터
		var gridData = ${kitSelectList};

		//데이터 입력
		grid.resetData(gridData);
		grid.hideColumn('kit_no', 'kit_no');
		
		
		//표에 버튼 넣기
		function changeValue() {
			var table = $('table');

			for (var i = 0; i < gridData.length; i++) {
				console.log(grid.getValue(i, 'kit_sale_whet'));

				if (grid.getValue(i, 'kit_sale_whet') == 'Y') {// 내리기
					var input = '<div class="container" style="text-aline:center;"> <a id="N" data-key='+i+' onclick="enroll(this)" class="read-post" style="padding:0 0px 12px 35px; width: 80px; height:30px;  margin-left:23px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">내리기</a></div>';
					grid.setValue(i, 'kit_sale_whet', input, true);

				} else { //올리기
					var input = '<div class="container" style="text-aline:center;"> <a id="Y" data-key='+i+' onclick="enroll(this)" class="read-post" style="width: 80px; color: #f8f9fa; height:30px; padding:0 0px 12px 35px; margin-left:23px;">올리기</a></div>';
					grid.setValue(i, 'kit_sale_whet', input, true);
				}

			}
		}

		changeValue();

		// Kit 판매 올리기 내리기
		function enroll(e) { // Y
			
			//필요한 값 가져오기
			var id = e.id;//whet Y N를 받아옴
			var key = e.dataset.key;//키트 번호 찾기 위한 rowKey
			
			key = key*1;//key를 번호로 바꾸기
		
			//fetch 돌리기
			var kit_no = grid.getValue(key, 'kit_no');
			console.log(kit_no);
			var data = JSON.stringify({kit_no : kit_no, kit_sale_whet: id});
			
			fetch("adminKitSaleWhet.do",
					{
						method:'post',
						body: data 
					})
					.then(response => response.json())
					.then(function (result) {
						
						if(result == '1'){//성공했을 때 버튼 바꾸기 (올리기->내리기 | 내리기->올리기)
							if (id == 'Y') {//내리기
								var input = '<div class="container" style="text-aline:center;"> <a id="N" data-key='+key+' onclick="enroll(this)" class="read-post" style="margin-left:23px; padding:0 0px 12px 35px; width: 80px; height:30px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">내리기</a></div>';
								grid.setValue(key, 'kit_sale_whet', input, true);
	
							} else { //올리기
								var input = '<div class="container" style="text-aline:center;"> <a id="Y" data-key='+key+' onclick="enroll(this)" class="read-post" style="margin-left:23px; color: #f8f9fa; width: 80px; height:30px; padding:0 0px 12px 35px;">올리기</a></div>';
								grid.setValue(key, 'kit_sale_whet', input, true);
								
							}
							
						} else {
							toastr.error('오류가 발생했습니다. 다시 시도해주세요.');
						}
					})
			 
		}
		
		
		//키트 검색
		function searchKit() {
			var search = $("#searchKit").val();
			
			$.ajax({
				type:'post',
				url:"adminKitSearch.do",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data :{
					"kit_name": search
					}
				
			}).done( function (result) {
				console.log(result);
				var res = JSON.parse(result);
				console.log(res);
				grid.resetData(res);
				changeValue();
			} )
			
		}
		
		//===== 상업용 취미용 컬럼 바꾸기 ===== 
		function changeCol(e) {
			console.log(e.id);
			var id = e.id;
			var forC = document.getElementsByClassName('forC'); // 상업용 컬럼 가져오기
			var cctv = document.getElementById('kit_cctv');
			var kitPrpos = document.getElementById('kit_prpos');
			if(id == 'business'){//상업용인 경우
				//상업용 컬럼 보이게 하기
				for(var i =0;i<forC.length;i++){
					forC[i].style.display= '';
				}
				// 상업용 취미용 버튼 css 수정하기
				document.getElementById('business').style.backgroundColor = '#66bb6a'
				document.getElementById('business').style.color = '#f8f9fa' 
				document.getElementById('hobby').style.backgroundColor = '#f8f9fa'
				document.getElementById('hobby').style.color =  '#666666'
				cctv.value = "Y";
				kitPrpos.value="상업용";
				
			} else {// 취미용인경우
				//상업용 컬럼 안보이게 하기
				for(var i =0;i<forC.length;i++){
					forC[i].style.display= 'none';
				}
				// 상업용 취미용 버튼 css 수정하기
				document.getElementById('business').style.backgroundColor = '#f8f9fa'
				document.getElementById('business').style.color =  '#666666'//66bb6a
				document.getElementById('hobby').style.backgroundColor =  '#66bb6a'
				document.getElementById('hobby').style.color = '#f8f9fa'
				cctv.value = "";
				kitPrpos.value="취미용";
			}
			
		}
	</script>
</body>


</html>