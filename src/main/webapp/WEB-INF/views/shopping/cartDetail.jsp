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
<!-- CSS FILES START -->

<!-- CSS FILES End -->
<style type="text/css">
.radioCss {
	width: 50px;
	padding: 20px;
	font-size: 1.2em;
}

/*radio 버튼 색상변경 */
input[type='radio'] {
	-webkit-appearance: none;
	width: 16px;
	height: 16px;
	border: 1px solid darkgray;
	border-radius: 50%;
	outline: none;
	background: #e6e6e6;
}

input[type='radio']:before {
	content: '';
	display: block;
	width: 60%;
	height: 60%;
	margin: 20% auto;
	border-radius: 50%;
}

input[type='radio']:checked:before {
	background: #1b5e20;
}

input[type="checkbox"]:checked {
	background-color: black;
	border-color: black;
	color: white;
}

input[type="checkbox"]:checked::before {
	border-radius: 2px;
	transform: scale(1) translate(-50%, -50%)
}

input[type="number"] {
	height: 60%;
	width: 90%;
	padding: 6px 7px;
	border: solid 1px #ddd;
}

.checkList {
	font-size: 1.2em;
}

.inner {
	width: 150px;
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

						<input type="button" value="선택주문" name="Add to Cart"
							style="padding: 10px 30px; margin-right: 25px; margin-left: 50px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a; border-radius: 5px; cursor: pointer">
						<input type="button" value="전체주문" name="Add to Cart"
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
		
		
		var grid = new tui.Grid({
			el : document.getElementById('grid'),
			scrollX : false,
			scrollY : false,
			rowHeaders : [ 'checkbox' ],
			
			columns : [ {
				header : '상품정보(사진 + 이름 링크달기)',
				name : 'cart_detail'
			}, {
				header : '판매가',
				name : 'cart_price'
			}, {
				header : '수량',
				name : 'cart_sale_count'
				,
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
				name : 'cart_option'
			}

			]
		});

		
		// GRID 에 데이터를 입력한다.
		
		var gridData = ${cartSelectList}
		
		  

		grid.resetData(gridData);

		// 판매가와 총액에 콤마 찍기
		function setMoney() {
			
			for(var i =0; i < gridData.length;i++){
				
				var price = parseInt(grid.getValue(i, 'cart_price')).toLocaleString('ko-KR');
				grid.setValue(i, 'cart_price', price, true);
				var sum = parseInt(grid.getValue(i, 'cart_sum')).toLocaleString('ko-KR');
				grid.setValue(i, 'cart_sum', sum, true);
				
			}
			
		}
		setMoney();
		
		//삭제버튼 넣기
		function setDelete() {
			var input = '<div class="container" style="text-aline:center;"> <a onclick="" class="read-post" style="padding:0 0px 12px 35px; width: 80px; height:30px; background-color: #f8f9fa; color: #66bb6a; border: 1px solid #66bb6a;">내리기</a></div>';
			//grid.setValue(1, 'cart_option', input, true);
		}
		setDelete();
		
		//input의 값이 변화되면 cart_sum을 변화시켜주는 함수
		function changePrice(e) {
			
			var rowKey = e.rowKey;//행번호
			var value = parseInt(e.value);//input에 입력된 값
			var price = parseInt(grid.getValue(rowKey, 'cart_price').replaceAll(",",""));// 판매가에서 콤마 빼기
			var afterPrice = (price * value).toLocaleString('ko-KR');// 변경될 값
			
			grid.setValue(rowKey, 'cart_sum', afterPrice, true);
			
		}
		
	   
	</script>


</body>


</html>