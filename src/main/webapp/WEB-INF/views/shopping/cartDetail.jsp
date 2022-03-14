<!doctype html>
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
<style type="text/css">
.delBtn {
	padding: 3px 20px;
	background-color: #f53738;
	color: #f8f9fa;
	border: 1px solid #f53738;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 20px;
}
</style>
</head>

<body>


	<div class="wrapper">

		<!--Causes Start-->
		<section class="wf100 p80 blog">



			<div class="projects-grid"></div>
			<div class="container">
				<h1>장바구니</h1>

				<br> <br>
				<div class="row">
					<!-- 선택주문 전체주문 -->
					<div class="col-md-8 col-sm-6"></div>
					<div class="col-md-4 col-sm-6">

						<input type="button" id="select" onclick="buy(this)" value="선택주문"
							name="Add to Cart"
							style="padding: 10px 30px; margin-right: 25px; margin-left: 50px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a; border-radius: 5px; cursor: pointer">
						<input type="button" id="all" onclick="buy(this)" value="전체주문"
							name="Add to Cart"
							style="padding: 10px 30px; background-color: #66bb6a; color: #f8f9fa; border: 1px solid #66bb6a; border-radius: 5px; cursor: pointer">

					</div>

					<!-- 테이블 -->
					<div class="col-md-12 col-sm-6" style="padding: 20px;">
						<div id="grid"></div>
					</div>

				</div>
			</div>
		</section>
		<!--Causes End-->


	</div>



	<!--   JS Files Start  -->

	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

	<script>
		// GRID 를 생성한다.
		class CustomTextEditor {
	      	constructor(props) {
	        const el = document.createElement('input');
	        const { min } = props.columnInfo.editor.options;
	
	        el.type = 'number';
	        el.min = min;
	        el.value = String(props.value);

       	 	this.el = el;
      	}

      
      getElement() {
        return this.el;
      }

      getValue() {
        return this.el.value;
      }

      mounted() {
        this.el.select();
      }
    }
		
		var gridData = ${cartSelectList}
		
		var grid = new tui.Grid({
			el : document.getElementById('grid'),
			scrollX : false,
			scrollY : false,
			rowHeaders : [ 'checkbox' ],
			columns : [ {
				header : '상품정보',
				name : 'cart_detail'
			}, {
				header : '판매가',
				name : 'cart_price'
			}, {
				header : '수량',
				width : '130',
				name : 'cart_sale_count',
				editor: {
		            type: CustomTextEditor,
		            options: {
		              min: 1		            
		              }
		          }, 
		        onAfterChange(ev) {
		        	  changePrice(ev);
			      }
			}, {
				header : '합계',
				name : 'cart_sum'
			}, {
				header : '선택',
				width : '120',
				name : 'cart_option'
			}

			],
			pageOptions: {
		        useClient: true,
		        perPage: 5
		    }
		});

		
		// GRID 에 데이터를 입력한다.
		grid.resetData(gridData);

		// 판매가와 총액에 콤마 찍기
		function setGrid() {
			
			for(var i =0; i < gridData.length;i++){
				//판매가와 총액에 콤마찍기	
				var price = parseInt(grid.getValue(i, 'cart_price')).toLocaleString('ko-KR');
				grid.setValue(i, 'cart_price', price, true);
				var sum = parseInt(grid.getValue(i, 'cart_sum')).toLocaleString('ko-KR');
				grid.setValue(i, 'cart_sum', sum, true);	
				
				// /kitProductDetail.do?kit_no=1
				var cartOption = grid.getValue(i, 'cart_option');
				
				if(cartOption.includes('K')) {//키트 번호인 경우
					var link = "kitProductDetail.do?kit_no=";
					var kitNo = cartOption.substr(1);
					console.log( link + kitNo );
					
				} else { // 작물인 경우
					var link = "plantProductDetail.do?plant_no=";
					var plantNo = cartOption.substr(1);
					console.log( link+ plantNo);
				}
				
			}	
		}
		setGrid();
		
		//더블클릭하면 링크로 연결해주기
		grid.on('dblclick', (ev) => {
			
			console.log(ev);
			if(ev.columnName !== "cart_sale_count"){
		        var cartOption = gridData[ev.rowKey].cart_option;
		         
				if(cartOption.includes('K')) {//키트 번호인 경우
					var link = "kitProductDetail.do?kit_no=";
					var kitNo = cartOption.substr(1);
					location.href = link + kitNo;
					
				} else { // 작물인 경우
					var link = "plantProductDetail.do?plant_sale_no=";
					var plantNo = cartOption.substr(1);
					location.href = link + plantNo;
				} 
			
			}
			
		});//on dblclick
		
		//삭제 버튼 만들기
		function createDelBtn() {
			for (var i = 0; i < gridData.length; i++) {
				
				var input = '<button type="button" class="delBtn" data-key='+i+' id="'+grid.getValue(i, 'cart_option')+'" onclick ="delCart(this)"> 삭제 </button>'
				grid.setValue(i, 'cart_option', input, true);
			}
		}
		createDelBtn();
		
		// ===== 장바구니에서 삭제하기 ===== 
		function delCart(e) {
			
			console.log(e.id);
			console.log(e.dataset.key);
			
			var cartDetail = e.id; //plant kit 번호 받아오기
			var key = e.dataset.key;//rowKey 받아오기
			// console.log(grid.getRow(key));
			var url="cartDelete.do?cart_detail=" + cartDetail;
			
			$.ajax({
				method : 'get',
				url : url,
				/* data : {"cart_detail" : cartDetail}, */
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function (res) {
					if(res ==='1'){
						toastr.success('삭제되었습니다');
					} else {
						toastr.error('오류가 발생했습니다. 다시 시도해주세요');
					}
					location.reload();
				}
				
				
			});
			
		}		
		
		//input의 값이 변화되면 cart_sum을 변화시켜주는 함수
		function changePrice(e) {
			
			var rowKey = e.rowKey;//행번호
			var value = parseInt(e.value);//input에 입력된 값
			var price = parseInt(grid.getValue(rowKey, 'cart_price').replaceAll(",",""));// 판매가에서 콤마 빼기
			var afterPrice = (price * value).toLocaleString('ko-KR');// 변경될 값
			
			grid.setValue(rowKey, 'cart_sum', afterPrice, true);
			
		}
		
		// ===== 선택주문, 전체주문 ===== 
		function buy(e) {
			console.log(e.id);
			var check = e.id; //all 인지 select 인지 구분하기 위한 변수
			var checkArr = [];
			
			if(check === 'all') { //전체주문인 경우
				grid.finishEditing();
				grid.checkAll();
			}
			
			console.log(check);
			//체크된 값 가져오기
			checkArr = grid.getCheckedRows();
			
			// pay로 보내기 전에 데이터 가공하기
			var btnList = document.querySelectorAll('.delBtn');
			
			for(var i = 0; i < checkArr.length;i++){
				//price, sum, count를 String에서 Number 형식으로 변환
				var cartSum = (checkArr[i].cart_sum).replaceAll(",","");
				checkArr[i].cart_sum = parseInt(cartSum);
				
				var cartPrice = (checkArr[i].cart_price).replaceAll(",","");
				checkArr[i].cart_price = parseInt(cartPrice);
				
				checkArr[i].cart_sale_count = parseInt(checkArr[i].cart_sale_count);
				
				//cart_option 정리하기
				var row = checkArr[i].rowKey;
				checkArr[i].cart_option = btnList[row].id;
				
			}//for
			
			console.log(checkArr);
			localStorage.setItem("payList", JSON.stringify(checkArr));
			location.href = "pay.do";
			
		}
	 
	</script>
</body>
</html>