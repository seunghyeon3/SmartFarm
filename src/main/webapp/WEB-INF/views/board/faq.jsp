<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>FAQ</title>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
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

.full {
	display: inline-block;
	text-align: center;
}

.filebox {
	float: right;
}
</style>
</head>
<body>
	<div class="container p80">
		<div class="col-lg-9 col-md-8 side-widget"></div>
	</div>
	<section class="shop wf100 p80">
		<div class="container">
			<h1>FAQ</h1>
			<div class="row" id="prolist">
				<div class="col-md-6 col-sm-6"></div>
				<div class="col-md-6 col-sm-1">
					<div class="side-search">
						<!--<form action="noticeSearch.do" method="post"> -->
						<select class="form-control" id="key" name="key"
							style="width: 120px; float: left">
							<!--<option value="faq_con">내용</option>  -->
							<option value="faq_title">제목</option>
						</select> <input type="search" id="val" name="val" class="form-control"
							placeholder="검색"
							style="margin: 0 10px; width: 380px; float: left;">
						<button onclick="searchFnc()" type="submit">
							<i class="fas fa-search"></i>
						</button>
						<!-- </form> -->
					</div>
				</div>
				<div class="col-md-12 col-sm-6" style="padding: 20px;">
					<!-- grid 불러오기 -->
					<div id="grid"></div>
					<c:if test="${member.mem_athr eq 'B0'}">
					<a href="faqinsertForm.do" class="view-more"
						style="color: white; cursor: pointer;">글쓰기</a> 
					<a href="javascript:void(0)" onclick="deleteCheck()"
						class="view-more" style="color: white; cursor: pointer;">삭제</a>
					</c:if>
				</div>
				</div>
			</div>
	</section>

	<div></div>
	<!-- 4 -->
	<script>
		//표 출력
	const faqData = [ 
		<c:forEach var="values" items="${faq}"  varStatus="status" >  //foreach for문 

			 { 
				faq_no : '${values.faq_no}' ,     //번호
				faq_title : '${values.faq_title}' ,   //제목
			    _children : [ 						//자식 안에 번호 내용
			      { 
			    	 faq_no : '${values.faq_no}' ,
			        faq_title : '${values.faq_con}'
			      } ,
			      
			    ] 
			  }  

			  <c:if test="${status.last ne ture}" >,</c:if>  
		</c:forEach>
	];
	const grid = new tui.Grid({
	  rowHeight : 'auto',
	  rowWidth : 'auto',
      el: document.getElementById('grid'),
      //data: ${faq},
      data : faqData,
      rowHeaders: ['checkbox'], 
      bodyHeight: 500,
      treeColumnOptions: {
    	    name: 'faq_title',
    	    useCascadingCheckbox: true,
    	    indentWidth:22,
    	    rowHeight : 50,
    	    },
      columns: [
        /* {
          header: '번호',
          name: 'faq_no',
          width: 300
        }, */
        {
          header: '제목',
          name: 'faq_title'
        },{
        	header:'버튼',
        	name:'faq_button'
        }],
      columnOptions : {
			resizable : true
		},
		pageOptions: {
	        useClient: true,
	        perPage: 20
	    }
    });
	

	 function deleteCheck(){
		var checkArr = [];
		checkArr = grid.getCheckedRows();
		var checkLength = checkArr.length;
		alert("삭제하시겠습니까");
		var testNo = checkArr[0].faq_no;
		console.log(checkArr[0].faq_no);
		
		location.href="faqdelete.do?faq_no="+testNo;
	
	}
	function searchFnc() {
		var searchKey = $("#key option:selected").val();
		var searchVal = $("#val").val();
		console.log(searchKey + " : " + searchVal);
		data = JSON.stringify({key : searchKey, val : searchVal});
		fetch("faqSearch.do",
				{
					method:'POST',
					body : data
						
				})
			.then(response => response.json())
			.then(function (result) {
				//console.log(result);
				grid.resetData(result);
			})
	}
 </script>
</body>
</html>